import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String _activeTab = 'posts';

  final Map<String, dynamic> _mockUser = {
    'id': '1',
    'name': 'Alex Johnson',
    'username': '@alexjohnson',
    'avatar': 'https://images.unsplash.com/photo-1494790108755-2616b612b786?w=150&h=150&fit=crop&crop=face',
    'banner': 'https://images.unsplash.com/photo-1506905925346-21bda4d32df4?w=800&h=200&fit=crop',
    'bio': 'Digital nomad and adventure seeker. Love exploring new places and meeting interesting people.',
    'location': 'San Francisco, CA',
    'joined': 'March 2023',
    'website': 'alexjohnson.com',
    'following': 234,
    'followers': 1892,
    'posts': 47,
    'isVerified': true,
    'userType': 'client'
  };

  final List<Map<String, dynamic>> _mockPosts = [
    {
      'id': '1',
      'content': 'Just had an amazing massage session! The therapist was incredibly professional and skilled. Highly recommend!',
      'image': 'https://images.unsplash.com/photo-1544161512-4f8b5d0c0c0c?w=400&h=300&fit=crop',
      'likes': 23,
      'comments': 5,
      'timestamp': '2 hours ago'
    },
    {
      'id': '2',
      'content': 'Exploring the city today. Found this amazing spa with the best reviews. Can\'t wait to try it!',
      'image': 'https://images.unsplash.com/photo-1544161512-4f8b5d0c0c0c?w=400&h=300&fit=crop',
      'likes': 15,
      'comments': 3,
      'timestamp': '1 day ago'
    },
    {
      'id': '3',
      'content': 'Perfect day for relaxation. The hot stone massage was exactly what I needed!',
      'image': 'https://images.unsplash.com/photo-1544161512-4f8b5d0c0c0c?w=400&h=300&fit=crop',
      'likes': 42,
      'comments': 8,
      'timestamp': '3 days ago'
    },
    {
      'id': '4',
      'content': 'New favorite spot for wellness treatments. The atmosphere is so peaceful.',
      'image': 'https://images.unsplash.com/photo-1544161512-4f8b5d0c0c0c?w=400&h=300&fit=crop',
      'likes': 18,
      'comments': 2,
      'timestamp': '1 week ago'
    },
    {
      'id': '5',
      'content': 'Deep tissue massage was incredible. Feeling completely rejuvenated!',
      'image': 'https://images.unsplash.com/photo-1544161512-4f8b5d0c0c0c?w=400&h=300&fit=crop',
      'likes': 31,
      'comments': 6,
      'timestamp': '1 week ago'
    },
    {
      'id': '6',
      'content': 'Swedish massage session today. The therapist had amazing technique!',
      'image': 'https://images.unsplash.com/photo-1544161512-4f8b5d0c0c0c?w=400&h=300&fit=crop',
      'likes': 27,
      'comments': 4,
      'timestamp': '2 weeks ago'
    },
    {
      'id': '7',
      'content': 'Amazing spa experience today! The hot tub was perfect for relaxation.',
      'image': 'https://images.unsplash.com/photo-1566073771259-6a8506099945?w=400&h=300&fit=crop',
      'likes': 19,
      'comments': 3,
      'timestamp': '2 weeks ago'
    },
    {
      'id': '8',
      'content': 'Tried aromatherapy massage for the first time. The scents were incredible!',
      'image': 'https://images.unsplash.com/photo-1549366021-9f761d450615?w=400&h=300&fit=crop',
      'likes': 33,
      'comments': 7,
      'timestamp': '3 weeks ago'
    },
    {
      'id': '9',
      'content': 'Couples massage with my partner was the perfect date night activity.',
      'image': 'https://images.unsplash.com/photo-1549317661-bd32c8ce0db2?w=400&h=300&fit=crop',
      'likes': 28,
      'comments': 5,
      'timestamp': '3 weeks ago'
    }
  ];

  final List<Map<String, dynamic>> _mockServices = [
    {
      'id': '2',
      'title': 'Luxury Hotel Suite',
      'description': 'Premium accommodation with city views and amenities',
      'price': '\$200/night',
      'duration': '24 hours',
      'rating': 4.9,
      'reviews': 18,
      'image': 'https://images.unsplash.com/photo-1566073771259-6a8506099945?w=400&h=300&fit=crop',
      'status': 'active',
      'category': 'accommodation',
      'type': 'Hotel'
    },
    {
      'id': '3',
      'title': 'Safari Adventure Tour',
      'description': '3-day wildlife safari in Serengeti National Park',
      'price': '\$500/person',
      'duration': '3 days',
      'rating': 4.7,
      'reviews': 12,
      'image': 'https://images.unsplash.com/photo-1549366021-9f761d450615?w=400&h=300&fit=crop',
      'status': 'active',
      'category': 'adventures',
      'type': 'Safari'
    },
    {
      'id': '4',
      'title': '4x4 SUV Rental',
      'description': 'Off-road capable vehicle for adventure trips',
      'price': '\$120/day',
      'duration': '24 hours',
      'rating': 4.6,
      'reviews': 8,
      'image': 'https://images.unsplash.com/photo-1549317661-bd32c8ce0db2?w=400&h=300&fit=crop',
      'status': 'active',
      'category': 'cars',
      'type': 'SUV'
    }
  ];

  final List<Map<String, dynamic>> _mockBookings = [
    {
      'id': '1',
      'customerName': 'Sarah Johnson',
      'customerAvatar': 'https://images.unsplash.com/photo-1494790108755-2616b612b786?w=150&h=150&fit=crop&crop=face',
      'serviceTitle': 'Swedish Massage',
      'serviceImage': 'https://images.unsplash.com/photo-1544161512-4f8b5d0c0c0c?w=400&h=300&fit=crop',
      'date': '2024-01-15',
      'time': '14:00',
      'status': 'pending',
      'price': '\$80',
      'customerPhone': '+255 123 456 789',
      'customerEmail': 'sarah.johnson@email.com',
      'notes': 'Customer prefers gentle pressure',
      'requestedAt': '2024-01-10 09:30'
    },
    {
      'id': '2',
      'customerName': 'Michael Chen',
      'customerAvatar': 'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=150&h=150&fit=crop&crop=face',
      'serviceTitle': 'Luxury Hotel Suite',
      'serviceImage': 'https://images.unsplash.com/photo-1566073771259-6a8506099945?w=400&h=300&fit=crop',
      'date': '2024-01-18',
      'time': '15:00',
      'status': 'pending',
      'price': '\$200',
      'customerPhone': '+255 987 654 321',
      'customerEmail': 'michael.chen@email.com',
      'notes': 'Early check-in requested',
      'requestedAt': '2024-01-12 11:15'
    },
    {
      'id': '3',
      'customerName': 'Emma Davis',
      'customerAvatar': 'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?w=150&h=150&fit=crop&crop=face',
      'serviceTitle': 'Safari Adventure Tour',
      'serviceImage': 'https://images.unsplash.com/photo-1544161512-4f8b5d0c0c0c?w=400&h=300&fit=crop',
      'date': '2024-01-20',
      'time': '08:00',
      'status': 'pending',
      'price': '\$500',
      'customerPhone': '+255 555 123 456',
      'customerEmail': 'emma.davis@email.com',
      'notes': 'Vegetarian meal preference',
      'requestedAt': '2024-01-13 16:45'
    },
    {
      'id': '4',
      'customerName': 'David Wilson',
      'customerAvatar': 'https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?w=150&h=150&fit=crop&crop=face',
      'serviceTitle': 'Car Rental - Toyota Land Cruiser',
      'serviceImage': 'https://images.unsplash.com/photo-1544161512-4f8b5d0c0c0c?w=400&h=300&fit=crop',
      'date': '2024-01-22',
      'time': '10:00',
      'status': 'pending',
      'price': '\$150',
      'customerPhone': '+255 777 888 999',
      'customerEmail': 'david.wilson@email.com',
      'notes': 'International driving license provided',
      'requestedAt': '2024-01-14 13:20'
    },
    {
      'id': '5',
      'customerName': 'Lisa Anderson',
      'customerAvatar': 'https://images.unsplash.com/photo-1494790108755-2616b612b786?w=150&h=150&fit=crop&crop=face',
      'serviceTitle': 'Deep Tissue Massage',
      'serviceImage': 'https://images.unsplash.com/photo-1544161512-4f8b5d0c0c0c?w=400&h=300&fit=crop',
      'date': '2024-01-25',
      'time': '16:00',
      'status': 'pending',
      'price': '\$95',
      'customerPhone': '+255 111 222 333',
      'customerEmail': 'lisa.anderson@email.com',
      'notes': 'Focus on shoulder tension',
      'requestedAt': '2024-01-15 10:30'
    },
    {
      'id': '6',
      'customerName': 'Robert Taylor',
      'customerAvatar': 'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=150&h=150&fit=crop&crop=face',
      'serviceTitle': 'Hot Stone Therapy',
      'serviceImage': 'https://images.unsplash.com/photo-1566073771259-6a8506099945?w=400&h=300&fit=crop',
      'date': '2024-01-28',
      'time': '11:00',
      'status': 'pending',
      'price': '\$120',
      'customerPhone': '+255 444 555 666',
      'customerEmail': 'robert.taylor@email.com',
      'notes': 'Allergic to lavender oil',
      'requestedAt': '2024-01-16 14:15'
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFf8f9fa),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Banner
            Container(
              height: 200,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF667eea), Color(0xFF764ba2)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Stack(
                children: [
                  Image.network(
                    _mockUser['banner'],
                    width: double.infinity,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                  // Back Button
                  Positioned(
                    top: 40,
                    left: 16,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.9),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: IconButton(
                        icon: const Icon(Icons.arrow_back, color: Color(0xFF1a1a1a)),
                        onPressed: () => context.go('/'),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Profile Info
            Transform.translate(
              offset: const Offset(0, -30),
              child: Container(
                margin: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 12,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                      // Profile Picture
                      Transform.translate(
                        offset: const Offset(0, -40),
                        child: Container(
                          width: 120,
                          height: 120,
                          margin: const EdgeInsets.only(bottom: 16),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(60),
                            border: Border.all(color: Colors.white, width: 4),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.15),
                                blurRadius: 12,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(56),
                            child: Image.network(
                              _mockUser['avatar'],
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),

                      // Name and Verification
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Flexible(
                            child: Text(
                              _mockUser['name'],
                              style: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w700,
                                color: Color(0xFF1a1a1a),
                              ),
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          if (_mockUser['isVerified'] == true) ...[
                            const SizedBox(width: 8),
                            const Icon(
                              Icons.verified,
                              color: Color(0xFF1da1f2),
                              size: 20,
                            ),
                          ],
                        ],
                      ),
                      const SizedBox(height: 4),
                      Text(
                        _mockUser['username'],
                        style: const TextStyle(
                          fontSize: 16,
                          color: Color(0xFF6b7280),
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 16),

                      // Bio
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Text(
                          _mockUser['bio'],
                          style: const TextStyle(
                            fontSize: 16,
                            color: Color(0xFF374151),
                            height: 1.5,
                          ),
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.visible,
                        ),
                      ),
                      const SizedBox(height: 16),

                      // Location and Joined
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(Icons.location_on, color: Color(0xFF6b7280), size: 16),
                            const SizedBox(width: 6),
                            Flexible(
                              child: Text(
                                _mockUser['location'],
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Color(0xFF6b7280),
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            const SizedBox(width: 16),
                            const Icon(Icons.calendar_today, color: Color(0xFF6b7280), size: 16),
                            const SizedBox(width: 6),
                            Flexible(
                              child: Text(
                                'Joined ${_mockUser['joined']}',
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Color(0xFF6b7280),
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),

                      // Stats
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        decoration: BoxDecoration(
                          border: Border(
                            top: BorderSide(color: const Color(0xFFe5e7eb)),
                            bottom: BorderSide(color: const Color(0xFFe5e7eb)),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Flexible(child: _buildStatColumn('Following', _mockUser['following'].toString())),
                            Flexible(child: _buildStatColumn('Followers', _mockUser['followers'].toString())),
                            Flexible(child: _buildStatColumn('Posts', _mockUser['posts'].toString())),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),

                      // Action Buttons
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Row(
                          children: [
                            Expanded(
                              child: ElevatedButton(
                                onPressed: () => context.go('/edit-profile'),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFF667EEA),
                                  foregroundColor: Colors.white,
                                  padding: const EdgeInsets.symmetric(vertical: 12),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                                child: const Text(
                                  'Edit Profile',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: OutlinedButton(
                                onPressed: () => context.go('/professional'),
                                style: OutlinedButton.styleFrom(
                                  foregroundColor: const Color(0xFF667EEA),
                                  side: const BorderSide(color: Color(0xFF667EEA), width: 2),
                                  padding: const EdgeInsets.symmetric(vertical: 12),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                                child: const Text(
                                  'Professional',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

            // Tabs
            Column(
              children: [
                // Tab Headers
                Row(
                  children: [
                    _buildTab('posts', 'Posts'),
                    _buildTab('services', 'Services'),
                    _buildTab('bookmarks', 'Bookings'),
                  ],
                ),

                // Tab Content
                _buildTabContent(),
              ],
            ),
          ],
        ),
    )
    );
    }

  Widget _buildStatColumn(String label, String value) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: Color(0xFF1a1a1a),
          ),
        ),
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            color: Color(0xFF6b7280),
          ),
        ),
      ],
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
            color: isActive ? const Color(0xFFf3f4f6) : Colors.white,
            border: Border(
              bottom: BorderSide(
                color: const Color(0xFFe5e7eb),
                width: 1,
              ),
            ),
          ),
          child: Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: isActive ? const Color(0xFF1a1a1a) : const Color(0xFF6b7280),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTabContent() {
    switch (_activeTab) {
      case 'posts':
        return _buildPostsGrid();
      case 'services':
        return _buildServicesList();
      case 'bookings':
        return _buildBookingsList();
      default:
        return const SizedBox.shrink();
    }
  }

  Widget _buildPostsGrid() {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 2,
        mainAxisSpacing: 2,
      ),
      itemCount: _mockPosts.length,
      itemBuilder: (context, index) {
        final post = _mockPosts[index];
        return AspectRatio(
          aspectRatio: 1,
          child: Image.network(
            post['image'],
            fit: BoxFit.cover,
          ),
        );
      },
    );
  }

  Widget _buildServicesList() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          // Services List
          ..._mockServices.map((service) => _buildServiceCard(service)),
        ],
      ),
    );
  }

  Widget _buildServiceCard(Map<String, dynamic> service) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16, left: 16, right: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFFe5e7eb)),
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
      ),
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width - 32, // Account for left/right margins
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    service['image'],
                    width: 80,
                    height: 80,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 16),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        service['title'].length > 15 
                            ? '${service['title'].substring(0, 15)}...' 
                            : service['title'],
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        service['description'].length > 30 
                            ? '${service['description'].substring(0, 30)}...' 
                            : service['description'],
                        style: const TextStyle(
                          color: Color(0xFF6b7280),
                          fontSize: 14,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Flexible(
                            child: Text(
                              service['price'],
                              style: const TextStyle(
                                color: Color(0xFF667EEA),
                                fontWeight: FontWeight.w600,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          const SizedBox(width: 16),
                          Flexible(
                            child: Text(
                              service['duration'],
                              style: const TextStyle(
                                color: Color(0xFF6b7280),
                                fontSize: 12,
                              ),
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
            const SizedBox(height: 12),
            Row(
              children: [
                const Icon(Icons.star, color: Color(0xFFd97706), size: 16),
                const SizedBox(width: 4),
                Text(
                  '${service['rating']}',
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
                const SizedBox(width: 4),
                Flexible(
                  child: Text(
                    '(${service['reviews']} reviews)',
                    style: const TextStyle(
                      color: Color(0xFF6b7280),
                      fontSize: 12,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ),
                const Spacer(),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: service['status'] == 'active' ? const Color(0xFFdcfce7) : const Color(0xFFf3f4f6),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    service['status'],
                    style: TextStyle(
                      color: service['status'] == 'active' ? const Color(0xFF166534) : const Color(0xFF6b7280),
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBookingsList() {
    return Column(
      children: _mockBookings.map((booking) => _buildBookingCard(booking)).toList(),
    );
  }

  Widget _buildBookingCard(Map<String, dynamic> booking) {
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          border: Border.all(color: const Color(0xFFe5e7eb)),
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                booking['serviceImage'],
                width: 80,
                height: 80,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width - 200, // Constrain width
                    child: Text(
                      booking['serviceTitle'].length > 15 
                          ? '${booking['serviceTitle'].substring(0, 15)}...' 
                          : booking['serviceTitle'],
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(height: 4),
                  SizedBox(
                    width: MediaQuery.of(context).size.width - 200, // Constrain width
                    child: Text(
                      'Client: ${booking['customerName'].length > 10 
                          ? '${booking['customerName'].substring(0, 10)}...' 
                          : booking['customerName']}',
                      style: const TextStyle(
                        color: Color(0xFF6b7280),
                        fontSize: 14,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(height: 4),
                  SizedBox(
                    width: MediaQuery.of(context).size.width - 200, // Constrain width
                    child: Text(
                      '${booking['date'].length > 8 
                          ? '${booking['date'].substring(0, 8)}...' 
                          : booking['date']} at ${booking['time']}',
                      style: const TextStyle(
                        color: Color(0xFF6b7280),
                        fontSize: 14,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(height: 4),
                  SizedBox(
                    width: MediaQuery.of(context).size.width - 200, // Constrain width
                    child: Text(
                      'Requested: ${booking['requestedAt']}',
                      style: const TextStyle(
                        color: Color(0xFF9ca3af),
                        fontSize: 12,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Flexible(
                        child: Text(
                          booking['price'],
                          style: const TextStyle(
                            color: Color(0xFF667EEA),
                            fontWeight: FontWeight.w600,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const Spacer(),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: Colors.orange.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Text(
                          'Pending',
                          style: TextStyle(
                            color: Colors.orange,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
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
      ),
    );
  }
}

