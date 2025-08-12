import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BookmarksPage extends StatefulWidget {
  const BookmarksPage({super.key});

  @override
  State<BookmarksPage> createState() => _BookmarksPageState();
}

class _BookmarksPageState extends State<BookmarksPage> {
  String _activeTab = 'bookmarks';
  Set<String> _likedProviders = {'1', '3'};
  Set<String> _savedProviders = {'2', '4'};

  final List<Map<String, dynamic>> _bookmarkedProviders = [
    {
      'id': '1',
      'name': 'Emma Thompson',
      'avatar': 'https://images.unsplash.com/photo-1494790108755-2616b612b786?w=150&h=150&fit=crop&crop=face',
      'image': 'https://images.unsplash.com/photo-1544161512-4f8b5d0c0c0c?w=400&h=300&fit=crop',
      'location': 'Downtown Spa',
      'distance': '0.5km',
      'rating': 4.8,
      'reviews': 127,
      'price': '\$120',
      'service': 'Swedish Massage',
      'online': true,
      'orientation': 'Straight',
      'age': 28,
      'height': '5\'6"',
      'services': ['Swedish Massage', 'Deep Tissue', 'Hot Stone', 'Nuru Massage'],
      'languages': ['English', 'Spanish'],
      'availability': 'Mon-Sun 9AM-9PM',
      'incall': true,
      'outcall': true
    },
    {
      'id': '2',
      'name': 'Mia Rodriguez',
      'avatar': 'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?w=150&h=150&fit=crop&crop=face',
      'image': 'https://images.unsplash.com/photo-1544161512-4f8b5d0c0c0c?w=400&h=300&fit=crop',
      'location': 'Luxury Escorts',
      'distance': '1.2km',
      'rating': 4.9,
      'reviews': 89,
      'price': '\$300',
      'service': 'Escort Services',
      'online': false,
      'orientation': 'Bisexual',
      'age': 25,
      'height': '5\'4"',
      'services': ['Traditional Intimate', 'Oral Services', 'Video Calls', 'Roleplay'],
      'languages': ['English', 'French'],
      'availability': 'Mon-Sat 10AM-2AM',
      'incall': true,
      'outcall': true
    },
    {
      'id': '3',
      'name': 'Sophia Chen',
      'avatar': 'https://images.unsplash.com/photo-1534528741775-53994a69daeb?w=150&h=150&fit=crop&crop=face',
      'image': 'https://images.unsplash.com/photo-1544161512-4f8b5d0c0c0c?w=400&h=300&fit=crop',
      'location': 'Asian Massage',
      'distance': '2.1km',
      'rating': 4.7,
      'reviews': 203,
      'price': '\$150',
      'service': 'Thai Massage',
      'online': true,
      'orientation': 'Straight',
      'age': 26,
      'height': '5\'2"',
      'services': ['Thai Massage', 'Foot Massage', 'Aromatherapy', 'Couples Massage'],
      'languages': ['English', 'Mandarin'],
      'availability': 'Daily 8AM-10PM',
      'incall': true,
      'outcall': false
    },
    {
      'id': '4',
      'name': 'Isabella Martinez',
      'avatar': 'https://images.unsplash.com/photo-1524504388940-b1c1722653e1?w=150&h=150&fit=crop&crop=face',
      'image': 'https://images.unsplash.com/photo-1544161512-4f8b5d0c0c0c?w=400&h=300&fit=crop',
      'location': 'Elite Companions',
      'distance': '3.5km',
      'rating': 4.9,
      'reviews': 156,
      'price': '\$400',
      'service': 'Premium Escort',
      'online': true,
      'orientation': 'Bisexual',
      'age': 27,
      'height': '5\'8"',
      'services': ['Premium Intimate', 'GFE Experience', 'Travel Companion', 'Event Escort'],
      'languages': ['English', 'Spanish', 'Italian'],
      'availability': 'By Appointment',
      'incall': true,
      'outcall': true
    }
  ];

