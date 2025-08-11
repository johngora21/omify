import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({super.key});

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  String _activeTab = 'notifications';
  String _searchQuery = '';

  final List<Map<String, dynamic>> _notifications = [
    {
      'id': '1',
      'type': 'like',
      'user': {
        'name': 'Emma Thompson',
        'avatar': 'https://images.unsplash.com/photo-1494790108755-2616b612b786?w=150&h=150&fit=crop&crop=face',
      },
      'action': 'liked your post',
      'time': '2m ago',
      'postImage': 'https://images.unsplash.com/photo-1506905925346-21bda4d32df4?w=150&h=150&fit=crop',
      'isRead': false,
    },
    {
      'id': '2',
      'type': 'comment',
      'user': {
        'name': 'Mia Rodriguez',
        'avatar': 'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?w=150&h=150&fit=crop&crop=face',
      },
      'action': 'commented on your post',
      'time': '5m ago',
      'postImage': 'https://images.unsplash.com/photo-1441974231531-c6227db76b6e?w=150&h=150&fit=crop',
      'isRead': false,
      'comment': 'Amazing shot! 🔥',
    },
    {
      'id': '3',
      'type': 'follow',
      'user': {
        'name': 'Sophia Chen',
        'avatar': 'https://images.unsplash.com/photo-1544005313-94ddf0286df2?w=150&h=150&fit=crop&crop=face',
      },
      'action': 'started following you',
      'time': '1h ago',
      'isRead': true,
    },
    {
      'id': '4',
      'type': 'message',
      'user': {
        'name': 'Isabella Johnson',
        'avatar': 'https://images.unsplash.com/photo-1487412720507-e7ab37603c6f?w=150&h=150&fit=crop&crop=face',
      },
      'action': 'sent you a message',
      'time': '2h ago',
      'isRead': true,
    },
    {
      'id': '5',
      'type': 'like',
      'user': {
        'name': 'Ava Williams',
        'avatar': 'https://images.unsplash.com/photo-1534528741775-53994a69daeb?w=150&h=150&fit=crop&crop=face',
      },
      'action': 'liked your story',
      'time': '3h ago',
      'isRead': true,
    },
    {
      'id': '6',
      'type': 'follow',
      'user': {
        'name': 'Charlotte Brown',
        'avatar': 'https://images.unsplash.com/photo-1492446845049-9c50cc313f00?w=150&h=150&fit=crop&crop=face',
      },
      'action': 'started following you',
      'time': '5h ago',
      'isRead': true,
    },
  ];

  List<Map<String, dynamic>> get _filteredNotifications {
    if (_activeTab == 'all') {
      return _notifications;
    } else if (_activeTab == 'likes') {
      return _notifications.where((n) => n['type'] == 'like').toList();
    } else if (_activeTab == 'comments') {
      return _notifications.where((n) => n['type'] == 'comment').toList();
    } else if (_activeTab == 'follows') {
      return _notifications.where((n) => n['type'] == 'follow').toList();
    } else if (_activeTab == 'messages') {
      return _notifications.where((n) => n['type'] == 'message').toList();
    }
    return _notifications;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAFAFA),
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              child: Stack(
                children: [
                  // Back Arrow
                  Positioned(
                    left: 0,
                    top: 0,
                    bottom: 0,
                    child: Center(
                      child: GestureDetector(
                        onTap: () => context.go('/'),
                        child: Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Icon(Icons.arrow_back, size: 20, color: Color(0xFF1A1A1A)),
                        ),
                      ),
                    ),
                  ),
                  
                  // Title
                  const Center(
                    child: Text('Notifications', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: Color(0xFF1A1A1A))),
                  ),
                  
                  // Menu Button
                  Positioned(
                    right: 0,
                    top: 0,
                    bottom: 0,
                    child: Center(
                      child: GestureDetector(
                        onTap: () {},
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          child: const Icon(Icons.more_horiz, size: 20, color: Color(0xFF262626)),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Search Bar
            Container(
              color: Colors.white,
              padding: const EdgeInsets.all(16),
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xFFEFEFEF),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: TextField(
                  onChanged: (value) => setState(() => _searchQuery = value),
                  decoration: const InputDecoration(
                    hintText: 'Search notifications...',
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    prefixIcon: Icon(Icons.search, color: Color(0xFF8E8E8E), size: 16),
                  ),
                ),
              ),
            ),

            // Tab Navigation - Horizontal scrolling
            Container(
              color: Colors.white,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    _buildTab('notifications', 'Notifications'),
                    const SizedBox(width: 8),
                    _buildTab('bookings', 'Bookings'),
                    const SizedBox(width: 8),
                    _buildTab('invites', 'Invites'),
                  ],
                ),
              ),
            ),

            // Notifications List
            Expanded(
              child: _activeTab == 'notifications' 
                  ? _buildNotificationsList()
                  : _activeTab == 'bookings'
                      ? _buildBookingsList()
                      : _buildInvitesList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTab(String id, String label) {
    final isActive = _activeTab == id;
    return GestureDetector(
      onTap: () => setState(() => _activeTab = id),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 2),
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
        decoration: BoxDecoration(
          color: isActive ? const Color(0xFF0095F6) : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isActive ? Colors.white : const Color(0xFF6B7280),
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }

  Widget _buildNotificationsList() {
    final filteredNotifications = _filteredNotifications.where((notification) {
      if (_searchQuery.isEmpty) return true;
      return notification['user']['name'].toLowerCase().contains(_searchQuery.toLowerCase()) ||
             notification['action'].toLowerCase().contains(_searchQuery.toLowerCase());
    }).toList();

    if (filteredNotifications.isEmpty) {
      return const Center(
        child: Padding(
          padding: EdgeInsets.all(60),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.notifications_none, size: 64, color: Color(0xFF9CA3AF)),
              SizedBox(height: 16),
              Text('No notifications yet', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Color(0xFF374151))),
              SizedBox(height: 8),
              Text('When you get notifications, they\'ll appear here', style: TextStyle(fontSize: 14, color: Color(0xFF6B7280)), textAlign: TextAlign.center),
            ],
          ),
        ),
      );
    }

    return ListView.builder(
      itemCount: filteredNotifications.length,
      itemBuilder: (context, index) {
        final notification = filteredNotifications[index];
        return _buildNotificationItem(notification);
      },
    );
  }

  Widget _buildBookingsList() {
    final bookings = [
      {
        'id': '1',
        'user': {
          'name': 'Emma Thompson',
          'avatar': 'https://images.unsplash.com/photo-1494790108755-2616b612b786?w=150&h=150&fit=crop&crop=face',
        },
        'service': 'Massage Therapy',
        'date': 'Today, 3:00 PM',
        'status': 'pending',
        'price': '\$120',
      },
      {
        'id': '2',
        'user': {
          'name': 'Mia Rodriguez',
          'avatar': 'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?w=150&h=150&fit=crop&crop=face',
        },
        'service': 'Escort Service',
        'date': 'Tomorrow, 7:00 PM',
        'status': 'pending',
        'price': '\$200',
      },
    ];

    if (bookings.isEmpty) {
      return const Center(
        child: Padding(
          padding: EdgeInsets.all(60),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.calendar_today, size: 64, color: Color(0xFF9CA3AF)),
              SizedBox(height: 16),
              Text('No booking requests yet', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Color(0xFF374151))),
              SizedBox(height: 8),
              Text('When you receive booking requests, they\'ll appear here', style: TextStyle(fontSize: 14, color: Color(0xFF6B7280)), textAlign: TextAlign.center),
            ],
          ),
        ),
      );
    }

    return ListView.builder(
      itemCount: bookings.length,
      itemBuilder: (context, index) {
        final booking = bookings[index];
        return _buildBookingItem(booking);
      },
    );
  }

  Widget _buildBookingItem(Map<String, dynamic> booking) {
    return Container(
      color: Colors.white,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          boxShadow: const [BoxShadow(color: Color(0x0D000000), blurRadius: 3, offset: Offset(0, 1))],
        ),
        child: Column(
          children: [
            Row(
              children: [
                // User Avatar
                Container(
                  margin: const EdgeInsets.only(right: 12),
                  child: Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: NetworkImage(booking['user']['avatar']),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),

                // Content
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        booking['user']['name'],
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF262626),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        booking['service'],
                        style: const TextStyle(
                          fontSize: 14,
                          color: Color(0xFF6B7280),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        booking['date'],
                        style: const TextStyle(
                          fontSize: 12,
                          color: Color(0xFF8E8E8E),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),

                // Price
                Text(
                  booking['price'],
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF0095F6),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 16),

            // Action Buttons
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      // Accept booking logic
                      setState(() {
                        // Update booking status
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      decoration: BoxDecoration(
                        color: const Color(0xFF0095F6),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Center(
                        child: Text(
                          'Accept',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      // Reject booking logic
                      setState(() {
                        // Update booking status
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Center(
                        child: Text(
                          'Reject',
                          style: TextStyle(
                            color: Color(0xFF6B7280),
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
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

  Widget _buildInvitesList() {
    final invites = [
      {
        'id': '1',
        'user': {
          'name': 'Alex Chen',
          'avatar': 'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=150&h=150&fit=crop&crop=face',
        },
        'post': 'Collaborative Photo Shoot',
        'message': 'Would you like to collaborate on a creative photo project?',
        'time': '2h ago',
        'type': 'collaboration',
      },
      {
        'id': '2',
        'user': {
          'name': 'Sarah Wilson',
          'avatar': 'https://images.unsplash.com/photo-1534528741775-53994a69daeb?w=150&h=150&fit=crop&crop=face',
        },
        'post': 'Joint Event Planning',
        'message': 'Interested in co-hosting a community event?',
        'time': '5h ago',
        'type': 'event',
      },
    ];

    if (invites.isEmpty) {
      return const Center(
        child: Padding(
          padding: EdgeInsets.all(60),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.group_add, size: 64, color: Color(0xFF9CA3AF)),
              SizedBox(height: 16),
              Text('No collaboration invites yet', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Color(0xFF374151))),
              SizedBox(height: 8),
              Text('When you receive collaboration invites, they\'ll appear here', style: TextStyle(fontSize: 14, color: Color(0xFF6B7280)), textAlign: TextAlign.center),
            ],
          ),
        ),
      );
    }

    return ListView.builder(
      itemCount: invites.length,
      itemBuilder: (context, index) {
        final invite = invites[index];
        return _buildInviteItem(invite);
      },
    );
  }

  Widget _buildInviteItem(Map<String, dynamic> invite) {
    return Container(
      color: Colors.white,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          boxShadow: const [BoxShadow(color: Color(0x0D000000), blurRadius: 3, offset: Offset(0, 1))],
        ),
        child: Column(
          children: [
            Row(
              children: [
                // User Avatar
                Container(
                  margin: const EdgeInsets.only(right: 12),
                  child: Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: NetworkImage(invite['user']['avatar']),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),

                // Content
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        invite['user']['name'],
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF262626),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        invite['post'],
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF0095F6),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        invite['message'],
                        style: const TextStyle(
                          fontSize: 13,
                          color: Color(0xFF6B7280),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        invite['time'],
                        style: const TextStyle(
                          fontSize: 12,
                          color: Color(0xFF8E8E8E),
                          fontWeight: FontWeight.w500),
                        ),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 16),

            // Action Buttons
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      // Accept invite logic
                      setState(() {
                        // Update invite status
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      decoration: BoxDecoration(
                        color: const Color(0xFF0095F6),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Center(
                        child: Text(
                          'Accept',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      // Decline invite logic
                      setState(() {
                        // Update invite status
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Center(
                        child: Text(
                          'Decline',
                          style: TextStyle(
                            color: Color(0xFF6B7280),
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
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

  Widget _buildNotificationItem(Map<String, dynamic> notification) {
    return Container(
      color: Colors.white,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          boxShadow: const [BoxShadow(color: Color(0x0D000000), blurRadius: 3, offset: Offset(0, 1))],
        ),
        child: Row(
          children: [
            // User Avatar
            Container(
              margin: const EdgeInsets.only(right: 12),
              child: Stack(
                children: [
                  Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: NetworkImage(notification['user']['avatar']),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  
                  // Notification type indicator
                  Positioned(
                    bottom: 2,
                    right: 2,
                    child: Container(
                      width: 16,
                      height: 16,
                      decoration: BoxDecoration(
                        color: _getNotificationTypeColor(notification['type']),
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 2),
                      ),
                      child: Icon(
                        _getNotificationTypeIcon(notification['type']),
                        size: 8,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Content
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: RichText(
                          text: TextSpan(
                            style: const TextStyle(fontSize: 14, color: Color(0xFF262626)),
                            children: [
                              TextSpan(
                                text: notification['user']['name'],
                                style: const TextStyle(fontWeight: FontWeight.w600),
                              ),
                              const TextSpan(text: ' '),
                              TextSpan(text: notification['action']),
                            ],
                          ),
                        ),
                      ),
                      Text(
                        notification['time'],
                        style: const TextStyle(
                          fontSize: 12,
                          color: Color(0xFF8E8E8E),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  
                  if (notification['comment'] != null) ...[
                    const SizedBox(height: 4),
                    Text(
                      notification['comment'],
                      style: const TextStyle(
                        fontSize: 13,
                        color: Color(0xFF6B7280),
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ],
                ],
              ),
            ),

            // Post Image (if applicable)
            if (notification['postImage'] != null) ...[
              const SizedBox(width: 12),
              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(
                    image: NetworkImage(notification['postImage']),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Color _getNotificationTypeColor(String type) {
    switch (type) {
      case 'like':
        return const Color(0xFFE91E63);
      case 'comment':
        return const Color(0xFF2196F3);
      case 'follow':
        return const Color(0xFF4CAF50);
      case 'message':
        return const Color(0xFF9C27B0);
      default:
        return const Color(0xFF6B7280);
    }
  }

  IconData _getNotificationTypeIcon(String type) {
    switch (type) {
      case 'like':
        return Icons.favorite;
      case 'comment':
        return Icons.chat_bubble;
      case 'follow':
        return Icons.person_add;
      case 'message':
        return Icons.message;
      default:
        return Icons.notifications;
    }
  }
}
