class User {
  final String id;
  final String username;
  final String email;
  final String? profilePicture;
  final String? bio;
  final String? location;
  final String? phoneNumber;
  final DateTime? dateOfBirth;
  final String? gender;
  final List<String> interests;
  final bool isVerified;
  final bool isPremium;
  final DateTime createdAt;
  final DateTime updatedAt;

  User({
    required this.id,
    required this.username,
    required this.email,
    this.profilePicture,
    this.bio,
    this.location,
    this.phoneNumber,
    this.dateOfBirth,
    this.gender,
    required this.interests,
    required this.isVerified,
    required this.isPremium,
    required this.createdAt,
    required this.updatedAt,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      username: json['username'],
      email: json['email'],
      profilePicture: json['profilePicture'],
      bio: json['bio'],
      location: json['location'],
      phoneNumber: json['phoneNumber'],
      dateOfBirth: json['dateOfBirth'] != null 
          ? DateTime.parse(json['dateOfBirth']) 
          : null,
      gender: json['gender'],
      interests: List<String>.from(json['interests'] ?? []),
      isVerified: json['isVerified'] ?? false,
      isPremium: json['isPremium'] ?? false,
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'username': username,
      'email': email,
      'profilePicture': profilePicture,
      'bio': bio,
      'location': location,
      'phoneNumber': phoneNumber,
      'dateOfBirth': dateOfBirth?.toIso8601String(),
      'gender': gender,
      'interests': interests,
      'isVerified': isVerified,
      'isPremium': isPremium,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }
}

class ServiceProvider extends User {
  final String serviceType;
  final String? businessName;
  final String? businessDescription;
  final List<String> services;
  final double hourlyRate;
  final List<String> availability;
  final List<String> languages;
  final List<String> certifications;
  final double rating;
  final int reviewCount;
  final bool isAvailable;
  final String? businessAddress;
  final double? latitude;
  final double? longitude;
  final List<String> photos;
  final List<String> videos;
  final Map<String, dynamic> additionalInfo;

  ServiceProvider({
    required super.id,
    required super.username,
    required super.email,
    super.profilePicture,
    super.bio,
    super.location,
    super.phoneNumber,
    super.dateOfBirth,
    super.gender,
    required super.interests,
    required super.isVerified,
    required super.isPremium,
    required super.createdAt,
    required super.updatedAt,
    required this.serviceType,
    this.businessName,
    this.businessDescription,
    required this.services,
    required this.hourlyRate,
    required this.availability,
    required this.languages,
    required this.certifications,
    required this.rating,
    required this.reviewCount,
    required this.isAvailable,
    this.businessAddress,
    this.latitude,
    this.longitude,
    required this.photos,
    required this.videos,
    required this.additionalInfo,
  });

  factory ServiceProvider.fromJson(Map<String, dynamic> json) {
    return ServiceProvider(
      id: json['id'],
      username: json['username'],
      email: json['email'],
      profilePicture: json['profilePicture'],
      bio: json['bio'],
      location: json['location'],
      phoneNumber: json['phoneNumber'],
      dateOfBirth: json['dateOfBirth'] != null 
          ? DateTime.parse(json['dateOfBirth']) 
          : null,
      gender: json['gender'],
      interests: List<String>.from(json['interests'] ?? []),
      isVerified: json['isVerified'] ?? false,
      isPremium: json['isPremium'] ?? false,
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      serviceType: json['serviceType'],
      businessName: json['businessName'],
      businessDescription: json['businessDescription'],
      services: List<String>.from(json['services'] ?? []),
      hourlyRate: (json['hourlyRate'] ?? 0).toDouble(),
      availability: List<String>.from(json['availability'] ?? []),
      languages: List<String>.from(json['languages'] ?? []),
      certifications: List<String>.from(json['certifications'] ?? []),
      rating: (json['rating'] ?? 0).toDouble(),
      reviewCount: json['reviewCount'] ?? 0,
      isAvailable: json['isAvailable'] ?? false,
      businessAddress: json['businessAddress'],
      latitude: json['latitude']?.toDouble(),
      longitude: json['longitude']?.toDouble(),
      photos: List<String>.from(json['photos'] ?? []),
      videos: List<String>.from(json['videos'] ?? []),
      additionalInfo: Map<String, dynamic>.from(json['additionalInfo'] ?? {}),
    );
  }

