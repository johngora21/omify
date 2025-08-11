import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ionicons/ionicons.dart';

class ReelsPage extends StatefulWidget {
  const ReelsPage({super.key});

  @override
  State<ReelsPage> createState() => _ReelsPageState();
}

class _ReelsPageState extends State<ReelsPage> {
  final PageController _pageController = PageController();
  final Set<String> _likedVideos = <String>{};
  final Set<String> _savedVideos = <String>{};
  int _currentVideoIndex = 0;
  int _selectedTabIndex = 0; // 0 for "For You", 1 for "Following", 2 for "Live"
  bool _showSearch = false;
  String _searchQuery = '';
  String _activeSearchCategory = 'forYou';

  final List<String> _searchCategories = [
    'forYou', 'trending', 'following', 'live', 'nearby'
  ];

  // Search suggestions data
  final List<Map<String, dynamic>> _searchSuggestions = [
    {
      'type': 'account',
      'username': '@tiktok_user1',
      'displayName': 'TikTok Creator',
      'avatar': 'https://picsum.photos/40/40?random=1',
      'followers': '125K',
      'isVerified': true,
    },
    {
      'type': 'account',
      'username': '@trending_creator',
      'displayName': 'Trending Now',
      'avatar': 'https://picsum.photos/40/40?random=2',
      'followers': '89K',
      'isVerified': false,
    },
    {
      'type': 'trending',
      'title': 'Dance Challenge',
      'views': '2.1M',
      'hashtag': '#dancechallenge',
    },
    {
      'type': 'trending',
      'title': 'Food Recipe',
      'views': '890K',
      'hashtag': '#foodrecipe',
    },
    {
      'type': 'trending',
      'title': 'Comedy Skit',
      'views': '1.5M',
      'hashtag': '#comedy',
    },
    {
      'type': 'account',
      'username': '@fashion_influencer',
      'displayName': 'Fashion Tips',
      'avatar': 'https://picsum.photos/40/40?random=3',
      'followers': '256K',
      'isVerified': true,
    },
  ];

  final List<Map<String, dynamic>> _searchResults = [
    {
      'id': '1',
      'type': 'video',
      'image': 'https://images.unsplash.com/photo-1494790108755-2616b612b786?w=400&h=600&fit=crop&crop=center',
      'title': 'Creative Photo Session',
      'user': 'Emma Thompson',
      'likes': '124K',
      'comments': '2.1K',
      'shares': '456',
      'music': 'Original Sound - Emma',
      'description': 'Amazing creative session! ✨',
      'height': 1.5,
    },
    {
      'id': '2',
      'type': 'video',
      'image': 'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=400&h=600&fit=crop&crop=face',
      'title': 'Dance Challenge',
      'user': 'Alex Chen',
      'likes': '89K',
      'comments': '1.5K',
      'shares': '234',
      'music': 'Trending Song - Artist',
      'description': 'Join the challenge! 💃',
      'height': 1.3,
    },
    {
      'id': '3',
      'type': 'video',
      'image': 'https://images.unsplash.com/photo-1534528741775-53994a69daeb?w=400&h=600&fit=crop&crop=face',
      'title': 'Cooking Tutorial',
      'user': 'Sarah Wilson',
      'likes': '67K',
      'comments': '892',
      'shares': '123',
      'music': 'Cooking Vibes - Chef',
      'description': 'Easy recipe for beginners 👩‍🍳',
      'height': 1.4,
    },
    {
      'id': '4',
      'type': 'video',
      'image': 'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?w=400&h=600&fit=crop&crop=center',
      'title': 'Travel Vlog',
      'user': 'Mike Johnson',
      'likes': '156K',
      'comments': '3.2K',
      'shares': '789',
      'music': 'Travel Music - Wanderer',
      'description': 'Beautiful sunset in Bali 🌅',
      'height': 1.6,
    },
    {
      'id': '5',
      'type': 'video',
      'image': 'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?w=400&h=400&fit=crop&crop=center',
      'title': 'Fashion Haul',
      'user': 'Lisa Park',
      'likes': '98K',
      'comments': '1.8K',
      'shares': '345',
      'music': 'Fashion Beats - Style',
      'description': 'New collection is fire! 🔥',
      'height': 1.2,
    },
    {
      'id': '6',
      'type': 'video',
      'image': 'https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?w=400&h=400&fit=crop&crop=center',
      'title': 'Workout Routine',
      'user': 'David Kim',
      'likes': '203K',
      'comments': '4.5K',
      'shares': '1.2K',
      'music': 'Workout Mix - Fitness',
      'description': 'Get fit with me! 💪',
      'height': 1.5,
    },
  ];

