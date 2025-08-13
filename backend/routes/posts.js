const express = require('express');
const { query, queryOne, execute } = require('../config/database');
const { authenticateToken, optionalAuth } = require('../middleware/auth');

const router = express.Router();

// Create a new post
router.post('/', authenticateToken, async (req, res) => {
  try {
    const { title, content, postType, mediaUrl, mediaType, location, hashtags, serviceDetails } = req.body;
    const userId = req.user.userId;

    // Validation
    if (!content || content.trim().length === 0) {
      return res.status(400).json({
        success: false,
        message: 'Post content is required'
      });
    }

    if (content.length > 5000) {
      return res.status(400).json({
        success: false,
        message: 'Post content cannot exceed 5000 characters'
      });
    }

    // Create post
    const postId = require('crypto').randomUUID();
    const now = new Date().toISOString().slice(0, 19).replace('T', ' ');

    await execute(
      `INSERT INTO posts (id, user_id, title, content, post_type, media_url, media_type, 
       location, hashtags, service_details, is_active, is_approved, view_count, like_count, 
       comment_count, share_count, created_at, updated_at) 
       VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)`,
      [postId, userId, title, content, postType || 'normal', mediaUrl, mediaType, 
       location, hashtags ? hashtags.join(',') : '', serviceDetails ? JSON.stringify(serviceDetails) : '', 
       true, true, 0, 0, 0, 0, now, now]
    );

    // Get created post
    const post = await queryOne(
      `SELECT p.*, u.username, u.first_name, u.last_name, u.profile_picture 
       FROM posts p 
       JOIN users u ON p.user_id = u.id 
       WHERE p.id = ?`,
      [postId]
    );

    res.status(201).json({
      success: true,
      message: 'Post created successfully',
      post
    });

  } catch (error) {
    console.error('Create post error:', error);
    res.status(500).json({
      success: false,
      message: 'Failed to create post'
    });
  }
});

// Get all posts (with pagination and filtering)
router.get('/', optionalAuth, async (req, res) => {
  try {
    const { page = 1, limit = 20, postType, userId, search = '' } = req.query;
    const offset = (page - 1) * limit;

    let sql = `SELECT p.*, u.username, u.first_name, u.last_name, u.profile_picture 
                FROM posts p 
                JOIN users u ON p.user_id = u.id 
                WHERE p.is_active = true AND p.is_approved = true`;
    let params = [];

    if (postType) {
      sql += ' AND p.post_type = ?';
      params.push(postType);
    }

    if (userId) {
      sql += ' AND p.user_id = ?';
      params.push(userId);
    }

    if (search) {
      sql += ' AND (p.title LIKE ? OR p.content LIKE ? OR p.hashtags LIKE ?)';
      const searchTerm = `%${search}%`;
      params.push(searchTerm, searchTerm, searchTerm);
    }

    sql += ' ORDER BY p.created_at DESC LIMIT ? OFFSET ?';
    params.push(parseInt(limit), offset);

    const posts = await query(sql, params);

    // Get total count for pagination
    let countSql = 'SELECT COUNT(*) as total FROM posts p WHERE p.is_active = true AND p.is_approved = true';
    let countParams = [];

    if (postType) {
      countSql += ' AND p.post_type = ?';
      countParams.push(postType);
    }

    if (userId) {
      countSql += ' AND p.user_id = ?';
      countParams.push(userId);
    }

    if (search) {
      countSql += ' AND (p.title LIKE ? OR p.content LIKE ? OR p.hashtags LIKE ?)';
      const searchTerm = `%${search}%`;
      countParams.push(searchTerm, searchTerm, searchTerm);
    }

    const [countResult] = await query(countSql, countParams);
    const total = countResult.total;

    res.json({
      success: true,
      posts,
      pagination: {
        page: parseInt(page),
        limit: parseInt(limit),
        total,
        pages: Math.ceil(total / limit)
      }
    });

  } catch (error) {
    console.error('Get posts error:', error);
    res.status(500).json({
      success: false,
      message: 'Failed to get posts'
    });
  }
});

// Get post by ID
router.get('/:id', optionalAuth, async (req, res) => {
  try {
    const { id } = req.params;
    
    // Increment view count
    await execute(
      'UPDATE posts SET view_count = view_count + 1 WHERE id = ?',
      [id]
    );

    const post = await queryOne(
      `SELECT p.*, u.username, u.first_name, u.last_name, u.profile_picture 
       FROM posts p 
       JOIN users u ON p.user_id = u.id 
       WHERE p.id = ? AND p.is_active = true`,
      [id]
    );

    if (!post) {
      return res.status(404).json({
        success: false,
        message: 'Post not found'
      });
    }

    res.json({
      success: true,
      post
    });

  } catch (error) {
    console.error('Get post error:', error);
    res.status(500).json({
      success: false,
      message: 'Failed to get post'
    });
  }
});

