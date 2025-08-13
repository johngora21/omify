import 'user_model.dart';

class ServiceProviderModel extends UserModel {
  final String serviceType; // 'erotic', 'accommodation', 'adventure', 'car_rental'
  final String? businessName;
  final String? businessDescription;
  final String? businessCategory;
  final List<String> services;
  final Map<String, dynamic> pricing;
  final List<String> highlights;
  final bool isAvailable;
  final double rating;
  final int reviewCount;
  final String? verificationDocument;
  final bool isVerifiedProvider;
  final DateTime? verificationDate;
  final List<String> workingHours;
  final String? emergencyContact;

  ServiceProviderModel({
    required super.username,
    required super.email,
    required this.serviceType,
    super.id,
    super.firstName,
    super.lastName,
    super.phoneNumber,
    super.profilePicture,
    super.bio,
    super.gender,
    super.dateOfBirth,
    super.location,
    super.currency,
    super.interests,
    super.preferences,
    super.isVerified,
    super.isPremium,
    super.createdAt,
    super.updatedAt,
    super.lastLoginAt,
    super.isActive,
    super.verificationToken,
    super.emailVerifiedAt,
    this.businessName,
    this.businessDescription,
    this.businessCategory,
    List<String>? services,
    Map<String, dynamic>? pricing,
    List<String>? highlights,
    this.isAvailable = true,
    this.rating = 0.0,
    this.reviewCount = 0,
    this.verificationDocument,
    this.isVerifiedProvider = false,
    this.verificationDate,
    List<String>? workingHours,
    this.emergencyContact,
  }) : 
    services = services ?? [],
    pricing = pricing ?? {},
    highlights = highlights ?? [],
    workingHours = workingHours ?? [],
    super(accountType: 'professional');

  factory ServiceProviderModel.fromJson(Map<String, dynamic> json) {
    return ServiceProviderModel(
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
      accountType: json['account_type'] ?? 'professional',
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
      serviceType: json['service_type'],
      businessName: json['business_name'],
      businessDescription: json['business_description'],
      businessCategory: json['business_category'],
      services: json['services'] != null 
          ? List<String>.from(json['services'].split(',').where((s) => s.isNotEmpty))
          : [],
      pricing: json['pricing'] != null 
          ? Map<String, dynamic>.from(json['pricing'])
          : {},
      highlights: json['highlights'] != null 
          ? List<String>.from(json['highlights'].split(',').where((s) => s.isNotEmpty))
          : [],
      isAvailable: json['is_available'] ?? true,
      rating: (json['rating'] ?? 0.0).toDouble(),
      reviewCount: json['review_count'] ?? 0,
      verificationDocument: json['verification_document'],
      isVerifiedProvider: json['is_verified_provider'] ?? false,
      verificationDate: json['verification_date'] != null 
          ? DateTime.parse(json['verification_date']) 
          : null,
      workingHours: json['working_hours'] != null 
          ? List<String>.from(json['working_hours'].split(',').where((s) => s.isNotEmpty))
          : [],
      emergencyContact: json['emergency_contact'],
    );
  }

  @override
  Map<String, dynamic> toJson() {
    final baseJson = super.toJson();
    baseJson.addAll({
      'service_type': serviceType,
      'business_name': businessName,
      'business_description': businessDescription,
      'business_category': businessCategory,
      'services': services.join(','),
      'pricing': pricing.toString(),
      'highlights': highlights.join(','),
      'is_available': isAvailable,
      'rating': rating,
      'review_count': reviewCount,
      'verification_document': verificationDocument,
      'is_verified_provider': isVerifiedProvider,
      'verification_date': verificationDate?.toIso8601String(),
      'working_hours': workingHours.join(','),
      'emergency_contact': emergencyContact,
    });
    return baseJson;
  }

  ServiceProviderModel copyWith({
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
    String? serviceType,
    String? businessName,
    String? businessDescription,
    String? businessCategory,
    List<String>? services,
    Map<String, dynamic>? pricing,
    List<String>? highlights,
    bool? isAvailable,
    double? rating,
    int? reviewCount,
    String? verificationDocument,
    bool? isVerifiedProvider,
    DateTime? verificationDate,
    List<String>? workingHours,
    String? emergencyContact,
  }) {
    return ServiceProviderModel(
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
      serviceType: serviceType ?? this.serviceType,
      businessName: businessName ?? this.businessName,
      businessDescription: businessDescription ?? this.businessDescription,
      businessCategory: businessCategory ?? this.businessCategory,
      services: services ?? this.services,
      pricing: pricing ?? this.pricing,
      highlights: highlights ?? this.highlights,
      isAvailable: isAvailable ?? this.isAvailable,
      rating: rating ?? this.rating,
      reviewCount: reviewCount ?? this.reviewCount,
      verificationDocument: verificationDocument ?? this.verificationDocument,
      isVerifiedProvider: isVerifiedProvider ?? this.isVerifiedProvider,
      verificationDate: verificationDate ?? this.verificationDate,
      workingHours: workingHours ?? this.workingHours,
      emergencyContact: emergencyContact ?? this.emergencyContact,
    );
  }

  @override
  String toString() {
    return 'ServiceProviderModel(id: $id, username: $username, serviceType: $serviceType, businessName: $businessName)';
  }
}
