import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({super.key});

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  String _searchQuery = '';
  String _activeCategory = 'all';

  final List<String> _categories = [
    'all', 'entertainment', 'sports', 'anime & comics', 'travel', 
    'food', 'gaming', 'daily life', 'comedy', 'fashion', 'politics',
    'technology', 'health', 'education', 'business', 'lifestyle'
  ];

  // Search suggestions data
  final List<Map<String, dynamic>> _searchSuggestions = [
    {
      'type': 'account',
      'username': '@instagram_user1',
      'displayName': 'Instagram Creator',
      'avatar': 'https://picsum.photos/40/40?random=10',
      'followers': '125K',
      'isVerified': true,
    },
    {
      'type': 'account',
      'username': '@trending_creator',
      'displayName': 'Trending Now',
      'avatar': 'https://picsum.photos/40/40?random=11',
      'followers': '89K',
      'isVerified': false,
    },
    {
      'type': 'trending',
      'title': 'Fashion Week',
      'views': '2.1M',
      'hashtag': '#fashionweek',
    },
    {
      'type': 'trending',
      'title': 'Food Recipe',
      'views': '890K',
      'hashtag': '#foodrecipe',
    },
    {
      'type': 'trending',
      'title': 'Travel Guide',
      'views': '1.5M',
      'hashtag': '#travelguide',
    },
    {
      'type': 'account',
      'username': '@fashion_influencer',
      'displayName': 'Fashion Tips',
      'avatar': 'https://picsum.photos/40/40?random=12',
      'followers': '256K',
      'isVerified': true,
    },
  ];

  final List<Map<String, dynamic>> _exploreResults = [
    {
      'id': '1',
      'type': 'image',
      'imageUrl': 'https://picsum.photos/300/300?random=1',
      'title': 'Creative Photo Session',
      'user': '@emma_thompson',
      'likes': '124K',
      'comments': '2.1K',
    },
    {
      'id': '2',
      'type': 'video',
      'imageUrl': 'https://picsum.photos/300/300?random=2',
      'title': 'Dance Challenge',
      'user': '@alex_chen',
      'likes': '89K',
      'comments': '1.5K',
    },
    {
      'id': '3',
      'type': 'image',
      'imageUrl': 'https://picsum.photos/300/300?random=3',
      'title': 'Cooking Tutorial',
      'user': '@sarah_wilson',
      'likes': '67K',
      'comments': '892',
    },
    {
      'id': '4',
      'type': 'video',
      'imageUrl': 'https://picsum.photos/300/300?random=4',
      'title': 'Travel Vlog',
      'user': '@mike_johnson',
      'likes': '156K',
      'comments': '3.2K',
    },
    {
      'id': '5',
      'type': 'image',
      'imageUrl': 'https://picsum.photos/300/300?random=5',
      'title': 'Fashion Haul',
      'user': '@lisa_park',
      'likes': '98K',
      'comments': '1.8K',
    },
    {
      'id': '6',
      'type': 'video',
      'imageUrl': 'https://picsum.photos/300/300?random=6',
      'title': 'Workout Routine',
      'user': '@david_kim',
      'likes': '203K',
      'comments': '4.5K',
    },
    {
      'id': '7',
      'type': 'image',
      'imageUrl': 'https://picsum.photos/300/300?random=7',
      'title': 'Street Art',
      'user': '@art_enthusiast',
      'likes': '2.8K',
      'comments': '134',
    },
    {
      'id': '8',
      'type': 'video',
      'imageUrl': 'https://picsum.photos/300/300?random=8',
      'title': 'Music Session',
      'user': '@musician_jane',
      'likes': '6.2K',
      'comments': '312',
    },
    {
      'id': '9',
      'type': 'image',
      'imageUrl': 'https://picsum.photos/300/300?random=9',
      'title': 'Garden Beauty',
      'user': '@green_thumb',
      'likes': '1.9K',
      'comments': '87',
    },
  ];

  List<Map<String, dynamic>> get _filteredResults {
    if (_searchQuery.isEmpty) {
      return _exploreResults;
    }

    return _exploreResults.where((item) {
      return item['title'].toLowerCase().contains(_searchQuery.toLowerCase()) ||
             item['user'].toLowerCase().contains(_searchQuery.toLowerCase());
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

  String _getCategoryLabel(String category) {
    switch (category) {
      case 'all':
        return 'All';
      case 'anime & comics':
        return 'Anime & Comics';
      case 'daily life':
        return 'Daily Life';
      default:
        return category[0].toUpperCase() + category.substring(1);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Header with Back Button and Search Bar
            Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => context.go('/'),
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Icon(Icons.arrow_back, size: 20, color: Colors.black87),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[100],
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: TextField(
                        onChanged: (value) => setState(() => _searchQuery = value),
                        style: const TextStyle(color: Colors.black87),
                        decoration: const InputDecoration(
                          hintText: 'Search posts, users, hashtags...',
                          hintStyle: TextStyle(color: Colors.grey),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                          prefixIcon: Icon(Icons.search, color: Colors.grey, size: 20),
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
                color: Colors.white,
                child: _buildSearchSuggestions(),
              ),
              const SizedBox(height: 8),
            ],

            // Category Tabs (hide when typing)
            if (_searchQuery.isEmpty) ...[
              Container(
                height: 40,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemCount: _categories.length,
                  itemBuilder: (context, index) {
                    final category = _categories[index];
                    final isActive = _activeCategory == category;
                    
                    return GestureDetector(
                      onTap: () => setState(() => _activeCategory = category),
                      child: Container(
                        margin: const EdgeInsets.only(right: 12),
                        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                        decoration: BoxDecoration(
                          color: isActive ? Colors.black : Colors.grey[100],
                          borderRadius: BorderRadius.circular(18),
                        ),
                        child: Center(
                          child: Text(
                            _getCategoryLabel(category),
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                              color: isActive ? Colors.white : Colors.black87,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],

            // Explore Grid
            Expanded(
              child: _filteredResults.isEmpty
                  ? _buildEmptyState()
                  : _buildExploreGrid(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildExploreGrid() {
    return GridView.builder(
      padding: const EdgeInsets.all(8),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 4,
        mainAxisSpacing: 4,
        childAspectRatio: 0.8,
      ),
      itemCount: _filteredResults.length,
      itemBuilder: (context, index) {
        final item = _filteredResults[index];
        return _buildExploreCard(item);
      },
    );
  }

  Widget _buildExploreCard(Map<String, dynamic> item) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Stack(
        children: [
          // Image/Video
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              item['imageUrl'],
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          
          // Video indicator
          if (item['type'] == 'video')
            Positioned(
              top: 8,
              right: 8,
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.7),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: const Icon(
                  Icons.play_arrow,
                  color: Colors.white,
                  size: 16,
                ),
              ),
            ),
          
          // Like count overlay
          Positioned(
            bottom: 8,
            left: 8,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.7),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(
                    Icons.favorite,
                    color: Colors.white,
                    size: 12,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    item['likes'],
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
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
            color: Colors.grey[600],
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
              color: Colors.grey[800],
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 8),
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
                          color: Colors.black87,
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
                      color: Colors.grey[600],
                      fontSize: 12,
                    ),
                  ),
                  Text(
                    '${suggestion['followers']} followers',
                    style: TextStyle(
                      color: Colors.grey[500],
                      fontSize: 11,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Text(
                'Follow',
                style: TextStyle(
                  color: Colors.white,
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
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(
                Icons.trending_up,
                color: Colors.black54,
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
                      color: Colors.black87,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    suggestion['hashtag'],
                    style: TextStyle(
                      color: Colors.blue[600],
                      fontSize: 12,
                    ),
                  ),
                  Text(
                    '${suggestion['views']} views',
                    style: TextStyle(
                      color: Colors.grey[500],
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

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.search_off,
            size: 64,
            color: Colors.grey[400],
          ),
          const SizedBox(height: 16),
          Text(
            'No results found',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.grey[600],
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Try adjusting your search terms',
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[500],
            ),
          ),
        ],
      ),
    );
  }
}