  final List<Map<String, dynamic>> _reels = [
    {
      'id': '1',
      'username': 'sophia_grace',
      'displayName': 'Sophia Grace',
      'avatar': 'https://images.unsplash.com/photo-1494790108755-2616b612b786?w=100&h=100&fit=crop&crop=face',
      'video': 'https://images.unsplash.com/photo-1519735997400-2f7bbcd69b1a?w=600&h=800&fit=crop',
      'caption': '✨ Creating meaningful connections and unforgettable experiences. Let\'s make memories together! #Connections #Memories #Lifestyle',
      'likes': 2340,
      'comments': 145,
      'shares': 89,
      'music': 'Chill Vibes - Sophia Grace',
      'duration': '0:15',
      'verified': true,
      'isLive': false,
      'category': 'forYou'
    },
    {
      'id': '2',
      'username': 'emma_wellness',
      'displayName': 'Emma Wellness',
      'avatar': 'https://images.unsplash.com/photo-1517841905240-472988babdf9?w=100&h=100&fit=crop&crop=face',
      'video': 'https://images.unsplash.com/photo-1544161515-4ab6ce6db874?w=600&h=800&fit=crop',
      'caption': '🌸 Wellness and relaxation sessions available. Swedish, deep tissue, and hot stone massages. Your journey to tranquility starts here! #Wellness #Relaxation #SelfCare',
      'likes': 1856,
      'comments': 223,
      'shares': 156,
      'music': 'Peaceful Melodies - Emma',
      'duration': '0:22',
      'verified': false,
      'isLive': false,
      'category': 'following'
    },
    {
      'id': '3',
      'username': 'luna_premium',
      'displayName': 'Luna Premium',
      'avatar': 'https://images.unsplash.com/photo-1539571696357-5a69c17a67c6?w=100&h=100&fit=crop&crop=face',
      'video': 'https://images.unsplash.com/photo-1571019613454-1cb2f99b2d8b?w=600&h=800&fit=crop',
      'caption': '💫 Premium lifestyle experiences and exclusive events. Creating moments that matter. #PremiumLifestyle #Exclusive #Experiences',
      'likes': 3298,
      'comments': 267,
      'shares': 234,
      'music': 'Luxury Beats - Luna',
      'duration': '0:18',
      'verified': true,
      'isLive': false,
      'category': 'forYou'
    },
    {
      'id': '4',
      'username': 'maya_creative',
      'displayName': 'Maya Creative',
      'avatar': 'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?w=100&h=100&fit=crop&crop=face',
      'video': 'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=600&h=800&fit=crop',
      'caption': '🎨 Expressing creativity through art and connection. Every moment is a canvas for beautiful experiences. #Creativity #Art #Connection',
      'likes': 2156,
      'comments': 189,
      'shares': 134,
      'music': 'Creative Flow - Maya',
      'duration': '0:25',
      'verified': false,
      'isLive': false,
      'category': 'following'
    },
    // Live reels
    {
      'id': '5',
      'username': 'live_events',
      'displayName': 'Live Events',
      'avatar': 'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=100&h=100&fit=crop&crop=face',
      'video': 'https://images.unsplash.com/photo-1519735997400-2f7bbcd69b1a?w=600&h=800&fit=crop',
      'caption': '🎉 LIVE NOW: Exclusive party experience! Join us for the ultimate night out! #Live #Party #Exclusive',
      'likes': 5420,
      'comments': 892,
      'shares': 445,
      'music': 'Live Beats - DJ Mix',
      'duration': 'LIVE',
      'verified': true,
      'isLive': true,
      'category': 'live',
      'viewers': 15420
    },
    {
      'id': '6',
      'username': 'fitness_live',
      'displayName': 'Fitness Live',
      'avatar': 'https://images.unsplash.com/photo-1494790108755-2616b612b786?w=100&h=100&fit=crop&crop=face',
      'video': 'https://images.unsplash.com/photo-1544161515-4ab6ce6db874?w=600&h=800&fit=crop',
      'caption': '💪 LIVE WORKOUT: High-intensity training session! Let\'s get fit together! #Live #Fitness #Workout',
      'likes': 3890,
      'comments': 567,
      'shares': 234,
      'music': 'Workout Mix - Energy Boost',
      'duration': 'LIVE',
      'verified': false,
      'isLive': true,
      'category': 'live',
      'viewers': 8920
    },
    {
      'id': '7',
      'username': 'cooking_show',
      'displayName': 'Cooking Show',
      'avatar': 'https://images.unsplash.com/photo-1539571696357-5a69c17a67c6?w=100&h=100&fit=crop&crop=face',
      'video': 'https://images.unsplash.com/photo-1571019613454-1cb2f99b2d8b?w=600&h=800&fit=crop',
      'caption': '👨‍🍳 LIVE COOKING: Making the perfect pasta! Watch and learn! #Live #Cooking #Food',
      'likes': 2156,
      'comments': 345,
      'shares': 123,
      'music': 'Kitchen Vibes - Cooking Sounds',
      'duration': 'LIVE',
      'verified': true,
      'isLive': true,
      'category': 'live',
      'viewers': 5670
    }
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _toggleLike(String videoId) {
    setState(() {
      if (_likedVideos.contains(videoId)) {
        _likedVideos.remove(videoId);
      } else {
        _likedVideos.add(videoId);
      }
    });
  }

  void _toggleSave(String videoId) {
    setState(() {
      if (_savedVideos.contains(videoId)) {
        _savedVideos.remove(videoId);
      } else {
        _savedVideos.add(videoId);
      }
    });
  }

  void _handleComment(String videoId) {
    // Handle comment
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Comment on video: $videoId')),
    );
  }

