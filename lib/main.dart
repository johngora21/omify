import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:line_icons/line_icons.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ionicons/ionicons.dart';


void main() {
  runApp(const OmifyApp());
}

class OmifyApp extends StatelessWidget {
  const OmifyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Set system UI overlay style to white
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: Colors.white,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
    );
    
    return Container(
      color: Colors.white,
      child: MaterialApp(
        title: 'Omify',
        theme: ThemeData(
        useMaterial3: false,
        primarySwatch: Colors.blue,
        primaryColor: const Color(0xFF0095F6),
        scaffoldBackgroundColor: Colors.white,
        fontFamily: '-apple-system, BlinkMacSystemFont, "Segoe UI", "Roboto", "Helvetica", "Arial", sans-serif',
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: Color(0xFF262626),
          elevation: 0,
          centerTitle: true,
          surfaceTintColor: Colors.white,
          scrolledUnderElevation: 0,
        ),
      ),
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
      ),
    );
  }
}

class MessageBubblePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFF262626)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.8;

    // Position icon to match other icons exactly
    final centerX = size.width / 2;
    final iconY = size.height * 0.65; // Position lower to match other icons
    final bubbleWidth = size.width * 0.8;
    final bubbleHeight = size.height * 0.65;
    
    // Draw the main bubble (rounded rectangle with tail)
    final bubblePath = Path();
    
    // Main rounded rectangle positioned like other icons
    final rect = RRect.fromRectAndRadius(
      Rect.fromCenter(
        center: Offset(centerX, iconY),
        width: bubbleWidth,
        height: bubbleHeight,
      ),
      const Radius.circular(8),
    );
    bubblePath.addRRect(rect);
    
    // Add the tail (small triangle pointing down-left)
    final tailStartX = centerX - bubbleWidth * 0.15;
    final tailEndX = centerX - bubbleWidth * 0.25;
    final tailY = iconY + bubbleHeight * 0.4;
    
    bubblePath.moveTo(tailStartX, tailY);
    bubblePath.lineTo(tailEndX, tailY + bubbleHeight * 0.2);
    bubblePath.lineTo(tailStartX + bubbleWidth * 0.1, tailY);
    bubblePath.close();
    
    canvas.drawPath(bubblePath, paint);
    
    // Draw three dots inside, positioned like other icons
    final dotPaint = Paint()
      ..color = const Color(0xFF262626)
      ..style = PaintingStyle.fill;
    
    final dotRadius = 1.5;
    final dotSpacing = bubbleWidth * 0.2;
    final startDotX = centerX - dotSpacing;
    
    canvas.drawCircle(Offset(startDotX, iconY), dotRadius, dotPaint);
    canvas.drawCircle(Offset(centerX, iconY), dotRadius, dotPaint);
    canvas.drawCircle(Offset(startDotX + dotSpacing * 2, iconY), dotRadius, dotPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Set<String> likedPosts = <String>{};
  final Set<String> savedPosts = <String>{};
  final ScrollController _scrollController = ScrollController();
  bool _isTopBarVisible = true;

  final List<Map<String, dynamic>> stories = [
    {
      'id': '1',
      'username': 'sophia_escorts',
                  'avatar': 'https://images.unsplash.com/photo-1494790108755-2616b612b786?w=150&h=150&fit=crop&crop=face&auto=format',
      'hasStory': true,
    },
    {
      'id': '2',
      'username': 'emma_massage',
                  'avatar': 'https://images.unsplash.com/photo-1517841905240-472988babdf9?w=150&h=150&fit=crop&crop=face&auto=format',
      'hasStory': true,
    },
    {
      'id': '3',
      'username': 'luna_premium',
                  'avatar': 'https://images.unsplash.com/photo-1539571696357-5a69c17a67c6?w=150&h=150&fit=crop&crop=face&auto=format',
      'hasStory': true,
    },
    {
      'id': '4',
      'username': 'ava_luxury',
                  'avatar': 'https://images.unsplash.com/photo-1487412720507-e7ab37603c6f?w=150&h=150&fit=crop&crop=face&auto=format',
      'hasStory': true,
    },
    {
      'id': '5',
      'username': 'mia_therapy',
                  'avatar': 'https://images.unsplash.com/photo-1524504388940-b1c1722653e1?w=150&h=150&fit=crop&crop=face&auto=format',
      'hasStory': true,
    },
  ];

  final List<Map<String, dynamic>> posts = [
    {
      'id': '1',
      'username': 'sophia_grace',
                  'avatar': 'https://images.unsplash.com/photo-1494790108755-2616b612b786?w=100&h=100&fit=crop&crop=face&auto=format',
      'location': 'Downtown, City',
                  'image': 'https://images.unsplash.com/photo-1519735997400-2f7bbcd69b1a?w=600&h=800&fit=crop&auto=format',
      'caption': '✨ Looking for meaningful connections and genuine conversations. Love art, travel, and deep talks over coffee. Let\'s explore life together! #Connection #Romance #Meaningful',
      'likes': 234,
      'timeAgo': '2h',
      'isVideo': false,
      'category': 'Romance'
    },
    {
      'id': '2',
      'username': 'emma_wellness',
                  'avatar': 'https://images.unsplash.com/photo-1517841905240-472988babdf9?w=100&h=100&fit=crop&crop=face&auto=format',
      'location': 'Uptown Wellness',
                  'image': 'https://images.unsplash.com/photo-1544161515-4ab6ce6db874?w=600&h=800&fit=crop&auto=format',
      'caption': '🌸 Certified wellness coach and meditation guide. Helping people find inner peace and balance. Let\'s journey together towards mindfulness and self-discovery! #Wellness #Mindfulness #Growth',
      'likes': 156,
      'timeAgo': '4h',
      'isVideo': false,
      'category': 'Wellness'
    },
    {
      'id': '3',
      'username': 'luna_connection',
                  'avatar': 'https://images.unsplash.com/photo-1539571696357-5a69c17a67c6?w=100&h=100&fit=crop&crop=face&auto=format',
      'location': 'Cultural District',
                  'image': 'https://images.unsplash.com/photo-1571019613454-1cb2f99b2d8b?w=600&h=800&fit=crop&auto=format',
      'caption': '💫 Passionate about cultural exchange and intellectual conversations. Love exploring museums, trying new cuisines, and sharing life experiences. #Culture #Intellectual #Connection',
      'likes': 298,
      'timeAgo': '6h',
      'isVideo': true,
      'category': 'Cultural'
    },
  ];

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels > _scrollController.position.minScrollExtent) {
      // Scrolling down
      if (_isTopBarVisible) {
        setState(() {
          _isTopBarVisible = false;
        });
      }
    } else {
      // Scrolling up or at top
      if (!_isTopBarVisible) {
        setState(() {
          _isTopBarVisible = true;
        });
      }
    }
  }

  void toggleLike(String postId) {
    setState(() {
      if (likedPosts.contains(postId)) {
        likedPosts.remove(postId);
      } else {
        likedPosts.add(postId);
      }
    });
  }

  void toggleSave(String postId) {
    setState(() {
      if (savedPosts.contains(postId)) {
        savedPosts.remove(postId);
      } else {
        savedPosts.add(postId);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight + 20),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          height: _isTopBarVisible ? kToolbarHeight + 20 : 0,
          child: AnimatedOpacity(
            duration: const Duration(milliseconds: 300),
            opacity: _isTopBarVisible ? 1.0 : 0.0,
            child: Container(
              color: Colors.white,
              child: SafeArea(
                child: Container(
                  height: kToolbarHeight + 20,
                  padding: const EdgeInsets.fromLTRB(16, 20, 16, 0),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          width: 32,
                          height: 32,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(color: const Color(0xFFE0E0E0), width: 1),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: Image.network(
                              'https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?w=150&h=150&fit=crop&crop=face&auto=format',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Center(
                          child: ShaderMask(
                            shaderCallback: (bounds) => const LinearGradient(
                              colors: [Color(0xFF667EEA), Color(0xFF764BA2)],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ).createShader(bounds),
                            child: const Text(
                              'Omify',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontFamily: 'cursive',
                              ),
                            ),
                          ),
                        ),
                      ),
                      IconButton(
                        icon: const FaIcon(
                          FontAwesomeIcons.search,
                          color: Color(0xFF262626),
                          size: 24,
                        ),
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: const Icon(Icons.favorite_outline, color: Color(0xFF262626), size: 26),
                        onPressed: () {},
                      ),
                                                                          IconButton(
                               icon: const FaIcon(
                                 FontAwesomeIcons.facebookMessenger,
                                 color: Color(0xFF262626),
                                 size: 24,
                               ),
                               onPressed: () {},
                             ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          controller: _scrollController,
          child: Column(
            children: [
              // Featured Stories Section
              Container(
                margin: const EdgeInsets.all(16),
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.08),
                      blurRadius: 12,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 90,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: stories.length + 1, // +1 for Add Story
                        itemBuilder: (context, index) {
                          if (index == 0) {
                            // Add Story item
                            return Container(
                              margin: const EdgeInsets.only(right: 16),
                              child: Column(
                                children: [
                                  Container(
                                    width: 70,
                                    height: 70,
                                    decoration: BoxDecoration(
                                      gradient: const LinearGradient(
                                        colors: [Color(0xFF667EEA), Color(0xFF764BA2)],
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight,
                                      ),
                                      borderRadius: BorderRadius.circular(35),
                                      boxShadow: [
                                        BoxShadow(
                                          color: const Color(0xFF667EEA).withOpacity(0.3),
                                          blurRadius: 12,
                                          offset: const Offset(0, 4),
                                        ),
                                      ],
                                    ),
                                    child: const Icon(
                                      Icons.add,
                                      color: Colors.white,
                                      size: 30,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  const SizedBox(
                                    width: 80,
                                    child: Text(
                                      'Add Story',
                                      style: TextStyle(
                                        fontSize: 9,
                                        color: Color(0xFF666666),
                                      ),
                                      textAlign: TextAlign.center,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          } else {
                            // Regular story items
                            final story = stories[index - 1];
                            return Container(
                              margin: const EdgeInsets.only(right: 16),
                              child: Column(
                                children: [
                                  Container(
                                    width: 70,
                                    height: 70,
                                    decoration: BoxDecoration(
                                      gradient: const LinearGradient(
                                        colors: [Color(0xFF667EEA), Color(0xFF764BA2)],
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight,
                                      ),
                                      borderRadius: BorderRadius.circular(35),
                                      boxShadow: [
                                        BoxShadow(
                                          color: const Color(0xFF667EEA).withOpacity(0.3),
                                          blurRadius: 12,
                                          offset: const Offset(0, 4),
                                        ),
                                      ],
                                    ),
                                    padding: const EdgeInsets.all(3),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(32),
                                      child: Image.network(
                                        story['avatar'],
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  SizedBox(
                                    width: 80,
                                    child: Text(
                                      story['username'],
                                      style: const TextStyle(
                                        fontSize: 9,
                                        color: Color(0xFF666666),
                                      ),
                                      textAlign: TextAlign.center,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),

              // Posts Feed
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: posts.map((post) => _buildPostCard(post)).toList(),
                ),
              ),
              
              // Bottom padding to prevent overflow
              const SizedBox(height: 100),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 70,
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Color(0x1A000000),
              blurRadius: 4,
              offset: Offset(0, -2),
            ),
          ],
        ),
        child: Row(
          children: [
            // Left side navigation items
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    icon: const Icon(Icons.home, size: 26, color: Color(0xFF0095F6)),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: const Icon(Icons.spa, size: 26, color: Color(0xFF8E8E8E)),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            
            // Center Add Post Button
            Container(
              width: 80,
              child: Center(
                child: Container(
                  width: 56,
                  height: 56,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0xFF667EEA), Color(0xFF764BA2)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(28),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFF667EEA).withOpacity(0.4),
                        blurRadius: 12,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: const Icon(
                    Icons.add,
                    size: 28,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            
            // Right side navigation items
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    icon: const Icon(Icons.video_library_outlined, size: 26, color: Color(0xFF8E8E8E)),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: const Icon(Icons.radio_outlined, size: 26, color: Color(0xFF8E8E8E)),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPostCard(Map<String, dynamic> post) {
    final isLiked = likedPosts.contains(post['id']);
    final isSaved = savedPosts.contains(post['id']);
    
    return Container(
      margin: const EdgeInsets.only(bottom: 24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.12),
            blurRadius: 32,
            offset: const Offset(0, 8),
          ),
        ],
        border: Border.all(color: Colors.white.withOpacity(0.2)),
      ),
      child: Column(
        children: [
          // Post Header
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(24),
                  child: Image.network(
                    post['avatar'],
                    width: 48,
                    height: 48,
                    fit: BoxFit.cover,
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;
                      return Container(
                        width: 48,
                        height: 48,
                        decoration: BoxDecoration(
                          color: const Color(0xFFE0E0E0),
                          borderRadius: BorderRadius.circular(24),
                        ),
                        child: const Center(
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF667EEA)),
                          ),
                        ),
                      );
                    },
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        width: 48,
                        height: 48,
                        decoration: BoxDecoration(
                          color: const Color(0xFFE0E0E0),
                          borderRadius: BorderRadius.circular(24),
                        ),
                        child: const Icon(
                          Icons.person,
                          color: Color(0xFF666666),
                          size: 24,
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        post['username'],
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF1A1A1A),
                        ),
                      ),
                      Text(
                        post['location'],
                        style: const TextStyle(
                          fontSize: 13,
                          color: Color(0xFF888888),
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.more_horiz, color: Color(0xFF666666)),
                  onPressed: () {},
                ),
              ],
            ),
          ),

          // Post Image
          Stack(
            children: [
              Image.network(
                post['image'],
                width: double.infinity,
                height: 350,
                fit: BoxFit.cover,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Container(
                    width: double.infinity,
                    height: 350,
                    decoration: BoxDecoration(
                      color: const Color(0xFFE0E0E0),
                    ),
                    child: const Center(
                      child: CircularProgressIndicator(
                        strokeWidth: 3,
                        valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF667EEA)),
                      ),
                    ),
                  );
                },
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    width: double.infinity,
                    height: 350,
                    decoration: BoxDecoration(
                      color: const Color(0xFFE0E0E0),
                    ),
                    child: const Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.image_not_supported,
                            color: Color(0xFF666666),
                            size: 48,
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Image not available',
                            style: TextStyle(
                              color: Color(0xFF666666),
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
              if (post['isVideo'])
                Positioned(
                  top: 16,
                  right: 16,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.7),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Text(
                      '▶ VIDEO',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
            ],
          ),

          // Post Actions
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 2),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    IconButton(
                      icon: Icon(
                        isLiked ? Icons.favorite : Icons.favorite_border,
                        color: isLiked ? const Color(0xFFFF4757) : const Color(0xFF666666),
                        size: 28,
                      ),
                      onPressed: () => toggleLike(post['id']),
                    ),
                    const SizedBox(width: 20),
                                                   const Icon(
                                 Ionicons.chatbubble,
                                 color: Color(0xFF666666),
                                 size: 26,
                               ),
                  ],
                ),
                IconButton(
                  icon: Icon(
                    isSaved ? Icons.bookmark : Icons.bookmark_border,
                    color: isSaved ? const Color(0xFFFFA502) : const Color(0xFF666666),
                    size: 28,
                  ),
                  onPressed: () => toggleSave(post['id']),
                ),
              ],
            ),
          ),

          // Post Info
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${post['likes'] + (isLiked ? 1 : 0)} connections',
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF1A1A1A),
                  ),
                ),
                const SizedBox(height: 12),
                RichText(
                  text: TextSpan(
                    style: const TextStyle(
                      fontSize: 15,
                      color: Color(0xFF333333),
                      height: 1.5,
                    ),
                    children: [
                      TextSpan(
                        text: '${post['username']} ',
                        style: const TextStyle(fontWeight: FontWeight.w600),
                      ),
                      TextSpan(text: post['caption']),
                    ],
                  ),
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Text(
                      '${post['timeAgo']} ago',
                      style: const TextStyle(
                        fontSize: 13,
                        color: Color(0xFF999999),
                      ),
                    ),
                    const Text(' • '),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        post['category'],
                        style: const TextStyle(
                          fontSize: 11,
                          color: Color(0xFF666666),
                        ),
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
}

class ChatBubblePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFF262626)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.5;

    final fillPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    // Draw the main chat bubble (rounded rectangle)
    final bubbleRect = RRect.fromRectAndRadius(
      Rect.fromLTWH(2, 2, size.width - 4, size.height - 6),
      const Radius.circular(8),
    );

    // Fill with white
    canvas.drawRRect(bubbleRect, fillPaint);
    // Draw border
    canvas.drawRRect(bubbleRect, paint);

    // Draw the tail (small triangle at bottom)
    final path = Path();
    path.moveTo(size.width * 0.3, size.height - 6);
    path.lineTo(size.width * 0.4, size.height - 2);
    path.lineTo(size.width * 0.5, size.height - 6);
    path.close();

    // Fill tail with white
    canvas.drawPath(path, fillPaint);
    // Draw tail border
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}


