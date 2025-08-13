const express = require('express');
const bcrypt = require('bcryptjs');
const jwt = require('jsonwebtoken');
const { query, queryOne, execute } = require('../config/database');
const { authenticateToken } = require('../middleware/auth');

const router = express.Router();

// JWT Secret (in production, use environment variable)
const JWT_SECRET = process.env.JWT_SECRET || 'omify-super-secret-key-2024';

// Register new user
router.post('/register', async (req, res) => {
  try {
    const { username, email, password, firstName, lastName, gender } = req.body;

    // Validation
    if (!username || !email || !password) {
      return res.status(400).json({
        success: false,
        message: 'Username, email, and password are required'
      });
    }

    if (password.length < 6) {
      return res.status(400).json({
        success: false,
        message: 'Password must be at least 6 characters long'
      });
    }

    // Check if user already exists
    const existingUser = await queryOne(
      'SELECT id FROM users WHERE email = ? OR username = ?',
      [email, username]
    );

    if (existingUser) {
      return res.status(400).json({
        success: false,
        message: 'User with this email or username already exists'
      });
    }

    // Hash password
    const hashedPassword = await bcrypt.hash(password, 12);

    // Create user
    const userId = require('crypto').randomUUID();
    const now = new Date().toISOString().slice(0, 19).replace('T', ' ');

    await execute(
      `INSERT INTO users (id, username, email, first_name, last_name, gender, password_hash, 
       is_verified, is_premium, account_type, created_at, updated_at, is_active) 
       VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)`,
      [userId, username, email, firstName, lastName, gender, hashedPassword, 
       false, false, 'personal', now, now, true]
    );

    // Generate JWT token
    const token = jwt.sign(
      { userId, email, username },
      JWT_SECRET,
      { expiresIn: '24h' }
    );

    // Get created user (without password)
    const user = await queryOne(
      'SELECT id, username, email, first_name, last_name, gender, is_verified, account_type, created_at FROM users WHERE id = ?',
      [userId]
    );

    res.status(201).json({
      success: true,
      message: 'User registered successfully',
      token,
      user
    });

  } catch (error) {
    console.error('Registration error:', error);
    res.status(500).json({
      success: false,
      message: 'Registration failed'
    });
  }
});

// Login user
router.post('/login', async (req, res) => {
  try {
    const { email, password } = req.body;

    // Validation
    if (!email || !password) {
      return res.status(400).json({
        success: false,
        message: 'Email and password are required'
      });
    }

    // Get user with password hash
    const user = await queryOne(
      'SELECT id, username, email, first_name, last_name, gender, password_hash, is_verified, account_type, is_active FROM users WHERE email = ?',
      [email]
    );

    if (!user) {
      return res.status(401).json({
        success: false,
        message: 'Invalid email or password'
      });
    }

    if (!user.is_active) {
      return res.status(401).json({
        success: false,
        message: 'Account is deactivated'
      });
    }

    // Check password
    const isValidPassword = await bcrypt.compare(password, user.password_hash);
    if (!isValidPassword) {
      return res.status(401).json({
        success: false,
        message: 'Invalid email or password'
      });
    }

    // Update last login
    const now = new Date().toISOString().slice(0, 19).replace('T', ' ');
    await execute(
      'UPDATE users SET last_login_at = ?, updated_at = ? WHERE id = ?',
      [now, now, user.id]
    );

    // Generate JWT token
    const token = jwt.sign(
      { userId: user.id, email: user.email, username: user.username },
      JWT_SECRET,
      { expiresIn: '24h' }
    );

    // Remove password hash from response
    delete user.password_hash;

    res.json({
      success: true,
      message: 'Login successful',
      token,
      user
    });

  } catch (error) {
    console.error('Login error:', error);
    res.status(500).json({
      success: false,
      message: 'Login failed'
    });
  }
});

// Get current user profile
router.get('/me', authenticateToken, async (req, res) => {
  try {
    const user = await queryOne(
      'SELECT id, username, email, first_name, last_name, gender, profile_picture, bio, location, currency, is_verified, is_premium, account_type, created_at, last_login_at FROM users WHERE id = ?',
      [req.user.userId]
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
    console.error('Get profile error:', error);
    res.status(500).json({
      success: false,
      message: 'Failed to get profile'
    });
  }
});

// Update user profile
router.put('/profile', authenticateToken, async (req, res) => {
  try {
    const { firstName, lastName, bio, location, currency, gender } = req.body;
    const now = new Date().toISOString().slice(0, 19).replace('T', ' ');

    await execute(
      `UPDATE users SET first_name = ?, last_name = ?, bio = ?, location = ?, 
       currency = ?, gender = ?, updated_at = ? WHERE id = ?`,
      [firstName, lastName, bio, location, currency, gender, now, req.user.userId]
    );

    // Get updated user
    const user = await queryOne(
      'SELECT id, username, email, first_name, last_name, gender, profile_picture, bio, location, currency, is_verified, is_premium, account_type, created_at, last_login_at FROM users WHERE id = ?',
      [req.user.userId]
    );

    res.json({
      success: true,
      message: 'Profile updated successfully',
      user
    });

  } catch (error) {
    console.error('Update profile error:', error);
    res.status(500).json({
      success: false,
      message: 'Failed to update profile'
    });
  }
});

// Change password
router.post('/change-password', authenticateToken, async (req, res) => {
  try {
    const { currentPassword, newPassword } = req.body;

    if (!currentPassword || !newPassword) {
      return res.status(400).json({
        success: false,
        message: 'Current password and new password are required'
      });
    }

    if (newPassword.length < 6) {
      return res.status(400).json({
        success: false,
        message: 'New password must be at least 6 characters long'
      });
    }

    // Get current password hash
    const user = await queryOne(
      'SELECT password_hash FROM users WHERE id = ?',
      [req.user.userId]
    );

    // Verify current password
    const isValidPassword = await bcrypt.compare(currentPassword, user.password_hash);
    if (!isValidPassword) {
      return res.status(401).json({
        success: false,
        message: 'Current password is incorrect'
      });
    }

    // Hash new password
    const hashedPassword = await bcrypt.hash(newPassword, 12);
    const now = new Date().toISOString().slice(0, 19).replace('T', ' ');

    // Update password
    await execute(
      'UPDATE users SET password_hash = ?, updated_at = ? WHERE id = ?',
      [hashedPassword, now, req.user.userId]
    );

    res.json({
      success: true,
      message: 'Password changed successfully'
    });

  } catch (error) {
    console.error('Change password error:', error);
    res.status(500).json({
      success: false,
      message: 'Failed to change password'
    });
  }
});

// Logout (client-side token removal)
router.post('/logout', authenticateToken, (req, res) => {
  // In a real app, you might want to blacklist the token
  res.json({
    success: true,
    message: 'Logged out successfully'
  });
});

module.exports = router;