  final List<Map<String, dynamic>> _bookings = [
    {
      'id': '1',
      'providerName': 'Emma Thompson',
      'providerAvatar': 'https://images.unsplash.com/photo-1494790108755-2616b612b786?w=150&h=150&fit=crop&crop=face',
      'service': 'Swedish Massage',
      'date': '2024-01-20',
      'time': '2:00 PM',
      'duration': '60 min',
      'price': '\$120',
      'status': 'confirmed',
      'location': 'Downtown Spa'
    },
    {
      'id': '2',
      'providerName': 'Mia Rodriguez',
      'providerAvatar': 'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?w=150&h=150&fit=crop&crop=face',
      'service': 'Escort Services',
      'date': '2024-01-22',
      'time': '8:00 PM',
      'duration': '2 hours',
      'price': '\$300',
      'status': 'pending',
      'location': 'Luxury Escorts'
    }
  ];

  void _toggleLike(String providerId) {
    setState(() {
      if (_likedProviders.contains(providerId)) {
        _likedProviders.remove(providerId);
      } else {
        _likedProviders.add(providerId);
      }
    });
  }

  void _toggleSave(String providerId) {
    setState(() {
      if (_savedProviders.contains(providerId)) {
        _savedProviders.remove(providerId);
      } else {
        _savedProviders.add(providerId);
      }
    });
  }

