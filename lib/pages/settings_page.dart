import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _showPassword = false;
  bool _showConfirmPassword = false;
  String _theme = 'light';
  String _language = 'English';

  Map<String, bool> _notifications = {
    'messages': true,
    'bookings': true,
    'promotions': false,
    'updates': true,
    'newMatches': true,
    'nearbyProviders': false
  };

  final Map<String, dynamic> _mockUser = {
    'name': 'Alex Johnson',
    'email': 'alex.johnson@example.com',
    'phone': '+1 (555) 123-4567',
    'location': 'San Francisco, CA',
    'language': 'English',
    'theme': 'Light',
    'avatar': 'https://images.unsplash.com/photo-1494790108755-2616b612b786?w=150&h=150&fit=crop&crop=face'
  };

  final List<Map<String, dynamic>> _settingsSections = [
    {
      'title': 'Account',
      'items': [
        {
          'icon': Icons.shield,
          'title': 'Privacy & Security',
          'subtitle': 'Manage your account security',
          'action': 'navigate',
          'color': const Color(0xFF10b981)
        },
        {
          'icon': Icons.notifications,
          'title': 'Notifications',
          'subtitle': 'Customize your notifications',
          'action': 'navigate',
          'color': const Color(0xFFf59e0b)
        }
      ]
    },
    {
      'title': 'Preferences',
      'items': [
        {
          'icon': Icons.palette,
          'title': 'Appearance',
          'subtitle': 'Theme and display settings',
          'action': 'navigate',
          'color': const Color(0xFF8b5cf6)
        },
        {
          'icon': Icons.language,
          'title': 'Language',
          'subtitle': 'Choose your preferred language',
          'action': 'navigate',
          'color': const Color(0xFF667EEA)
        }
      ]
    }
  ];

  void _handleLogout() {
    print('Logging out...');
  }

  void _handleDeleteAccount() {
    print('Deleting account...');
  }

  void _toggleNotification(String key) {
    setState(() {
      _notifications[key] = !_notifications[key]!;
    });
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
          'Settings',
          style: TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Profile Section
            Container(
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
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
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: NetworkImage(_mockUser['avatar']),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          _mockUser['name'],
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          _mockUser['email'],
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          _mockUser['phone'],
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.edit, color: Color(0xFF667EEA)),
                    onPressed: () {
                      // Navigate to edit profile
                    },
                  ),
                ],
              ),
            ),

            // Settings Sections
            ..._settingsSections.map((section) => _buildSettingsSection(section)),

            // Theme Toggle
            Container(
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Appearance',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Icon(
                        _theme == 'light' ? Icons.light_mode : Icons.dark_mode,
                        color: _theme == 'light' ? Colors.orange : Colors.purple,
                      ),
                      const SizedBox(width: 16),
                      const Expanded(
                        child: Text(
                          'Dark Mode',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Switch(
                        value: _theme == 'dark',
                        onChanged: (value) {
                          setState(() {
                            _theme = value ? 'dark' : 'light';
                          });
                        },
                        activeColor: const Color(0xFF667EEA),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Notifications
            Container(
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Notifications',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  ..._notifications.entries.map((entry) => _buildNotificationItem(entry.key, entry.value)),
                ],
              ),
            ),

            // Account Actions
            Container(
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                      onPressed: _handleLogout,
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.red,
                        side: const BorderSide(color: Colors.red),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text(
                        'Logout',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                      onPressed: _handleDeleteAccount,
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.red,
                        side: const BorderSide(color: Colors.red),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text(
                        'Delete Account',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  Widget _buildSettingsSection(Map<String, dynamic> section) {
    return Container(
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(24),
            child: Text(
              section['title'],
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ...(section['items'] as List<Map<String, dynamic>>).map((item) => _buildSettingsItem(item)),
        ],
      ),
    );
  }

  Widget _buildSettingsItem(Map<String, dynamic> item) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.grey[200]!,
            width: 1,
          ),
        ),
      ),
      child: ListTile(
        leading: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: (item['color'] as Color).withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(
            item['icon'],
            color: item['color'],
            size: 20,
          ),
        ),
        title: Text(
          item['title'],
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        subtitle: Text(
          item['subtitle'],
          style: TextStyle(
            color: Colors.grey[600],
            fontSize: 14,
          ),
        ),
        trailing: const Icon(
          Icons.chevron_right,
          color: Colors.grey,
        ),
        onTap: () {
          // Handle navigation
          print('Navigate to ${item['title']}');
        },
      ),
    );
  }

  Widget _buildNotificationItem(String key, bool value) {
    String title;
    String subtitle;
    IconData icon;

    switch (key) {
      case 'messages':
        title = 'Messages';
        subtitle = 'Get notified about new messages';
        icon = Icons.message;
        break;
      case 'bookings':
        title = 'Bookings';
        subtitle = 'Updates about your bookings';
        icon = Icons.calendar_today;
        break;
      case 'promotions':
        title = 'Promotions';
        subtitle = 'Special offers and deals';
        icon = Icons.local_offer;
        break;
      case 'updates':
        title = 'App Updates';
        subtitle = 'New features and improvements';
        icon = Icons.system_update;
        break;
      case 'newMatches':
        title = 'New Matches';
        subtitle = 'When someone matches with you';
        icon = Icons.favorite;
        break;
      case 'nearbyProviders':
        title = 'Nearby Providers';
        subtitle = 'Providers in your area';
        icon = Icons.location_on;
        break;
      default:
        title = key;
        subtitle = '';
        icon = Icons.notifications;
    }

    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.grey[200]!,
            width: 1,
          ),
        ),
      ),
      child: ListTile(
        leading: Icon(icon, color: Colors.grey[600]),
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        subtitle: Text(
          subtitle,
          style: TextStyle(
            color: Colors.grey[600],
            fontSize: 14,
          ),
        ),
        trailing: Switch(
          value: value,
          onChanged: (newValue) => _toggleNotification(key),
          activeColor: const Color(0xFF667EEA),
        ),
      ),
    );
  }
}