  @override
  Map<String, dynamic> toJson() {
    final baseJson = super.toJson();
    baseJson.addAll({
      'serviceType': serviceType,
      'businessName': businessName,
      'businessDescription': businessDescription,
      'services': services,
      'hourlyRate': hourlyRate,
      'availability': availability,
      'languages': languages,
      'certifications': certifications,
      'rating': rating,
      'reviewCount': reviewCount,
      'isAvailable': isAvailable,
      'businessAddress': businessAddress,
      'latitude': latitude,
      'longitude': longitude,
      'photos': photos,
      'videos': videos,
      'additionalInfo': additionalInfo,
    });
    return baseJson;
  }
}

class Review {
  final String id;
  final String userId;
  final String serviceProviderId;
  final double rating;
  final String comment;
  final DateTime createdAt;

  Review({
    required this.id,
    required this.userId,
    required this.serviceProviderId,
    required this.rating,
    required this.comment,
    required this.createdAt,
  });

  factory Review.fromJson(Map<String, dynamic> json) {
    return Review(
      id: json['id'],
      userId: json['userId'],
      serviceProviderId: json['serviceProviderId'],
      rating: (json['rating'] ?? 0).toDouble(),
      comment: json['comment'],
      createdAt: DateTime.parse(json['createdAt']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'serviceProviderId': serviceProviderId,
      'rating': rating,
      'comment': comment,
      'createdAt': createdAt.toIso8601String(),
    };
  }
}

class Client extends User {
  final List<String> favoriteProviders;
  final List<String> bookingHistory;
  final List<String> reviews;

  Client({
    required super.id,
    required super.username,
    required super.email,
    super.profilePicture,
    super.bio,
    super.location,
    super.phoneNumber,
    super.dateOfBirth,
    super.gender,
    required super.interests,
    required super.isVerified,
    required super.isPremium,
    required super.createdAt,
    required super.updatedAt,
    required this.favoriteProviders,
    required this.bookingHistory,
    required this.reviews,
  });

  factory Client.fromJson(Map<String, dynamic> json) {
    return Client(
      id: json['id'],
      username: json['username'],
      email: json['email'],
      profilePicture: json['profilePicture'],
      bio: json['bio'],
      location: json['location'],
      phoneNumber: json['phoneNumber'],
      dateOfBirth: json['dateOfBirth'] != null 
          ? DateTime.parse(json['dateOfBirth']) 
          : null,
      gender: json['gender'],
      interests: List<String>.from(json['interests'] ?? []),
      isVerified: json['isVerified'] ?? false,
      isPremium: json['isPremium'] ?? false,
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      favoriteProviders: List<String>.from(json['favoriteProviders'] ?? []),
      bookingHistory: List<String>.from(json['bookingHistory'] ?? []),
      reviews: List<String>.from(json['reviews'] ?? []),
    );
  }

  @override
  Map<String, dynamic> toJson() {
    final baseJson = super.toJson();
    baseJson.addAll({
      'favoriteProviders': favoriteProviders,
      'bookingHistory': bookingHistory,
      'reviews': reviews,
    });
    return baseJson;
  }
}

class Booking {
  final String id;
  final String clientId;
  final String serviceProviderId;
  final DateTime dateTime;
  final String serviceType;
  final double totalAmount;
  final String status;
  final String? notes;
  final DateTime createdAt;

  Booking({
    required this.id,
    required this.clientId,
    required this.serviceProviderId,
    required this.dateTime,
    required this.serviceType,
    required this.totalAmount,
    required this.status,
    this.notes,
    required this.createdAt,
  });

  factory Booking.fromJson(Map<String, dynamic> json) {
    return Booking(
      id: json['id'],
      clientId: json['clientId'],
      serviceProviderId: json['serviceProviderId'],
      dateTime: DateTime.parse(json['dateTime']),
      serviceType: json['serviceType'],
      totalAmount: (json['totalAmount'] ?? 0).toDouble(),
      status: json['status'],
      notes: json['notes'],
      createdAt: DateTime.parse(json['createdAt']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'clientId': clientId,
      'serviceProviderId': serviceProviderId,
      'dateTime': dateTime.toIso8601String(),
      'serviceType': serviceType,
      'totalAmount': totalAmount,
      'status': status,
      'notes': notes,
      'createdAt': createdAt.toIso8601String(),
    };
  }
}

class FilterOptions {
  final String? serviceType;
  final String? location;
  final double? minPrice;
  final double? maxPrice;
  final double? minRating;
  final List<String>? languages;
  final bool? isAvailable;
  final List<String>? certifications;

  FilterOptions({
    this.serviceType,
    this.location,
    this.minPrice,
    this.maxPrice,
    this.minRating,
    this.languages,
    this.isAvailable,
    this.certifications,
  });

  Map<String, dynamic> toJson() {
    return {
      'serviceType': serviceType,
      'location': location,
      'minPrice': minPrice,
      'maxPrice': maxPrice,
      'minRating': minRating,
      'languages': languages,
      'isAvailable': isAvailable,
      'certifications': certifications,
    };
  }
}