  void _handleShare(String videoId) {
    // Handle share
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Share video: $videoId')),
    );
  }

  void _onPageChanged(int index) {
    setState(() {
      _currentVideoIndex = index;
    });
  }

  void _onTabChanged(int index) {
    setState(() {
      _selectedTabIndex = index;
    });
  }

  List<Map<String, dynamic>> get _filteredSearchResults {
    if (_searchQuery.isEmpty) {
      return _searchResults;
    }

    return _searchResults.where((item) {
      return item['title'].toLowerCase().contains(_searchQuery.toLowerCase()) ||
             item['user'].toLowerCase().contains(_searchQuery.toLowerCase()) ||
             item['description'].toLowerCase().contains(_searchQuery.toLowerCase());
    }).toList();
  }

  List<Map<String, dynamic>> get _filteredSearchSuggestions {
    if (_searchQuery.isEmpty) {
      return _searchSuggestions;
    }
    return _searchSuggestions.where((item) {
      if (item['type'] == 'account') {
        return item['username'].toLowerCase().contains(_searchQuery.toLowerCase()) ||
               item['displayName'].toLowerCase().contains(_searchQuery.toLowerCase());
      } else if (item['type'] == 'trending') {
        return item['title'].toLowerCase().contains(_searchQuery.toLowerCase()) ||
               item['hashtag'].toLowerCase().contains(_searchQuery.toLowerCase());
      }
      return false;
    }).toList();
  }

  String _getSearchCategoryLabel(String category) {
    switch (category) {
      case 'forYou':
        return 'For You';
      case 'trending':
        return 'Trending';
      case 'following':
        return 'Following';
      case 'live':
        return 'Live';
      case 'nearby':
        return 'Nearby';
      default:
        return category;
    }
  }

  Widget _buildSearchView() {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            // Header with Back Button and Search Bar
            Container(
              color: Colors.black,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => setState(() => _showSearch = false),
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Icon(Icons.arrow_back, size: 20, color: Colors.white),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: TextField(
                        onChanged: (value) => setState(() => _searchQuery = value),
                        style: const TextStyle(color: Colors.white),
                        decoration: const InputDecoration(
                          hintText: 'Search videos, users, sounds...',
                          hintStyle: TextStyle(color: Colors.white70),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                          prefixIcon: Icon(Icons.search, color: Colors.white70, size: 20),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Search Suggestions (show when typing)
            if (_searchQuery.isNotEmpty) ...[
              Container(
                color: Colors.black,
                child: _buildSearchSuggestions(),
              ),
              const SizedBox(height: 8),
            ],

            // TikTok Style Tabs (hide when typing)
            if (_searchQuery.isEmpty) ...[
              Container(
                height: 40,
                color: Colors.black,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemCount: _searchCategories.length,
                  itemBuilder: (context, index) {
                    final category = _searchCategories[index];
                    final isActive = _activeSearchCategory == category;
                    
                    return GestureDetector(
                      onTap: () => setState(() => _activeSearchCategory = category),
                      child: Container(
                        margin: const EdgeInsets.only(right: 12),
                        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                        decoration: BoxDecoration(
                          color: isActive ? Colors.white : Colors.white.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(18),
                          border: Border.all(
                            color: isActive ? Colors.white : Colors.transparent,
                            width: 1,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            _getSearchCategoryLabel(category),
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                              color: isActive ? Colors.black : Colors.white,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),

              const SizedBox(height: 8),
            ],

            // TikTok Style Grid
            Expanded(
              child: _filteredSearchResults.isEmpty
                  ? _buildEmptySearchState()
                  : _buildTikTokSearchGrid(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTikTokSearchGrid() {
    return GridView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.7,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
      ),
      itemCount: _filteredSearchResults.length,
      itemBuilder: (context, index) {
        return _buildTikTokSearchCard(_filteredSearchResults[index]);
      },
    );
  }

  Widget _buildTikTokSearchCard(Map<String, dynamic> item) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                item['image'],
                fit: BoxFit.cover,
              ),
            ),
          ),
          
          // Gradient Overlay
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.black.withOpacity(0.3),
                    Colors.black.withOpacity(0.7),
                  ],
                ),
              ),
            ),
          ),

          // User Info at Bottom
          Positioned(
            bottom: 8,
            left: 8,
            right: 8,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '@${item['user'].toLowerCase().replaceAll(' ', '')}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  item['description'],
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Icon(
                      Icons.music_note,
                      color: Colors.white,
                      size: 12,
                    ),
                    const SizedBox(width: 4),
                    Expanded(
                      child: Text(
                        item['music'],
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchSuggestions() {
    if (_filteredSearchSuggestions.isEmpty) {
      return Container(
        padding: const EdgeInsets.all(16),
        child: Text(
          'No suggestions found',
          style: TextStyle(
            color: Colors.white.withOpacity(0.6),
            fontSize: 14,
          ),
        ),
      );
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Suggestions',
            style: TextStyle(
              color: Colors.white.withOpacity(0.8),
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 12),
          ...(_filteredSearchSuggestions.take(5).map((suggestion) => _buildSuggestionItem(suggestion))),
        ],
      ),
    );
  }

  Widget _buildSuggestionItem(Map<String, dynamic> suggestion) {
    if (suggestion['type'] == 'account') {
      return Container(
        margin: const EdgeInsets.only(bottom: 12),
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  image: NetworkImage(suggestion['avatar']),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        suggestion['displayName'],
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      if (suggestion['isVerified']) ...[
                        const SizedBox(width: 8),
                        Icon(
                          Icons.verified,
                          size: 14,
                          color: Colors.blue,
                        ),
                      ],
                    ],
                  ),
                  Text(
                    suggestion['username'],
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.7),
                      fontSize: 12,
                    ),
                  ),
                  Text(
                    '${suggestion['followers']} followers',
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.6),
                      fontSize: 11,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Text(
                'Follow',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      );
    } else if (suggestion['type'] == 'trending') {
      return Container(
        margin: const EdgeInsets.only(bottom: 12),
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(
                Icons.trending_up,
                color: Colors.white,
                size: 20,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    suggestion['title'],
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    suggestion['hashtag'],
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 12,
                    ),
                  ),
                  Text(
                    '${suggestion['views']} views',
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.6),
                      fontSize: 11,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }
    return const SizedBox.shrink();
  }

  Widget _buildEmptySearchState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.search_off,
            size: 64,
            color: Colors.white.withOpacity(0.5),
          ),
          const SizedBox(height: 16),
          Text(
            'No results found',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.white.withOpacity(0.7),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Try searching for something else',
            style: TextStyle(
              fontSize: 14,
              color: Colors.white.withOpacity(0.5),
            ),
          ),
        ],
      ),
    );
  }

  String _formatNumber(int num) {
    if (num >= 1000000) {
      return '${(num / 1000000).toStringAsFixed(1)}M';
    } else if (num >= 1000) {
      return '${(num / 1000).toStringAsFixed(1)}K';
    }
    return num.toString();
  }

  // Get filtered content based on selected tab
  List<Map<String, dynamic>> _getFilteredContent() {
    switch (_selectedTabIndex) {
      case 0: // For You
        return _reels.where((reel) => reel['category'] == 'forYou').toList();
      case 1: // Following
        return _reels.where((reel) => reel['category'] == 'following').toList();
      case 2: // Live
        return _reels.where((reel) => reel['isLive'] == true).toList();
      default:
        return _reels.where((reel) => reel['category'] == 'forYou').toList();
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_showSearch) {
      return _buildSearchView();
    }
    
    final filteredReels = _getFilteredContent();
    
    return Scaffold(
      backgroundColor: Colors.black,
      body: PageView.builder(
        controller: _pageController,
        scrollDirection: Axis.vertical,
        onPageChanged: _onPageChanged,
        itemCount: filteredReels.length,
        itemBuilder: (context, index) {
          final reel = filteredReels[index];
          return _buildReelCard(reel, index);
        },
      ),
    );
  }

  Widget _buildReelCard(Map<String, dynamic> reel, int index) {
    return Stack(
      children: [
        // Video Background
        Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(reel['video']),
              fit: BoxFit.cover,
            ),
          ),
        ),

        // Gradient overlay for better text visibility
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.transparent,
                Colors.black.withOpacity(0.3),
                Colors.black.withOpacity(0.7),
              ],
            ),
          ),
        ),

        // Right Side Actions (TikTok Style)
        Positioned(
          right: 16,
          bottom: 0,
          child: Container(
            padding: const EdgeInsets.only(bottom: 20),
            child: Column(
              children: [
                // Live indicator for live content
                if (reel['isLive'])
                  Container(
                    margin: const EdgeInsets.only(bottom: 16),
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: const Color(0xFFEF4444),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          width: 6,
                          height: 6,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                        ),
                        const SizedBox(width: 4),
                        Text(
                          'LIVE',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                
                // Profile Button
                GestureDetector(
                  onTap: () {},
                  child: Column(
                    children: [
                      Container(
                        width: 48,
                        height: 48,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 2),
                          image: DecorationImage(
                            image: NetworkImage(reel['avatar']),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Container(
                        width: 24,
                        height: 24,
                        decoration: const BoxDecoration(
                          color: Color(0xFFFE2C55),
                          shape: BoxShape.circle,
                        ),
                        child: const Center(
                          child: Text(
                            '+',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                // Like Button
                GestureDetector(
                  onTap: () => _toggleLike(reel['id']),
                  child: Column(
                    children: [
                      Icon(
                        _likedVideos.contains(reel['id']) 
                            ? Icons.favorite 
                            : Icons.favorite_border,
                        color: _likedVideos.contains(reel['id']) 
                            ? const Color(0xFFFE2C55) 
                            : Colors.white,
                        size: 28,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        _formatNumber(reel['likes'] + (_likedVideos.contains(reel['id']) ? 1 : 0)),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                // Comment Button
                GestureDetector(
                  onTap: () => _handleComment(reel['id']),
                  child: Column(
                    children: [
                      const Icon(
                        Ionicons.chatbubble,
                        color: Colors.white,
                        size: 28,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        _formatNumber(reel['comments']),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                // Share Button
                GestureDetector(
                  onTap: () => _handleShare(reel['id']),
                  child: Column(
                    children: [
                      const Icon(
                        Icons.share_outlined,
                        color: Colors.white,
                        size: 28,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        _formatNumber(reel['shares']),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                // Save Button
                GestureDetector(
                  onTap: () => _toggleSave(reel['id']),
                  child: Icon(
                    _savedVideos.contains(reel['id']) 
                        ? FontAwesomeIcons.bookmark 
                        : FontAwesomeIcons.bookmark,
                    color: _savedVideos.contains(reel['id']) 
                        ? const Color(0xFFFFA502) 
                        : Colors.white,
                    size: 24,
                  ),
                ),

                const SizedBox(height: 20),

                // More Options
                const Icon(
                  Icons.more_vert,
                  color: Colors.white,
                  size: 24,
                ),
              ],
            ),
          ),
        ),

        // Bottom Content (TikTok Style)
        Positioned(
          bottom: 0,
          left: 16,
          right: 80,
          child: Container(
            padding: const EdgeInsets.only(bottom: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Username and Caption
                Row(
                  children: [
                    Text(
                      '@${reel['username']}',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                    if (reel['verified']) ...[
                      const SizedBox(width: 8),
                      Container(
                        padding: const EdgeInsets.all(2),
                        decoration: const BoxDecoration(
                          color: Color(0xFFFE2C55),
                          shape: BoxShape.circle,
                        ),
                        child: const Text(
                          '✓',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  reel['caption'],
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                    height: 1.3,
                  ),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 12),

                // Music Info
                Row(
                  children: [
                    const Icon(
                      Icons.music_note,
                      color: Colors.white,
                      size: 16,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      reel['music'],
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),

                // Duration
                Text(
                  reel['isLive'] ? 'LIVE' : reel['duration'],
                  style: TextStyle(
                    fontSize: 12,
                    color: reel['isLive'] ? const Color(0xFFEF4444) : Colors.white70,
                    fontWeight: reel['isLive'] ? FontWeight.w600 : FontWeight.normal,
                  ),
                ),
              ],
            ),
          ),
        ),

        // Top Navigation (TikTok Style)
        Positioned(
          top: 60,
          left: 16,
          right: 16,
          child: Column(
            children: [
              // Live indicator for live content
              if (reel['isLive'])
                Container(
                  margin: const EdgeInsets.only(bottom: 16),
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: const Color(0xFFEF4444),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: 8,
                        height: 8,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                      ),
                      const SizedBox(width: 6),
                      Text(
                        'LIVE ${reel['viewers'] != null ? '• ${_formatNumber(reel['viewers'])} watching' : ''}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              
              // Tab Navigation
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () => _onTabChanged(0),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: _selectedTabIndex == 0 ? Colors.white : Colors.transparent,
                            width: 2,
                          ),
                        ),
                      ),
                      child: Text(
                        'For You',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: _selectedTabIndex == 0 ? Colors.white : Colors.white.withOpacity(0.7),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 24),
                  GestureDetector(
                    onTap: () => _onTabChanged(1),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: _selectedTabIndex == 1 ? Colors.white : Colors.transparent,
                            width: 2,
                          ),
                        ),
                      ),
                      child: Text(
                        'Following',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: _selectedTabIndex == 1 ? Colors.white : Colors.white.withOpacity(0.7),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 24),
                  GestureDetector(
                    onTap: () => _onTabChanged(2),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: _selectedTabIndex == 2 ? Colors.white : Colors.transparent,
                            width: 2,
                          ),
                        ),
                      ),
                      child: Text(
                        'Live',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: _selectedTabIndex == 2 ? Colors.white : Colors.white.withOpacity(0.7),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 24),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _showSearch = !_showSearch;
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      child: Icon(
                        Icons.search,
                        color: _showSearch ? Colors.white : Colors.white.withOpacity(0.7),
                        size: 24,
                      ),
                    ),
                  ),
                ],
              ),
            ),
      ]
      ),
        ),

        // Video Navigation Dots
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            padding: const EdgeInsets.only(bottom: 20),
            child: Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: _reels.asMap().entries.map((entry) {
                  final index = entry.key;
                  final isActive = index == _currentVideoIndex;
                  return Container(
                    width: 8,
                    height: 8,
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    decoration: BoxDecoration(
                      color: isActive ? Colors.white : Colors.white.withOpacity(0.5),
                      shape: BoxShape.circle,
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
