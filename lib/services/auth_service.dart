import 'dart:convert';
import 'dart:math';
import '../models/user_model.dart';
import 'api_service.dart';

class AuthService {
  static AuthService? _instance;
  static AuthService get instance => _instance ??= AuthService._internal();
  
  AuthService._internal();

  String? _authToken;
  UserModel? _currentUser;
  DateTime? _tokenExpiry;

  // Getters
  String? get authToken => _authToken;
  UserModel? get currentUser => _currentUser;
  bool get isLoggedIn => _authToken != null && _currentUser != null;
  bool get isTokenExpired => _tokenExpiry != null && DateTime.now().isAfter(_tokenExpiry!);

  // Login with email and password
  Future<Map<String, dynamic>> login(String email, String password) async {
    try {
      final response = await ApiService.post('/auth/login', {
        'email': email,
        'password': password,
      });

      final data = ApiService.parseResponse(response);
      
      if (data['success'] == true) {
        _authToken = data['token'];
        _currentUser = UserModel.fromJson(data['user']);
        _tokenExpiry = DateTime.now().add(Duration(hours: 24)); // Default 24 hours
        
        // Store token locally
        await _saveTokenLocally(_authToken!);
        await _saveUserLocally(_currentUser!);
        
        return {
          'success': true,
          'message': 'Login successful',
          'user': _currentUser,
        };
      } else {
        return {
          'success': false,
          'message': data['message'] ?? 'Login failed',
        };
      }
    } catch (e) {
      return {
        'success': false,
        'message': 'Login error: ${ApiService.getErrorMessage(e)}',
      };
    }
  }

  // Register new user
  Future<Map<String, dynamic>> register(UserModel user, String password) async {
    try {
      final response = await ApiService.post('/auth/register', {
        ...user.toJson(),
        'password': password,
      });

      final data = ApiService.parseResponse(response);
      
      if (data['success'] == true) {
        _authToken = data['token'];
        _currentUser = UserModel.fromJson(data['user']);
        _tokenExpiry = DateTime.now().add(Duration(hours: 24));
        
        // Store token locally
        await _saveTokenLocally(_authToken!);
        await _saveUserLocally(_currentUser!);
        
        return {
          'success': true,
          'message': 'Registration successful',
          'user': _currentUser,
        };
      } else {
        return {
          'success': false,
          'message': data['message'] ?? 'Registration failed',
        };
      }
    } catch (e) {
      return {
        'success': false,
        'message': 'Registration error: ${ApiService.getErrorMessage(e)}',
      };
    }
  }

  // Logout
  Future<void> logout() async {
    try {
      if (_authToken != null) {
        // Call logout endpoint
        await ApiService.post('/auth/logout', {}, token: _authToken);
      }
    } catch (e) {
      print('Logout API call failed: $e');
    } finally {
      // Clear local data
      _authToken = null;
      _currentUser = null;
      _tokenExpiry = null;
      
      await _clearLocalData();
    }
  }

  // Refresh token
  Future<bool> refreshToken() async {
    try {
      if (_authToken == null) return false;
      
      final response = await ApiService.post('/auth/refresh', {}, token: _authToken);
      final data = ApiService.parseResponse(response);
      
      if (data['success'] == true) {
        _authToken = data['token'];
        _tokenExpiry = DateTime.now().add(Duration(hours: 24));
        
        await _saveTokenLocally(_authToken!);
        return true;
      }
      
      return false;
    } catch (e) {
      print('Token refresh failed: $e');
      return false;
    }
  }

  // Check if user is authenticated
  Future<bool> checkAuthStatus() async {
    try {
      // Try to load token from local storage
      final token = await _loadTokenLocally();
      if (token == null) return false;
      
      // Validate token with server
      final response = await ApiService.get('/auth/me', token: token);
      final data = ApiService.parseResponse(response);
      
      if (data['success'] == true) {
        _authToken = token;
        _currentUser = UserModel.fromJson(data['user']);
        _tokenExpiry = DateTime.now().add(Duration(hours: 24));
        return true;
      }
      
      return false;
    } catch (e) {
      print('Auth status check failed: $e');
      return false;
    }
  }

  // Update user profile
  Future<Map<String, dynamic>> updateProfile(UserModel updatedUser) async {
    try {
      if (_authToken == null) {
        throw Exception('Not authenticated');
      }
      
      final response = await ApiService.put('/auth/profile', updatedUser.toJson(), token: _authToken);
      final data = ApiService.parseResponse(response);
      
      if (data['success'] == true) {
        _currentUser = updatedUser;
        await _saveUserLocally(_currentUser!);
        
        return {
          'success': true,
          'message': 'Profile updated successfully',
          'user': _currentUser,
        };
      } else {
        return {
          'success': false,
          'message': data['message'] ?? 'Profile update failed',
        };
      }
    } catch (e) {
      return {
        'success': false,
        'message': 'Profile update error: ${ApiService.getErrorMessage(e)}',
      };
    }
  }

  // Change password
  Future<Map<String, dynamic>> changePassword(String currentPassword, String newPassword) async {
    try {
      if (_authToken == null) {
        throw Exception('Not authenticated');
      }
      
      final response = await ApiService.post('/auth/change-password', {
        'currentPassword': currentPassword,
        'newPassword': newPassword,
      }, token: _authToken);
      
      final data = ApiService.parseResponse(response);
      
      return {
        'success': data['success'] ?? false,
        'message': data['message'] ?? 'Password change failed',
      };
    } catch (e) {
      return {
        'success': false,
        'message': 'Password change error: ${ApiService.getErrorMessage(e)}',
      };
    }
  }

  // Forgot password
  Future<Map<String, dynamic>> forgotPassword(String email) async {
    try {
      final response = await ApiService.post('/auth/forgot-password', {
        'email': email,
      });
      
      final data = ApiService.parseResponse(response);
      
      return {
        'success': data['success'] ?? false,
        'message': data['message'] ?? 'Password reset failed',
      };
    } catch (e) {
      return {
        'success': false,
        'message': 'Password reset error: ${ApiService.getErrorMessage(e)}',
      };
    }
  }

  // Reset password with token
  Future<Map<String, dynamic>> resetPassword(String token, String newPassword) async {
    try {
      final response = await ApiService.post('/auth/reset-password', {
        'token': token,
        'newPassword': newPassword,
      });
      
      final data = ApiService.parseResponse(response);
      
      return {
        'success': data['success'] ?? false,
        'message': data['message'] ?? 'Password reset failed',
      };
    } catch (e) {
      return {
        'success': false,
        'message': 'Password reset error: ${ApiService.getErrorMessage(e)}',
      };
    }
  }

  // Local storage methods (simplified - in production use secure storage)
  Future<void> _saveTokenLocally(String token) async {
    // TODO: Implement secure local storage
    print('Token saved locally: ${token.substring(0, 10)}...');
  }

  Future<void> _saveUserLocally(UserModel user) async {
    // TODO: Implement secure local storage
    print('User saved locally: ${user.username}');
  }

  Future<String?> _loadTokenLocally() async {
    // TODO: Implement secure local storage
    return _authToken;
  }

  Future<void> _clearLocalData() async {
    // TODO: Implement secure local storage
    print('Local data cleared');
  }

  // Generate random token (for testing)
  String _generateRandomToken() {
    const chars = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
    final random = Random.secure();
    return String.fromCharCodes(
      Iterable.generate(32, (_) => chars.codeUnitAt(random.nextInt(chars.length))),
    );
  }
}
