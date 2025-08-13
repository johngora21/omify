import 'package:uuid/uuid.dart';

class UserModel {
  final String id;
  final String username;
  final String email;
  final String? firstName;
  final String? lastName;
  final String? phoneNumber;
  final String? profilePicture;
  final String? bio;
  final String? gender;
  final DateTime? dateOfBirth;
  final String? location;
  final String? currency;
  final List<String> interests;
  final Map<String, dynamic> preferences;
  final bool isVerified;
  final bool isPremium;
  final String accountType; // 'personal', 'professional', 'business'
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? lastLoginAt;
  final bool isActive;
  final String? verificationToken;
  final DateTime? emailVerifiedAt;

  UserModel({
    String? id,
    required this.username,
    required this.email,
    this.firstName,
    this.lastName,
    this.phoneNumber,
    this.profilePicture,
    this.bio,
    this.gender,
    this.dateOfBirth,
    this.location,
    this.currency,
    List<String>? interests,
    Map<String, dynamic>? preferences,
    this.isVerified = false,
    this.isPremium = false,
    this.accountType = 'personal',
    DateTime? createdAt,
    DateTime? updatedAt,
    this.lastLoginAt,
    this.isActive = true,
    this.verificationToken,
    this.emailVerifiedAt,
  }) : 
    id = id ?? const Uuid().v4(),
    interests = interests ?? [],
    preferences = preferences ?? {},
    createdAt = createdAt ?? DateTime.now(),
    updatedAt = updatedAt ?? DateTime.now();

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      username: json['username'],
      email: json['email'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      phoneNumber: json['phone_number'],
      profilePicture: json['profile_picture'],
      bio: json['bio'],
      gender: json['gender'],
      dateOfBirth: json['date_of_birth'] != null 
          ? DateTime.parse(json['date_of_birth']) 
          : null,
      location: json['location'],
      currency: json['currency'],
      interests: json['interests'] != null 
          ? List<String>.from(json['interests'].split(',').where((s) => s.isNotEmpty))
          : [],
      preferences: json['preferences'] != null 
          ? Map<String, dynamic>.from(json['preferences'])
          : {},
      isVerified: json['is_verified'] ?? false,
      isPremium: json['is_premium'] ?? false,
      accountType: json['account_type'] ?? 'personal',
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      lastLoginAt: json['last_login_at'] != null 
          ? DateTime.parse(json['last_login_at']) 
          : null,
      isActive: json['is_active'] ?? true,
      verificationToken: json['verification_token'],
      emailVerifiedAt: json['email_verified_at'] != null 
          ? DateTime.parse(json['email_verified_at']) 
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'username': username,
      'email': email,
      'first_name': firstName,
      'last_name': lastName,
      'phone_number': phoneNumber,
      'profile_picture': profilePicture,
      'bio': bio,
      'gender': gender,
      'date_of_birth': dateOfBirth?.toIso8601String(),
      'location': location,
      'currency': currency,
      'interests': interests.join(','),
      'preferences': preferences.toString(),
      'is_verified': isVerified,
      'is_premium': isPremium,
      'account_type': accountType,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
      'last_login_at': lastLoginAt?.toIso8601String(),
      'is_active': isActive,
      'verification_token': verificationToken,
      'email_verified_at': emailVerifiedAt?.toIso8601String(),
    };
  }

  UserModel copyWith({
    String? id,
    String? username,
    String? email,
    String? firstName,
    String? lastName,
    String? phoneNumber,
    String? profilePicture,
    String? bio,
    String? gender,
    DateTime? dateOfBirth,
    String? location,
    String? currency,
    List<String>? interests,
    Map<String, dynamic>? preferences,
    bool? isVerified,
    bool? isPremium,
    String? accountType,
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? lastLoginAt,
    bool? isActive,
    String? verificationToken,
    DateTime? emailVerifiedAt,
  }) {
    return UserModel(
      id: id ?? this.id,
      username: username ?? this.username,
      email: email ?? this.email,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      profilePicture: profilePicture ?? this.profilePicture,
      bio: bio ?? this.bio,
      gender: gender ?? this.gender,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      location: location ?? this.location,
      currency: currency ?? this.currency,
      interests: interests ?? this.interests,
      preferences: preferences ?? this.preferences,
      isVerified: isVerified ?? this.isVerified,
      isPremium: isPremium ?? this.isPremium,
      accountType: accountType ?? this.accountType,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      lastLoginAt: lastLoginAt ?? this.lastLoginAt,
      isActive: isActive ?? this.isActive,
      verificationToken: verificationToken ?? this.verificationToken,
      emailVerifiedAt: emailVerifiedAt ?? this.emailVerifiedAt,
    );
  }

  @override
  String toString() {
    return 'UserModel(id: $id, username: $username, email: $email, accountType: $accountType)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is UserModel && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;
}
