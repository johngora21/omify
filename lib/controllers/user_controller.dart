import 'dart:convert';
import '../models/user_model.dart';
import '../repositories/user_repository.dart';

class UserController {
  final UserRepository _userRepository = UserRepository();
  UserModel? _currentUser;

  // Getters
  UserModel? get currentUser => _currentUser;
  bool get isLoggedIn => _currentUser != null;

  // Authentication methods
  Future<bool> login(String email, String password) async {
    try {
      // TODO: Implement proper password hashing and verification
      final user = await _userRepository.getUserByEmail(email);
      
      if (user != null) {
        // For now, just check if user exists
        // In production, verify password hash
        _currentUser = user;
        await _userRepository.updateLastLogin(user.id);
        return true;
      }
      
      return false;
    } catch (e) {
      print('Login error: $e');
      return false;
    }
  }

  Future<bool> register(UserModel user) async {
    try {
      // Check if email already exists
      final existingUser = await _userRepository.getUserByEmail(user.email);
      if (existingUser != null) {
        throw Exception('Email already registered');
      }

      // Check if username already exists
      final existingUsername = await _userRepository.getUserByUsername(user.username);
      if (existingUsername != null) {
        throw Exception('Username already taken');
      }

      // Create user
      final createdUser = await _userRepository.createUser(user);
      _currentUser = createdUser;
      return true;
    } catch (e) {
      print('Registration error: $e');
      rethrow;
    }
  }

  Future<void> logout() async {
    _currentUser = null;
  }

  Future<bool> updateProfile(UserModel updatedUser) async {
    try {
      if (_currentUser == null) {
        throw Exception('No user logged in');
      }

      final result = await _userRepository.updateUser(updatedUser);
      _currentUser = result;
      return true;
    } catch (e) {
      print('Profile update error: $e');
      return false;
    }
  }

  Future<bool> verifyEmail(String token) async {
    try {
      if (_currentUser == null) {
        throw Exception('No user logged in');
      }

      final success = await _userRepository.verifyUser(_currentUser!.id, token);
      if (success) {
        _currentUser = _currentUser!.copyWith(
          isVerified: true,
          emailVerifiedAt: DateTime.now(),
        );
      }
      return success;
    } catch (e) {
      print('Email verification error: $e');
      return false;
    }
  }

  Future<bool> changePassword(String currentPassword, String newPassword) async {
    try {
      if (_currentUser == null) {
        throw Exception('No user logged in');
      }

      // TODO: Implement password change logic
      // 1. Verify current password
      // 2. Hash new password
      // 3. Update in database
      
      return true;
    } catch (e) {
      print('Password change error: $e');
      return false;
    }
  }

  Future<bool> deleteAccount() async {
    try {
      if (_currentUser == null) {
        throw Exception('No user logged in');
      }

      final success = await _userRepository.deleteUser(_currentUser!.id);
      if (success) {
        _currentUser = null;
      }
      return success;
    } catch (e) {
      print('Account deletion error: $e');
      return false;
    }
  }

  Future<List<UserModel>> searchUsers(String query) async {
    try {
      // TODO: Implement user search functionality
      return [];
    } catch (e) {
      print('User search error: $e');
      return [];
    }
  }

  Future<UserModel?> getUserById(String id) async {
    try {
      return await _userRepository.getUserById(id);
    } catch (e) {
      print('Get user error: $e');
      return null;
    }
  }

  Future<UserModel?> getUserByUsername(String username) async {
    try {
      return await _userRepository.getUserByUsername(username);
    } catch (e) {
      print('Get user by username error: $e');
      return null;
    }
  }

  // Helper methods
  bool isCurrentUser(String userId) {
    return _currentUser?.id == userId;
  }

  bool hasPermission(String permission) {
    // TODO: Implement permission checking logic
    return _currentUser?.isVerified ?? false;
  }

  void clearCurrentUser() {
    _currentUser = null;
  }
}
