import '../models/post_model.dart';
import '../services/database_service.dart';

class PostRepository {
  final DatabaseService _databaseService = DatabaseService.instance;

  Future<PostModel> createPost(PostModel post) async {
    final connection = await _databaseService.connection;
    
    final result = await connection.execute(
      'INSERT INTO posts (id, user_id, title, content, post_type, media_url, media_type, location, hashtags, service_details, is_active, is_approved, view_count, like_count, comment_count, share_count, created_at, updated_at, published_at, expires_at) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)',
      <Object?>[
        post.id,
        post.userId,
        post.title,
        post.content,
        post.postType,
        post.mediaUrl,
        post.mediaType,
        post.location,
        post.hashtags.join(','),
        post.serviceDetails?.toString(),
        post.isActive,
        post.isApproved,
        post.viewCount,
        post.likeCount,
        post.commentCount,
        post.shareCount,
        post.createdAt.toIso8601String(),
        post.updatedAt.toIso8601String(),
        post.publishedAt?.toIso8601String(),
        post.expiresAt?.toIso8601String(),
      ],
    );

    if (result.affectedRows == 0) {
      throw Exception('Failed to create post');
    }

    return post;
  }

  Future<PostModel?> getPostById(String id) async {
    final connection = await _databaseService.connection;
    
    final result = await connection.execute(
      'SELECT * FROM posts WHERE id = ?',
      <Object?>[id],
    );

    if (result.rows.isEmpty) {
      return null;
    }

    final row = result.rows.first.assoc();
    return PostModel.fromJson(row);
  }

  Future<List<PostModel>> getPostsByUserId(String userId, {int limit = 20, int offset = 0}) async {
    final connection = await _databaseService.connection;
    
    final result = await connection.execute(
      'SELECT * FROM posts WHERE user_id = ? AND is_active = true ORDER BY created_at DESC LIMIT ? OFFSET ?',
      <Object?>[userId, limit, offset],
    );

    return result.rows.map((row) => PostModel.fromJson(row.assoc())).toList();
  }

  Future<List<PostModel>> getAllPosts({int limit = 50, int offset = 0, String? postType}) async {
    final connection = await _databaseService.connection;
    
    String sql = 'SELECT * FROM posts WHERE is_active = true AND is_approved = true';
    List<Object?> params = [];
    
    if (postType != null) {
      sql += ' AND post_type = ?';
      params.add(postType);
    }
    
    sql += ' ORDER BY created_at DESC LIMIT ? OFFSET ?';
    params.addAll([limit, offset]);

    final result = await connection.execute(sql, params);

    return result.rows.map((row) => PostModel.fromJson(row.assoc())).toList();
  }

  Future<PostModel> updatePost(PostModel post) async {
    final connection = await _databaseService.connection;
    
    final result = await connection.execute(
      'UPDATE posts SET title = ?, content = ?, post_type = ?, media_url = ?, media_type = ?, location = ?, hashtags = ?, service_details = ?, is_active = ?, is_approved = ?, updated_at = ? WHERE id = ?',
      <Object?>[
        post.title,
        post.content,
        post.postType,
        post.mediaUrl,
        post.mediaType,
        post.location,
        post.hashtags.join(','),
        post.serviceDetails?.toString(),
        post.isActive,
        post.isApproved,
        DateTime.now().toIso8601String(),
        post.id,
      ],
    );

    if (result.affectedRows == 0) {
      throw Exception('Failed to update post');
    }

    return post.copyWith(updatedAt: DateTime.now());
  }

  Future<bool> deletePost(String id) async {
    final connection = await _databaseService.connection;
    
    final result = await connection.execute(
      'UPDATE posts SET is_active = false, updated_at = ? WHERE id = ?',
      <Object?>[DateTime.now().toIso8601String(), id],
    );

    return result.affectedRows > 0;
  }

  Future<bool> incrementViewCount(String id) async {
    final connection = await _databaseService.connection;
    
    final result = await connection.execute(
      'UPDATE posts SET view_count = view_count + 1, updated_at = ? WHERE id = ?',
      <Object?>[DateTime.now().toIso8601String(), id],
    );

    return result.affectedRows > 0;
  }

  Future<bool> incrementLikeCount(String id) async {
    final connection = await _databaseService.connection;
    
    final result = await connection.execute(
      'UPDATE posts SET like_count = like_count + 1, updated_at = ? WHERE id = ?',
      <Object?>[DateTime.now().toIso8601String(), id],
    );

    return result.affectedRows > 0;
  }

  Future<bool> decrementLikeCount(String id) async {
    final connection = await _databaseService.connection;
    
    final result = await connection.execute(
      'UPDATE posts SET like_count = GREATEST(like_count - 1, 0), updated_at = ? WHERE id = ?',
      <Object?>[DateTime.now().toIso8601String(), id],
    );

    return result.affectedRows > 0;
  }

  Future<List<PostModel>> searchPosts(String query, {int limit = 20, int offset = 0}) async {
    final connection = await _databaseService.connection;
    
    final result = await connection.execute(
      'SELECT * FROM posts WHERE (title LIKE ? OR content LIKE ? OR hashtags LIKE ?) AND is_active = true AND is_approved = true ORDER BY created_at DESC LIMIT ? OFFSET ?',
      <Object?>['%$query%', '%$query%', '%$query%', limit, offset],
    );

    return result.rows.map((row) => PostModel.fromJson(row.assoc())).toList();
  }
}
