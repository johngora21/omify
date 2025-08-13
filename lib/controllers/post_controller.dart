import '../models/post_model.dart';
import '../models/user_model.dart';
import '../repositories/post_repository.dart';
import '../repositories/user_repository.dart';

class PostController {
  final PostRepository _postRepository = PostRepository();
  final UserRepository _userRepository = UserRepository();

  // Create a new post
  Future<PostModel?> createPost(PostModel post) async {
    try {
      // Validate post data
      if (post.content == null || post.content!.isEmpty) {
        throw Exception('Post content cannot be empty');
      }

      if (post.userId.isEmpty) {
        throw Exception('User ID is required');
      }

      // Create the post
      final createdPost = await _postRepository.createPost(post);
      return createdPost;
    } catch (e) {
      print('Create post error: $e');
      rethrow;
    }
  }

  // Get post by ID
  Future<PostModel?> getPostById(String id) async {
    try {
      final post = await _postRepository.getPostById(id);
      if (post != null) {
        // Increment view count
        await _postRepository.incrementViewCount(id);
      }
      return post;
    } catch (e) {
      print('Get post error: $e');
      return null;
    }
  }

  // Get posts by user ID
  Future<List<PostModel>> getPostsByUserId(String userId, {int limit = 20, int offset = 0}) async {
    try {
      return await _postRepository.getPostsByUserId(userId, limit: limit, offset: offset);
    } catch (e) {
      print('Get user posts error: $e');
      return [];
    }
  }

  // Get all posts with optional filtering
  Future<List<PostModel>> getAllPosts({int limit = 50, int offset = 0, String? postType}) async {
    try {
      return await _postRepository.getAllPosts(limit: limit, offset: offset, postType: postType);
    } catch (e) {
      print('Get all posts error: $e');
      return [];
    }
  }

  // Update post
  Future<PostModel?> updatePost(PostModel post) async {
    try {
      // Validate post data
      if (post.content == null || post.content!.isEmpty) {
        throw Exception('Post content cannot be empty');
      }

      final updatedPost = await _postRepository.updatePost(post);
      return updatedPost;
    } catch (e) {
      print('Update post error: $e');
      rethrow;
    }
  }

  // Delete post
  Future<bool> deletePost(String postId, String userId) async {
    try {
      // Check if user owns the post
      final post = await _postRepository.getPostById(postId);
      if (post == null) {
        throw Exception('Post not found');
      }

      if (post.userId != userId) {
        throw Exception('Unauthorized to delete this post');
      }

      return await _postRepository.deletePost(postId);
    } catch (e) {
      print('Delete post error: $e');
      return false;
    }
  }

  // Like a post
  Future<bool> likePost(String postId) async {
    try {
      return await _postRepository.incrementLikeCount(postId);
    } catch (e) {
      print('Like post error: $e');
      return false;
    }
  }

  // Unlike a post
  Future<bool> unlikePost(String postId) async {
    try {
      return await _postRepository.decrementLikeCount(postId);
    } catch (e) {
      print('Unlike post error: $e');
      return false;
    }
  }

  // Search posts
  Future<List<PostModel>> searchPosts(String query, {int limit = 20, int offset = 0}) async {
    try {
      if (query.trim().isEmpty) {
        return [];
      }

      return await _postRepository.searchPosts(query, limit: limit, offset: offset);
    } catch (e) {
      print('Search posts error: $e');
      return [];
    }
  }

  // Get posts by service type
  Future<List<PostModel>> getServicePosts(String serviceType, {int limit = 20, int offset = 0}) async {
    try {
      return await _postRepository.getAllPosts(limit: limit, offset: offset, postType: 'service');
    } catch (e) {
      print('Get service posts error: $e');
      return [];
    }
  }

  // Get trending posts
  Future<List<PostModel>> getTrendingPosts({int limit = 20, int offset = 0}) async {
    try {
      // TODO: Implement trending algorithm based on likes, views, and recency
      return await _postRepository.getAllPosts(limit: limit, offset: offset);
    } catch (e) {
      print('Get trending posts error: $e');
      return [];
    }
  }

  // Get posts by hashtag
  Future<List<PostModel>> getPostsByHashtag(String hashtag, {int limit = 20, int offset = 0}) async {
    try {
      return await _postRepository.searchPosts('#$hashtag', limit: limit, offset: offset);
    } catch (e) {
      print('Get posts by hashtag error: $e');
      return [];
    }
  }

  // Get posts by location
  Future<List<PostModel>> getPostsByLocation(String location, {int limit = 20, int offset = 0}) async {
    try {
      // TODO: Implement location-based post filtering
      return await _postRepository.getAllPosts(limit: limit, offset: offset);
    } catch (e) {
      print('Get posts by location error: $e');
      return [];
    }
  }

  // Validate post content
  bool isValidPostContent(String content) {
    if (content.trim().isEmpty) return false;
    if (content.length > 5000) return false; // Max 5000 characters
    return true;
  }

  // Validate hashtags
  List<String> extractHashtags(String content) {
    final hashtagRegex = RegExp(r'#\w+');
    final matches = hashtagRegex.allMatches(content);
    return matches.map((match) => match.group(0)!).toList();
  }

  // Format post for display
  String formatPostContent(String content, {int maxLength = 200}) {
    if (content.length <= maxLength) return content;
    return '${content.substring(0, maxLength)}...';
  }
}
