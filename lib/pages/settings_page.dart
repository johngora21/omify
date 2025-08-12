import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final Map<String, bool> _notifications = {
    'newMessages': true,
    'groupMessages': true,
    'channelUpdates': true,
    'bookingRequests': true,
    'bookingConfirmations': true,
    'reminders': true,
    'newMatches': true,
    'profileViews': true,
    'friendRequests': true,
    'promotionalOffers': false,
    'appUpdates': true,
    'nearbyProviders': false,
  };

  final Map<String, bool> _privacySettings = {
    'profileVisibility': true,
    'photoPrivacy': true,
    'onlineStatus': true,
    'locationSharing': true,
    'nearbyDiscovery': true,
    'locationHistory': false,
    'contentModeration': true,
    'ageRestrictions': true,
    'reportSettings': true,
  };

  String _language = 'English';
  String _dateFormat = 'MM/DD/YYYY';
  String _timeZone = 'UTC';
  String _currency = 'USD';
  bool _twoFactorEnabled = false;
  bool _accountVerified = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAFAFA),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Container(
          margin: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.1),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => context.go('/'),
            iconSize: 20,
            padding: const EdgeInsets.all(8),
          ),
        ),
        title: const Text(
          'Settings',
          style: TextStyle(
            color: Color(0xFF262626),
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [

            
            // Account & Security
            _buildSection(
              'Account & Security',
              [
                _buildSettingsItem(
                  icon: Icons.lock,
                  title: 'Password Change',
                  subtitle: 'Update your account password',
                  onTap: () => _showPasswordChangeDialog(),
                ),
                _buildSettingsItem(
                  icon: Icons.security,
                  title: 'Two-Factor Authentication',
                  subtitle: 'Add an extra layer of security',
                  trailing: Switch(
                    value: _twoFactorEnabled,
                    onChanged: (value) => setState(() => _twoFactorEnabled = value),
                    activeColor: const Color(0xFF667EEA),
                  ),
                ),
                _buildSettingsItem(
                  icon: Icons.verified_user,
                  title: 'Account Verification',
                  subtitle: 'Verify your account status',
                  trailing: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: _accountVerified ? const Color(0xFF10B981) : const Color(0xFFF59E0B),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      _accountVerified ? 'Verified' : 'Pending',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                _buildSettingsItem(
                  icon: Icons.share,
                  title: 'Data Sharing Preferences',
                  subtitle: 'Control how your data is shared',
                  onTap: () => _showDataSharingDialog(),
                ),
                _buildSettingsItem(
                  icon: Icons.block,
                  title: 'Blocked Users',
                  subtitle: 'Manage your blocked users list',
                  onTap: () => _showBlockedUsersDialog(),
                ),
              ],
            ),
            
            const SizedBox(height: 16),
            
            // Notifications
            _buildSection(
              'Notifications',
              [
                _buildSettingsItem(
                  icon: Icons.alarm,
                  title: 'Reminders',
                  subtitle: 'Booking and appointment reminders',
                  trailing: Switch(
                    value: _notifications['reminders']!,
                    onChanged: (value) => _updateNotification('reminders', value),
                    activeColor: const Color(0xFF667EEA),
                  ),
                ),
                _buildSettingsItem(
                  icon: Icons.favorite,
                  title: 'New Matches',
                  subtitle: 'Get notified of new matches',
                  trailing: Switch(
                    value: _notifications['newMatches']!,
                    onChanged: (value) => _updateNotification('newMatches', value),
                    activeColor: const Color(0xFF667EEA),
                  ),
                ),
                _buildSettingsItem(
                  icon: Icons.person_add,
                  title: 'Friend Requests',
                  subtitle: 'Get friend request notifications',
                  trailing: Switch(
                    value: _notifications['friendRequests']!,
                    onChanged: (value) => _updateNotification('friendRequests', value),
                    activeColor: const Color(0xFF667EEA),
                  ),
                ),
                _buildSettingsItem(
                  icon: Icons.location_on,
                  title: 'Nearby Service Providers',
                  subtitle: 'Discover nearby services',
                  trailing: Switch(
                    value: _notifications['nearbyProviders']!,
                    onChanged: (value) => _updateNotification('nearbyProviders', value),
                    activeColor: const Color(0xFF667EEA),
                  ),
                ),
              ],
            ),
            
            const SizedBox(height: 16),
            
            // Language & Region
            _buildSection(
              'Language & Region',
              [
                _buildSettingsItem(
                  icon: Icons.language,
                  title: 'Language Selection',
                  subtitle: 'Choose your preferred language',
                  trailing: DropdownButton<String>(
                    value: _language,
                    underline: Container(),
                    items: ['English', 'Spanish', 'French', 'German', 'Chinese', 'Swahili'].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      if (newValue != null) {
                        setState(() {
                          _language = newValue;
                        });
                      }
                    },
                  ),
                ),
                _buildSettingsItem(
                  icon: Icons.attach_money,
                  title: 'Currency',
                  subtitle: 'Choose your preferred currency',
                  trailing: DropdownButton<String>(
                    value: _currency,
                    underline: Container(),
                    items: ['USD', 'EUR', 'GBP', 'JPY', 'CAD', 'TZS', 'KES', 'UGX', 'NGN', 'ZAR', 'INR', 'CNY', 'AUD'].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      if (newValue != null) {
                        setState(() {
                          _currency = newValue;
                        });
                      }
                    },
                  ),
                ),
              ],
            ),
            
            const SizedBox(height: 16),
            
            // Privacy & Safety
            _buildSection(
              'Privacy & Safety',
              [
                _buildSettingsItem(
                  icon: Icons.visibility,
                  title: 'Profile Visibility',
                  subtitle: 'Control who can see your profile',
                  onTap: () => _showProfileVisibilityDialog(),
                ),
                _buildSettingsItem(
                  icon: Icons.photo_library,
                  title: 'Profile Photo Privacy',
                  subtitle: 'Manage photo visibility settings',
                  onTap: () => _showPhotoPrivacyDialog(),
                ),
                _buildSettingsItem(
                  icon: Icons.circle,
                  title: 'Online Status',
                  subtitle: 'Show when you are online',
                  trailing: Switch(
                    value: _privacySettings['onlineStatus']!,
                    onChanged: (value) => _updatePrivacySetting('onlineStatus', value),
                    activeColor: const Color(0xFF667EEA),
                  ),
                ),
                _buildSettingsItem(
                  icon: Icons.location_on,
                  title: 'Location Sharing',
                  subtitle: 'Share your location with others',
                  trailing: Switch(
                    value: _privacySettings['locationSharing']!,
                    onChanged: (value) => _updatePrivacySetting('locationSharing', value),
                    activeColor: const Color(0xFF667EEA),
                  ),
                ),
                _buildSettingsItem(
                  icon: Icons.explore,
                  title: 'Nearby Discovery',
                  subtitle: 'Allow others to discover you nearby',
                  trailing: Switch(
                    value: _privacySettings['nearbyDiscovery']!,
                    onChanged: (value) => _updatePrivacySetting('nearbyDiscovery', value),
                    activeColor: const Color(0xFF667EEA),
                  ),
                ),
                _buildSettingsItem(
                  icon: Icons.history,
                  title: 'Location History',
                  subtitle: 'Save your location history',
                  trailing: Switch(
                    value: _privacySettings['locationHistory']!,
                    onChanged: (value) => _updatePrivacySetting('locationHistory', value),
                    activeColor: const Color(0xFF667EEA),
                  ),
                ),
                _buildSettingsItem(
                  icon: Icons.shield,
                  title: 'Content Moderation',
                  subtitle: 'Filter inappropriate content',
                  trailing: Switch(
                    value: _privacySettings['contentModeration']!,
                    onChanged: (value) => _updatePrivacySetting('contentModeration', value),
                    activeColor: const Color(0xFF667EEA),
                  ),
                ),
                _buildSettingsItem(
                  icon: Icons.child_care,
                  title: 'Age Restrictions',
                  subtitle: 'Set content age restrictions',
                  trailing: Switch(
                    value: _privacySettings['ageRestrictions']!,
                    onChanged: (value) => _updatePrivacySetting('ageRestrictions', value),
                    activeColor: const Color(0xFF667EEA),
                  ),
                ),
                _buildSettingsItem(
                  icon: Icons.report,
                  title: 'Report Settings',
                  subtitle: 'Configure reporting preferences',
                  onTap: () => _showReportSettingsDialog(),
                ),
              ],
            ),
            
            const SizedBox(height: 16),
            
            // Support & Help
            _buildSection(
              'Support & Help',
              [
                _buildSettingsItem(
                  icon: Icons.help,
                  title: 'Help Center',
                  subtitle: 'Browse help articles and guides',
                  onTap: () => _showHelpCenter(),
                ),
                _buildSettingsItem(
                  icon: Icons.question_answer,
                  title: 'FAQs',
                  subtitle: 'Frequently asked questions',
                  onTap: () => _showFAQs(),
                ),
                _buildSettingsItem(
                  icon: Icons.support_agent,
                  title: 'Contact Support',
                  subtitle: 'Get help from our support team',
                  onTap: () => _showContactSupport(),
                ),
                _buildSettingsItem(
                  icon: Icons.bug_report,
                  title: 'Report a Problem',
                  subtitle: 'Report bugs or issues',
                  onTap: () => _showReportProblem(),
                ),
                _buildSettingsItem(
                  icon: Icons.info,
                  title: 'About',
                  subtitle: 'App version and information',
                  onTap: () => _showAboutDialog(),
                ),
                _buildSettingsItem(
                  icon: Icons.description,
                  title: 'Terms of Service',
                  subtitle: 'Read our terms of service',
                  onTap: () => _showTermsOfService(),
                ),
                _buildSettingsItem(
                  icon: Icons.privacy_tip,
                  title: 'Privacy Policy',
                  subtitle: 'Read our privacy policy',
                  onTap: () => _showPrivacyPolicy(),
                ),
                _buildSettingsItem(
                  icon: Icons.description,
                  title: 'Licenses',
                  subtitle: 'Third-party licenses',
                  onTap: () => _showLicenses(),
                ),
              ],
            ),
            
            const SizedBox(height: 16),
            
            // Account Actions
            _buildSection(
              'Account Actions',
              [
                _buildSettingsItem(
                  icon: Icons.logout,
                  title: 'Logout',
                  onTap: () => _handleLogout(),
                  textColor: const Color(0xFF667EEA),
                ),
                _buildSettingsItem(
                  icon: Icons.pause_circle,
                  title: 'Deactivate Account',
                  onTap: () => _deactivateAccount(),
                  textColor: const Color(0xFFF59E0B),
                ),
                _buildSettingsItem(
                  icon: Icons.delete_forever,
                  title: 'Delete Account',
                  onTap: () => _deleteAccount(),
                  textColor: const Color(0xFFDC2626),
                ),
              ],
            ),
            
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileSection() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFF667EEA), Color(0xFF764BA2)],
              ),
              shape: BoxShape.circle,
            ),
            child: const Center(
              child: Icon(
                Icons.person,
                color: Colors.white,
                size: 30,
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Alex Johnson',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF262626),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'alex.johnson@example.com',
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  '+1 (555) 123-4567',
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
            onPressed: () => _editProfile(),
          ),
        ],
      ),
    );
  }

  Widget _buildSection(String title, List<Widget> items) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Color(0xFF262626),
              ),
            ),
          ),
          ...items,
        ],
      ),
    );
  }

  Widget _buildSettingsItem({
    required IconData icon,
    required String title,
    String? subtitle,
    Widget? trailing,
    VoidCallback? onTap,
    Color? textColor,
  }) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.grey.withValues(alpha: 0.1),
            width: 0.5,
          ),
        ),
      ),
      child: ListTile(
        leading: Icon(
          icon,
          color: textColor ?? const Color(0xFF667EEA),
          size: 24,
        ),
        title: Text(
          title,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: textColor ?? const Color(0xFF262626),
          ),
        ),
        subtitle: subtitle != null ? Text(
          subtitle,
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey[600],
          ),
        ) : null,
        trailing: trailing,
        onTap: onTap,
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      ),
    );
  }

  void _updateNotification(String key, bool value) {
    setState(() {
      _notifications[key] = value;
    });
  }

  void _updatePrivacySetting(String key, bool value) {
    setState(() {
      _privacySettings[key] = value;
    });
  }

  // Placeholder methods for dialogs and actions
  void _showPasswordChangeDialog() => print('Show password change dialog');
  void _showDataSharingDialog() => print('Show data sharing dialog');
  void _showBlockedUsersDialog() => print('Show blocked users dialog');
  void _showProfileVisibilityDialog() => print('Show profile visibility dialog');
  void _showPhotoPrivacyDialog() => print('Show photo privacy dialog');
  void _showReportSettingsDialog() => print('Show report settings dialog');
  void _showHelpCenter() => print('Show help center');
  void _showFAQs() => print('Show FAQs');
  void _showContactSupport() => print('Show contact support');
  void _showReportProblem() => print('Show report problem');
  void _showAboutDialog() => print('Show about dialog');
  void _showTermsOfService() => print('Show terms of service');
  void _showPrivacyPolicy() => print('Show privacy policy');
  void _showLicenses() => print('Show licenses');
  void _editProfile() => print('Edit profile');
  void _exportData() => print('Export data');
  void _deactivateAccount() => print('Deactivate account');
  void _deleteAccount() => print('Delete account');
  void _handleLogout() => print('Logout');
}
