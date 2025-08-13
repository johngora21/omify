import '../models/user_model.dart';
import '../services/database_service.dart';

class UserRepository {
  final DatabaseService _databaseService = DatabaseService.instance;

  Future<UserModel> createUser(UserModel user) async {
    final connection = await _databaseService.connection;
    
    final result = await connection.execute(
      'INSERT INTO users (id, username, email, first_name, last_name, phone_number, profile_picture, bio, gender, date_of_birth, location, currency, interests, preferences, is_verified, is_premium, account_type, created_at, updated_at, last_login_at, is_active, verification_token, email_verified_at) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)',
      <Object?>[
        user.id,
        user.username,
        user.email,
        user.firstName,
        user.lastName,
        user.phoneNumber,
        user.profilePicture,
        user.bio,
        user.gender,
        user.dateOfBirth?.toIso8601String(),
        user.location,
        user.currency,
        user.interests.join(','),
        user.preferences.toString(),
        user.isVerified,
        user.isPremium,
        user.accountType,
        user.createdAt.toIso8601String(),
        user.updatedAt.toIso8601String(),
        user.lastLoginAt?.toIso8601String(),
        user.isActive,
        user.verificationToken,
        user.emailVerifiedAt?.toIso8601String(),
      ],
    );

    if (result.affectedRows == 0) {
      throw Exception('Failed to create user');
    }

    return user;
  }

  Future<UserModel?> getUserById(String id) async {
    final connection = await _databaseService.connection;
    
    final result = await connection.execute(
      'SELECT * FROM users WHERE id = ?',
      [id],
    );

    if (result.rows.isEmpty) {
      return null;
    }

    final row = result.rows.first.assoc();
    return UserModel.fromJson(row);
  }

  Future<UserModel?> getUserByEmail(String email) async {
    final connection = await _databaseService.connection;
    
    final result = await connection.execute(
      'SELECT * FROM users WHERE email = ?',
      [email],
    );

    if (result.rows.isEmpty) {
      return null;
    }

    final row = result.rows.first.assoc();
    return UserModel.fromJson(row);
  }

  Future<UserModel?> getUserByUsername(String username) async {
    final connection = await _databaseService.connection;
    
    final result = await connection.execute(
      'SELECT * FROM users WHERE username = ?',
      [username],
    );

    if (result.rows.isEmpty) {
      return null;
    }

    final row = result.rows.first.assoc();
    return UserModel.fromJson(row);
  }

  Future<List<UserModel>> getAllUsers({int limit = 50, int offset = 0}) async {
    final connection = await _databaseService.connection;
    
    final result = await connection.execute(
      'SELECT * FROM users WHERE is_active = true ORDER BY created_at DESC LIMIT ? OFFSET ?',
      [limit, offset],
    );

    return result.rows.map((row) => UserModel.fromJson(row.assoc())).toList();
  }

  Future<UserModel> updateUser(UserModel user) async {
    final connection = await _databaseService.connection;
    
    final result = await connection.execute(
      'UPDATE users SET username = ?, email = ?, first_name = ?, last_name = ?, phone_number = ?, profile_picture = ?, bio = ?, gender = ?, date_of_birth = ?, location = ?, currency = ?, interests = ?, preferences = ?, is_verified = ?, is_premium = ?, account_type = ?, updated_at = ?, last_login_at = ?, is_active = ?, verification_token = ?, email_verified_at = ? WHERE id = ?',
      [
        user.username,
        user.email,
        user.firstName,
        user.lastName,
        user.phoneNumber,
        user.profilePicture,
        user.bio,
        user.gender,
        user.dateOfBirth?.toIso8601String(),
        user.location,
        user.currency,
        user.interests.join(','),
        user.preferences.toString(),
        user.isVerified,
        user.isPremium,
        user.accountType,
        DateTime.now().toIso8601String(),
        user.lastLoginAt?.toIso8601String(),
        user.isActive,
        user.verificationToken,
        user.emailVerifiedAt?.toIso8601String(),
        user.id,
      ],
    );

    if (result.affectedRows == 0) {
      throw Exception('Failed to update user');
    }

    return user.copyWith(updatedAt: DateTime.now());
  }

  Future<bool> deleteUser(String id) async {
    final connection = await _databaseService.connection;
    
    final result = await connection.execute(
      'UPDATE users SET is_active = false, updated_at = ? WHERE id = ?',
      [DateTime.now().toIso8601String(), id],
    );

    return result.affectedRows > 0;
  }

  Future<bool> verifyUser(String id, String token) async {
    final connection = await _databaseService.connection;
    
    final result = await connection.execute(
      'UPDATE users SET is_verified = true, email_verified_at = ?, updated_at = ? WHERE id = ? AND verification_token = ?',
      [DateTime.now().toIso8601String(), DateTime.now().toIso8601String(), id, token],
    );

    return result.affectedRows > 0;
  }

  Future<bool> updateLastLogin(String id) async {
    final connection = await _databaseService.connection;
    
    final result = await connection.execute(
      'UPDATE users SET last_login_at = ?, updated_at = ? WHERE id = ?',
      [DateTime.now().toIso8601String(), DateTime.now().toIso8601String(), id],
    );

    return result.affectedRows > 0;
  }
}
