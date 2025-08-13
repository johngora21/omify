import 'package:uuid/uuid.dart';

class PostModel {
  final String id;
  final String userId;
  final String? title;
  final String? content;
  final String postType; // 'normal', 'service', 'story', 'reel'
  final String? mediaUrl;
  final String? mediaType; // 'image', 'video', 'audio'
  final String? location;
  final List<String> hashtags;
  final Map<String, dynamic>? serviceDetails;
  final bool isActive;
  final bool isApproved;
  final int viewCount;
  final int likeCount;
  final int commentCount;
  final int shareCount;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? publishedAt;
  final DateTime? expiresAt;

  PostModel({
    String? id,
    required this.userId,
    this.title,
    this.content,
    this.postType = 'normal',
    this.mediaUrl,
    this.mediaType,
    this.location,
    List<String>? hashtags,
    this.serviceDetails,
    this.isActive = true,
    this.isApproved = true,
    this.viewCount = 0,
    this.likeCount = 0,
    this.commentCount = 0,
    this.shareCount = 0,
    DateTime? createdAt,
    DateTime? updatedAt,
    this.publishedAt,
    this.expiresAt,
  }) : 
    id = id ?? const Uuid().v4(),
    hashtags = hashtags ?? [],
    createdAt = createdAt ?? DateTime.now(),
    updatedAt = updatedAt ?? DateTime.now();

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      id: json['id'],
      userId: json['user_id'],
      title: json['title'],
      content: json['content'],
      postType: json['post_type'] ?? 'normal',
      mediaUrl: json['media_url'],
      mediaType: json['media_type'],
      location: json['location'],
      hashtags: json['hashtags'] != null 
          ? List<String>.from(json['hashtags'].split(',').where((s) => s.isNotEmpty))
          : [],
      serviceDetails: json['service_details'] != null 
          ? Map<String, dynamic>.from(json['service_details'])
          : null,
      isActive: json['is_active'] ?? true,
      isApproved: json['is_approved'] ?? true,
      viewCount: json['view_count'] ?? 0,
      likeCount: json['like_count'] ?? 0,
      commentCount: json['comment_count'] ?? 0,
      shareCount: json['share_count'] ?? 0,
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      publishedAt: json['published_at'] != null 
          ? DateTime.parse(json['published_at']) 
          : null,
      expiresAt: json['expires_at'] != null 
          ? DateTime.parse(json['expires_at']) 
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_id': userId,
      'title': title,
      'content': content,
      'post_type': postType,
      'media_url': mediaUrl,
      'media_type': mediaType,
      'location': location,
      'hashtags': hashtags.join(','),
      'service_details': serviceDetails?.toString(),
      'is_active': isActive,
      'is_approved': isApproved,
      'view_count': viewCount,
      'like_count': likeCount,
      'comment_count': commentCount,
      'share_count': shareCount,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
      'published_at': publishedAt?.toIso8601String(),
      'expires_at': expiresAt?.toIso8601String(),
    };
  }

  PostModel copyWith({
    String? id,
    String? userId,
    String? title,
    String? content,
    String? postType,
    String? mediaUrl,
    String? mediaType,
    String? location,
    List<String>? hashtags,
    Map<String, dynamic>? serviceDetails,
    bool? isActive,
    bool? isApproved,
    int? viewCount,
    int? likeCount,
    int? commentCount,
    int? shareCount,
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? publishedAt,
    DateTime? expiresAt,
  }) {
    return PostModel(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      title: title ?? this.title,
      content: content ?? this.content,
      postType: postType ?? this.postType,
      mediaUrl: mediaUrl ?? this.mediaUrl,
      mediaType: mediaType ?? this.mediaType,
      location: location ?? this.location,
      hashtags: hashtags ?? this.hashtags,
      serviceDetails: serviceDetails ?? this.serviceDetails,
      isActive: isActive ?? this.isActive,
      isApproved: isApproved ?? this.isApproved,
      viewCount: viewCount ?? this.viewCount,
      likeCount: likeCount ?? this.likeCount,
      commentCount: commentCount ?? this.commentCount,
      shareCount: shareCount ?? this.shareCount,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      publishedAt: publishedAt ?? this.publishedAt,
      expiresAt: expiresAt ?? this.expiresAt,
    );
  }

  @override
  String toString() {
    return 'PostModel(id: $id, userId: $userId, postType: $postType, title: $title)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is PostModel && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;
}
