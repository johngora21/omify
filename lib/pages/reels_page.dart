import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
      'verified': true
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
      'verified': false
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
      'verified': true
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
      'verified': false
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

  String _formatNumber(int num) {
    if (num >= 1000000) {
      return '${(num / 1000000).toStringAsFixed(1)}M';
    } else if (num >= 1000) {
      return '${(num / 1000).toStringAsFixed(1)}K';
    }
    return num.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: PageView.builder(
        controller: _pageController,
        scrollDirection: Axis.vertical,
        onPageChanged: _onPageChanged,
        itemCount: _reels.length,
        itemBuilder: (context, index) {
          final reel = _reels[index];
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
            padding: const EdgeInsets.only(bottom: 100),
            child: Column(
              children: [
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
                        Icons.chat_bubble_outline,
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
            padding: const EdgeInsets.only(bottom: 100),
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
                  reel['duration'],
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.white70,
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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'For You',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed('/create');
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Text(
                    'Upload',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),

        // Video Navigation Dots
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            padding: const EdgeInsets.only(bottom: 80),
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
