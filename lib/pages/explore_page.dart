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

            // Category Tabs
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
