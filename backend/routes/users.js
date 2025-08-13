const express = require('express');
const { query, queryOne, execute } = require('../config/database');
const { authenticateToken, optionalAuth } = require('../middleware/auth');

const router = express.Router();

// Get all users (with pagination and search)
router.get('/', optionalAuth, async (req, res) => {
  try {
    const { page = 1, limit = 20, search = '', accountType } = req.query;
    const offset = (page - 1) * limit;

    let sql = 'SELECT id, username, first_name, last_name, profile_picture, bio, location, is_verified, account_type, created_at FROM users WHERE is_active = true';
    let params = [];

    if (search) {
      sql += ' AND (username LIKE ? OR first_name LIKE ? OR last_name LIKE ? OR bio LIKE ?)';
      const searchTerm = `%${search}%`;
      params.push(searchTerm, searchTerm, searchTerm, searchTerm);
    }

    if (accountType) {
      sql += ' AND account_type = ?';
      params.push(accountType);
    }

    sql += ' ORDER BY created_at DESC LIMIT ? OFFSET ?';
    params.push(parseInt(limit), offset);

    const users = await query(sql, params);

    // Get total count for pagination
    let countSql = 'SELECT COUNT(*) as total FROM users WHERE is_active = true';
    let countParams = [];

    if (search) {
      countSql += ' AND (username LIKE ? OR first_name LIKE ? OR last_name LIKE ? OR bio LIKE ?)';
      const searchTerm = `%${search}%`;
      countParams.push(searchTerm, searchTerm, searchTerm, searchTerm);
    }

    if (accountType) {
      countSql += ' AND account_type = ?';
      countParams.push(accountType);
    }

    const [countResult] = await query(countSql, countParams);
    const total = countResult.total;

    res.json({
      success: true,
      users,
      pagination: {
        page: parseInt(page),
        limit: parseInt(limit),
        total,
        pages: Math.ceil(total / limit)
      }
    });

  } catch (error) {
    console.error('Get users error:', error);
    res.status(500).json({
      success: false,
      message: 'Failed to get users'
    });
  }
});

// Get user by ID
router.get('/:id', optionalAuth, async (req, res) => {
  try {
    const { id } = req.params;
    
    const user = await queryOne(
      `SELECT id, username, first_name, last_name, profile_picture, bio, location, 
       currency, is_verified, is_premium, account_type, created_at, last_login_at 
       FROM users WHERE id = ? AND is_active = true`,
      [id]
    );

    if (!user) {
      return res.status(404).json({
        success: false,
        message: 'User not found'
      });
    }

    res.json({
      success: true,
      user
    });

  } catch (error) {
    console.error('Get user error:', error);
    res.status(500).json({
      success: false,
      message: 'Failed to get user'
    });
  }
});

// Get user by username
router.get('/username/:username', optionalAuth, async (req, res) => {
  try {
    const { username } = req.params;
    
    const user = await queryOne(
      `SELECT id, username, first_name, last_name, profile_picture, bio, location, 
       currency, is_verified, is_premium, account_type, created_at, last_login_at 
       FROM users WHERE username = ? AND is_active = true`,
      [username]
    );

    if (!user) {
      return res.status(404).json({
        success: false,
        message: 'User not found'
      });
    }

    res.json({
      success: true,
      user
    });

  } catch (error) {
    console.error('Get user by username error:', error);
    res.status(500).json({
      success: false,
      message: 'Failed to get user'
    });
  }
});

// Update user profile (authenticated users can only update their own profile)
router.put('/:id', authenticateToken, async (req, res) => {
  try {
    const { id } = req.params;
    
    // Check if user is updating their own profile
    if (req.user.userId !== id) {
      return res.status(403).json({
        success: false,
        message: 'You can only update your own profile'
      });
    }

    const { firstName, lastName, bio, location, currency, gender, profilePicture } = req.body;
    const now = new Date().toISOString().slice(0, 19).replace('T', ' ');

    await execute(
      `UPDATE users SET first_name = ?, last_name = ?, bio = ?, location = ?, 
       currency = ?, gender = ?, profile_picture = ?, updated_at = ? WHERE id = ?`,
      [firstName, lastName, bio, location, currency, gender, profilePicture, now, id]
    );

    // Get updated user
    const user = await queryOne(
      `SELECT id, username, first_name, last_name, profile_picture, bio, location, 
       currency, is_verified, is_premium, account_type, created_at, last_login_at 
       FROM users WHERE id = ?`,
      [id]
    );

    res.json({
      success: true,
      message: 'Profile updated successfully',
      user
    });

  } catch (error) {
    console.error('Update user error:', error);
    res.status(500).json({
      success: false,
      message: 'Failed to update profile'
    });
  }
});

// Delete user account (soft delete)
router.delete('/:id', authenticateToken, async (req, res) => {
  try {
    const { id } = req.params;
    
    // Check if user is deleting their own account
    if (req.user.userId !== id) {
      return res.status(403).json({
        success: false,
        message: 'You can only delete your own account'
      });
    }

    const now = new Date().toISOString().slice(0, 19).replace('T', ' ');
    
    await execute(
      'UPDATE users SET is_active = false, updated_at = ? WHERE id = ?',
      [now, id]
    );

    res.json({
      success: true,
      message: 'Account deleted successfully'
    });

  } catch (error) {
    console.error('Delete user error:', error);
    res.status(500).json({
      success: false,
      message: 'Failed to delete account'
    });
  }
});

// Get user statistics
router.get('/:id/stats', optionalAuth, async (req, res) => {
  try {
    const { id } = req.params;
    
    // Get post count
    const [postCount] = await query(
      'SELECT COUNT(*) as count FROM posts WHERE user_id = ? AND is_active = true',
      [id]
    );

    // Get follower count (if followers table exists)
    let followerCount = 0;
    try {
      const [followerResult] = await query(
        'SELECT COUNT(*) as count FROM followers WHERE following_id = ?',
        [id]
      );
      followerCount = followerResult.count;
    } catch (e) {
      // Followers table might not exist yet
    }

    // Get following count
    let followingCount = 0;
    try {
      const [followingResult] = await query(
        'SELECT COUNT(*) as count FROM followers WHERE follower_id = ?',
        [id]
      );
      followingCount = followingResult.count;
    } catch (e) {
      // Followers table might not exist yet
    }

    res.json({
      success: true,
      stats: {
        posts: postCount.count,
        followers: followerCount,
        following: followingCount
      }
    });

  } catch (error) {
    console.error('Get user stats error:', error);
    res.status(500).json({
      success: false,
      message: 'Failed to get user statistics'
    });
  }
});

module.exports = router;
