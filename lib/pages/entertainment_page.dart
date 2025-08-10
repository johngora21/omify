import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ionicons/ionicons.dart';

class EntertainmentPage extends StatefulWidget {
  const EntertainmentPage({super.key});

  @override
  State<EntertainmentPage> createState() => _EntertainmentPageState();
}

class _EntertainmentPageState extends State<EntertainmentPage> {
  String _selectedCategory = 'all';

  final List<Map<String, dynamic>> _categories = [
    {'id': 'all', 'name': 'All', 'icon': Icons.all_inclusive},
    {'id': 'games', 'name': 'Games', 'icon': Icons.games},
    {'id': 'videos', 'name': 'Videos', 'icon': Icons.video_library},
    {'id': 'music', 'name': 'Music', 'icon': Icons.music_note},
    {'id': 'comedy', 'name': 'Comedy', 'icon': Icons.sentiment_satisfied},
    {'id': 'sports', 'name': 'Sports', 'icon': Icons.sports_soccer},
  ];

  final List<Map<String, dynamic>> _entertainmentItems = [
    {
      'id': '1',
      'title': 'Puzzle Challenge',
      'category': 'games',
      'description': 'Test your brain with this addictive puzzle game',
      'image': 'https://images.unsplash.com/photo-1558618666-fcd25c85cd64?w=400&h=300&fit=crop',
      'rating': 4.8,
      'players': '1-4',
      'type': 'game',
    },
    {
      'id': '2',
      'title': 'Funny Moments Compilation',
      'category': 'comedy',
      'description': 'Laugh out loud with these hilarious clips',
      'image': 'https://images.unsplash.com/photo-1518709268805-4e9042af2176?w=400&h=300&fit=crop',
      'rating': 4.5,
      'duration': '15 min',
      'type': 'video',
    },
    {
      'id': '3',
      'title': 'Chill Vibes Playlist',
      'category': 'music',
      'description': 'Relaxing music to help you unwind',
      'image': 'https://images.unsplash.com/photo-1493225457124-a3eb161ffa5f?w=400&h=300&fit=crop',
      'rating': 4.7,
      'duration': '2 hours',
      'type': 'playlist',
    },
    {
      'id': '4',
      'title': 'Mini Football',
      'category': 'sports',
      'description': 'Quick football matches for small groups',
      'image': 'https://images.unsplash.com/photo-1571019613454-1cb2f99b2d8b?w=400&h=300&fit=crop',
      'rating': 4.6,
      'players': '2-8',
      'type': 'game',
    },
    {
      'id': '5',
      'title': 'Cooking Show',
      'category': 'videos',
      'description': 'Learn to cook delicious meals',
      'image': 'https://images.unsplash.com/photo-1556909114-f6e7ad7d3136?w=400&h=300&fit=crop',
      'rating': 4.9,
      'duration': '30 min',
      'type': 'video',
    },
    {
      'id': '6',
      'title': 'Trivia Night',
      'category': 'games',
      'description': 'Test your knowledge with friends',
      'image': 'https://images.unsplash.com/photo-1518709268805-4e9042af2176?w=400&h=300&fit=crop',
      'rating': 4.4,
      'players': '2-10',
      'type': 'game',
    },
  ];

  List<Map<String, dynamic>> get _filteredItems {
    if (_selectedCategory == 'all') {
      return _entertainmentItems;
    }
    return _entertainmentItems.where((item) => item['category'] == _selectedCategory).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          // Header
          SliverAppBar(
            expandedHeight: 120,
            floating: false,
            pinned: true,
            backgroundColor: Colors.white,
            elevation: 0,
            flexibleSpace: FlexibleSpaceBar(
              title: const Text(
                'Entertainment',
                style: TextStyle(
                  color: Color(0xFF1A1A1A),
                  fontWeight: FontWeight.w600,
                ),
              ),
              background: Container(
                color: Colors.white,
                child: const Center(
                  child: Text(
                    'Discover fun content',
                    style: TextStyle(
                      color: Color(0xFF6B7280),
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
          ),

          // Categories
          SliverToBoxAdapter(
            child: Container(
              height: 100,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: _categories.length,
                itemBuilder: (context, index) {
                  final category = _categories[index];
                  final isSelected = _selectedCategory == category['id'];
                  
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedCategory = category['id'];
                      });
                    },
                    child: Container(
                      width: 80,
                      margin: const EdgeInsets.only(right: 12),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              color: isSelected ? const Color(0xFF3B82F6) : const Color(0xFFF3F4F6),
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: Icon(
                              category['icon'],
                              color: isSelected ? Colors.white : const Color(0xFF6B7280),
                              size: 24,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            category['name'],
                            style: TextStyle(
                              color: isSelected ? const Color(0xFF3B82F6) : const Color(0xFF6B7280),
                              fontSize: 12,
                              fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),

          // Content Grid
          SliverPadding(
            padding: const EdgeInsets.all(16),
            sliver: SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 0.8,
              ),
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final item = _filteredItems[index];
                  return _buildEntertainmentCard(item);
                },
                childCount: _filteredItems.length,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEntertainmentCard(Map<String, dynamic> item) {
    return GestureDetector(
      onTap: () {
        // Handle item tap
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Opening ${item['title']}...'),
            backgroundColor: const Color(0xFF3B82F6),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image
            Expanded(
              flex: 3,
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                  image: DecorationImage(
                    image: NetworkImage(item['image']),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Stack(
                  children: [
                    // Rating badge
                    Positioned(
                      top: 8,
                      right: 8,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.7),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(
                              Icons.star,
                              color: Color(0xFFFBBF24),
                              size: 12,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              item['rating'].toString(),
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    
                    // Type indicator
                    Positioned(
                      bottom: 8,
                      left: 8,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: _getTypeColor(item['type']),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          item['type'].toString().toUpperCase(),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Content
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item['title'],
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF1A1A1A),
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      item['description'],
                      style: const TextStyle(
                        fontSize: 12,
                        color: Color(0xFF6B7280),
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        Icon(
                          _getTypeIcon(item['type']),
                          size: 14,
                          color: const Color(0xFF6B7280),
                        ),
                        const SizedBox(width: 4),
                        Text(
                          item['players'] ?? item['duration'] ?? '',
                          style: const TextStyle(
                            fontSize: 12,
                            color: Color(0xFF6B7280),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Color _getTypeColor(String type) {
    switch (type) {
      case 'game':
        return const Color(0xFF3B82F6);
      case 'video':
        return const Color(0xFFEF4444);
      case 'playlist':
        return const Color(0xFF8B5CF6);
      default:
        return const Color(0xFF6B7280);
    }
  }

  IconData _getTypeIcon(String type) {
    switch (type) {
      case 'game':
        return Icons.people;
      case 'video':
        return Icons.play_circle_outline;
      case 'playlist':
        return Icons.music_note;
      default:
        return Icons.info;
    }
  }
}