  void _handleProfileClick(String providerId) {
    context.go('/provider/$providerId');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFf8f9fa),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => context.go('/'),
        ),
        title: const Text(
          'Bookmarks',
          style: TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),

      ),
      body: Column(
        children: [
          // Tab Bar
          Container(
            margin: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 10,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Row(
              children: [
                _buildTab('bookmarks', 'Bookmarks'),
                _buildTab('bookings', 'Bookings'),
              ],
            ),
          ),

          // Content
          Expanded(
            child: _activeTab == 'bookmarks'
                ? _buildBookmarksList()
                : _buildBookingsList(),
          ),
        ],
      ),
    );
  }

  Widget _buildTab(String tab, String label) {
    final isActive = _activeTab == tab;
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            _activeTab = tab;
          });
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 16),
          decoration: BoxDecoration(
            color: isActive ? const Color(0xFF667EEA) : Colors.transparent,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: isActive ? Colors.white : Colors.grey[600],
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBookmarksList() {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      itemCount: _bookmarkedProviders.length,
      itemBuilder: (context, index) {
        final provider = _bookmarkedProviders[index];
        return _buildProviderCard(provider);
      },
    );
  }

  Widget _buildBookingsList() {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      itemCount: _bookings.length,
      itemBuilder: (context, index) {
        final booking = _bookings[index];
        return _buildBookingCard(booking);
      },
    );
  }

  Widget _buildProviderCard(Map<String, dynamic> provider) {
    final isLiked = _likedProviders.contains(provider['id']);
    final isSaved = _savedProviders.contains(provider['id']);

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 6,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Profile Info Section
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () => _handleProfileClick(provider['id']),
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: const Color(0xFFE5E7EB), width: 2),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(24),
                      child: Image.network(
                        provider['avatar'],
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            color: const Color(0xFFE0E0E0),
                            child: const Icon(Icons.person, color: Color(0xFF666666)),
                          );
                        },
                      ),
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
                            provider['name'],
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF1A1A1A),
                            ),
                          ),
                          if (provider['verified'] == true) ...[
                            const SizedBox(width: 8),
                            const Icon(Icons.verified, color: Color(0xFF667EEA), size: 16),
                          ],
                        ],
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '${provider['location']} • ${provider['distance']}',
                        style: const TextStyle(
                          fontSize: 14,
                          color: Color(0xFF6B7280),
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.more_horiz, color: Color(0xFF666666)),
                  onPressed: () {},
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                ),
              ],
            ),
          ),

          // Main Image
          Container(
            height: 280,
            width: double.infinity,
            child: Stack(
              children: [
                Image.network(
                  provider['avatar'],
                  width: double.infinity,
                  height: 350,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      color: const Color(0xFFE0E0E0),
                      child: const Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.image_not_supported, color: Color(0xFF666666), size: 48),
                            SizedBox(height: 8),
                            Text('Image not available', style: TextStyle(color: Color(0xFF666666))),
                          ],
                        ),
                      ),
                    );
                  },
                ),
                if (provider['online'] == true)
                  Positioned(
                    top: 12,
                    right: 12,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: const Color(0xFF10B981),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Text(
                        'ONLINE',
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

          // Like and Save Icons
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () => _toggleLike(provider['id']),
                  child: Icon(
                    isLiked ? Icons.favorite : Icons.favorite_border,
                    size: 26,
                    color: isLiked ? const Color(0xFFEF4444) : const Color(0xFF6B7280),
                  ),
                ),
                const SizedBox(width: 16),
                GestureDetector(
                  onTap: () => _toggleSave(provider['id']),
                  child: Icon(
                    isSaved ? Icons.bookmark : Icons.bookmark_border,
                    size: 24,
                    color: isSaved ? const Color(0xFF667EEA) : const Color(0xFF6B7280),
                  ),
                ),
              ],
            ),
          ),

          // Provider Details
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Age and Rating
                Row(
                  children: [
                    Text(
                      'Age: ${provider['age']} years',
                      style: const TextStyle(
                        fontSize: 14,
                        color: Color(0xFF6B7280),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Row(
                      children: [
                        const Icon(Icons.star, color: Color(0xFFFBBF24), size: 12),
                        const SizedBox(width: 4),
                        Text(
                          '${provider['rating']}',
                          style: const TextStyle(
                            fontSize: 14,
                            color: Color(0xFF6B7280),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 12),

                // Sexual Orientation
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: const Color(0xFFDCFCE7),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    provider['orientation'],
                    style: const TextStyle(
                      color: Color(0xFF166534),
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const SizedBox(height: 12),

                // About
                Text(
                  provider['description'] ?? 'Professional service provider',
                  style: const TextStyle(
                    fontSize: 14,
                    color: Color(0xFF6B7280),
                    height: 1.4,
                  ),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 8),

                // Services
                const Text(
                  'Services:',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF1A1A1A),
                  ),
                ),
                const SizedBox(height: 6),
                Wrap(
                  spacing: 4,
                  runSpacing: 4,
                  children: [
                    ...provider['services'].take(3).map((service) => Container(
                      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF3F4F6),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        service,
                        style: const TextStyle(
                          color: Color(0xFF6B7280),
                          fontSize: 11,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    )),
                    if (provider['services'].length > 3)
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                        decoration: BoxDecoration(
                          color: const Color(0xFFF3F4F6),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          '+${provider['services'].length - 3} more',
                          style: TextStyle(
                            color: Color(0xFF6B7280),
                            fontSize: 11,
                          ),
                        ),
                      ),
                  ],
                ),
                const SizedBox(height: 12),

                // Languages
                Text(
                  'Languages: ${provider['languages'].join(', ')}',
                  style: const TextStyle(
                    fontSize: 14,
                    color: Color(0xFF6B7280),
                  ),
                ),
                const SizedBox(height: 12),

                // Price
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Tsh ${provider['price']}',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF667EEA),
                        ),
                      ),
                      TextSpan(
                        text: ' / ${provider['service']}',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF6B7280),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBookingCard(Map<String, dynamic> booking) {
    Color statusColor;
    String statusText;
    
    switch (booking['status']) {
      case 'confirmed':
        statusColor = Colors.green;
        statusText = 'Confirmed';
        break;
      case 'pending':
        statusColor = Colors.orange;
        statusText = 'Pending';
        break;
      default:
        statusColor = Colors.grey;
        statusText = 'Unknown';
    }

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage(booking['providerAvatar']),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        booking['providerName'],
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        booking['service'],
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: statusColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    statusText,
                    style: TextStyle(
                      color: statusColor,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Icon(Icons.calendar_today, color: Colors.grey[600], size: 16),
                const SizedBox(width: 8),
                Text(
                  '${booking['date']} at ${booking['time']}',
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 14,
                  ),
                ),
                const Spacer(),
                Text(
                  booking['duration'],
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 12,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Icon(Icons.location_on, color: Colors.grey[600], size: 16),
                const SizedBox(width: 8),
                Text(
                  booking['location'],
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 14,
                  ),
                ),
                const Spacer(),
                Text(
                  booking['price'],
                  style: const TextStyle(
                    color: Color(0xFF667EEA),
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