// Update post
router.put('/:id', authenticateToken, async (req, res) => {
  try {
    const { id } = req.params;
    const { title, content, mediaUrl, mediaType, location, hashtags, serviceDetails } = req.body;
    const userId = req.user.userId;

    // Check if post exists and belongs to user
    const existingPost = await queryOne(
      'SELECT user_id FROM posts WHERE id = ? AND is_active = true',
      [id]
    );

    if (!existingPost) {
      return res.status(404).json({
        success: false,
        message: 'Post not found'
      });
    }

    if (existingPost.user_id !== userId) {
      return res.status(403).json({
        success: false,
        message: 'You can only update your own posts'
      });
    }

    // Validation
    if (!content || content.trim().length === 0) {
      return res.status(400).json({
        success: false,
        message: 'Post content is required'
      });
    }

    if (content.length > 5000) {
      return res.status(400).json({
        success: false,
        message: 'Post content cannot exceed 5000 characters'
      });
    }

    // Update post
    const now = new Date().toISOString().slice(0, 19).replace('T', ' ');

    await execute(
      `UPDATE posts SET title = ?, content = ?, media_url = ?, media_type = ?, 
       location = ?, hashtags = ?, service_details = ?, updated_at = ? WHERE id = ?`,
      [title, content, mediaUrl, mediaType, location, 
       hashtags ? hashtags.join(',') : '', 
       serviceDetails ? JSON.stringify(serviceDetails) : '', now, id]
    );

    // Get updated post
    const post = await queryOne(
      `SELECT p.*, u.username, u.first_name, u.last_name, u.profile_picture 
       FROM posts p 
       JOIN users u ON p.user_id = u.id 
       WHERE p.id = ?`,
      [id]
    );

    res.json({
      success: true,
      message: 'Post updated successfully',
      post
    });

  } catch (error) {
    console.error('Update post error:', error);
    res.status(500).json({
      success: false,
      message: 'Failed to update post'
    });
  }
});

// Delete post (soft delete)
router.delete('/:id', authenticateToken, async (req, res) => {
  try {
    const { id } = req.params;
    const userId = req.user.userId;

    // Check if post exists and belongs to user
    const existingPost = await queryOne(
      'SELECT user_id FROM posts WHERE id = ? AND is_active = true',
      [id]
    );

    if (!existingPost) {
      return res.status(404).json({
        success: false,
        message: 'Post not found'
      });
    }

    if (existingPost.user_id !== userId) {
      return res.status(403).json({
        success: false,
        message: 'You can only delete your own posts'
      });
    }

    const now = new Date().toISOString().slice(0, 19).replace('T', ' ');
    
    await execute(
      'UPDATE posts SET is_active = false, updated_at = ? WHERE id = ?',
      [now, id]
    );

    res.json({
      success: true,
      message: 'Post deleted successfully'
    });

  } catch (error) {
    console.error('Delete post error:', error);
    res.status(500).json({
      success: false,
      message: 'Failed to delete post'
    });
  }
});

// Like a post
router.post('/:id/like', authenticateToken, async (req, res) => {
  try {
    const { id } = req.params;
    const userId = req.user.userId;

    // Check if post exists
    const post = await queryOne(
      'SELECT id FROM posts WHERE id = ? AND is_active = true',
      [id]
    );

    if (!post) {
      return res.status(404).json({
        success: false,
        message: 'Post not found'
      });
    }

    // Increment like count
    await execute(
      'UPDATE posts SET like_count = like_count + 1 WHERE id = ?',
      [id]
    );

    res.json({
      success: true,
      message: 'Post liked successfully'
    });

  } catch (error) {
    console.error('Like post error:', error);
    res.status(500).json({
      success: false,
      message: 'Failed to like post'
    });
  }
});

// Unlike a post
router.delete('/:id/like', authenticateToken, async (req, res) => {
  try {
    const { id } = req.params;

    // Decrement like count (ensure it doesn't go below 0)
    await execute(
      'UPDATE posts SET like_count = GREATEST(like_count - 1, 0) WHERE id = ?',
      [id]
    );

    res.json({
      success: true,
      message: 'Post unliked successfully'
    });

  } catch (error) {
    console.error('Unlike post error:', error);
    res.status(500).json({
      success: false,
      message: 'Failed to unlike post'
    });
  }
});

// Search posts
router.get('/search/:query', optionalAuth, async (req, res) => {
  try {
    const { query: searchQuery } = req.params;
    const { page = 1, limit = 20 } = req.query;
    const offset = (page - 1) * limit;

    if (!searchQuery || searchQuery.trim().length === 0) {
      return res.status(400).json({
        success: false,
        message: 'Search query is required'
      });
    }

    const posts = await query(
      `SELECT p.*, u.username, u.first_name, u.last_name, u.profile_picture 
       FROM posts p 
       JOIN users u ON p.user_id = u.id 
       WHERE p.is_active = true AND p.is_approved = true 
       AND (p.title LIKE ? OR p.content LIKE ? OR p.hashtags LIKE ?)
       ORDER BY p.created_at DESC LIMIT ? OFFSET ?`,
      [`%${searchQuery}%`, `%${searchQuery}%`, `%${searchQuery}%`, parseInt(limit), offset]
    );

    // Get total count
    const [countResult] = await query(
      `SELECT COUNT(*) as total FROM posts p 
       WHERE p.is_active = true AND p.is_approved = true 
       AND (p.title LIKE ? OR p.content LIKE ? OR p.hashtags LIKE ?)`,
      [`%${searchQuery}%`, `%${searchQuery}%`, `%${searchQuery}%`]
    );

    const total = countResult.total;

    res.json({
      success: true,
      posts,
      pagination: {
        page: parseInt(page),
        limit: parseInt(limit),
        total,
        pages: Math.ceil(total / limit)
      }
    });

  } catch (error) {
    console.error('Search posts error:', error);
    res.status(500).json({
      success: false,
      message: 'Failed to search posts'
    });
  }
});

module.exports = router;
