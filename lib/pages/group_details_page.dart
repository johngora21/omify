import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class GroupDetailsPage extends StatefulWidget {
  final String groupName;
  final String groupId;
  
  const GroupDetailsPage({
    super.key,
    required this.groupName,
    required this.groupId,
  });

  @override
  State<GroupDetailsPage> createState() => _GroupDetailsPageState();
}

class _GroupDetailsPageState extends State<GroupDetailsPage> {
  bool _isAdmin = true; // Mock admin status
  bool _isMuted = false;
  bool _isPinned = false;
  
  final List<Map<String, dynamic>> _members = [
    {
      'name': 'Emma Thompson',
      'avatar': 'E',
      'role': 'admin',
      'status': 'online',
      'lastSeen': '2 minutes ago',
    },
    {
      'name': 'Mia Rodriguez',
      'avatar': 'M',
      'role': 'member',
      'status': 'online',
      'lastSeen': '5 minutes ago',
    },
    {
      'name': 'John Smith',
      'avatar': 'J',
      'role': 'member',
      'status': 'offline',
      'lastSeen': '1 hour ago',
    },
    {
      'name': 'Sarah Wilson',
      'avatar': 'S',
      'role': 'member',
      'status': 'online',
      'lastSeen': '30 minutes ago',
    },
    {
      'name': 'Alex Chen',
      'avatar': 'A',
      'role': 'member',
      'status': 'offline',
      'lastSeen': '2 hours ago',
    },
  ];

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
            onPressed: () => context.go('/messages'),
            iconSize: 20,
            padding: const EdgeInsets.all(8),
          ),
        ),
        title: const Text(
          'Group Info',
          style: TextStyle(
            color: Color(0xFF262626),
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit, color: Color(0xFF667EEA)),
            onPressed: () {
              _showEditGroupDialog();
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Group Header
            Container(
              color: Colors.white,
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  // Group Avatar
                  Container(
                    width: 80,
                    height: 80,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Color(0xFF667EEA), Color(0xFF764BA2)],
                      ),
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Text(
                        widget.groupName[0].toUpperCase(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 32,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  
                  // Group Name
                  Text(
                    widget.groupName,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF262626),
                    ),
                  ),
                  const SizedBox(height: 8),
                  
                  // Member Count
                  Text(
                    '${_members.length} members',
                    style: const TextStyle(
                      fontSize: 16,
                      color: Color(0xFF6B7280),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 16),
                  
                  // Action Buttons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildActionButton(
                        icon: Icons.chat_bubble,
                        label: 'Message',
                        onTap: () => context.go('/messages'),
                      ),
                      _buildActionButton(
                        icon: Icons.call,
                        label: 'Call',
                        onTap: () {},
                      ),
                      _buildActionButton(
                        icon: Icons.videocam,
                        label: 'Video',
                        onTap: () {},
                      ),
                    ],
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: 16),
            
            // Quick Actions
            Container(
              color: Colors.white,
              child: Column(
                children: [
                  _buildQuickAction(
                    icon: Icons.volume_off,
                    title: 'Mute notifications',
                    subtitle: _isMuted ? 'Notifications are muted' : 'Tap to mute notifications',
                    onTap: () {
                      setState(() {
                        _isMuted = !_isMuted;
                      });
                    },
                    trailing: Switch(
                      value: _isMuted,
                      onChanged: (value) {
                        setState(() {
                          _isMuted = value;
                        });
                      },
                      activeColor: const Color(0xFF667EEA),
                    ),
                  ),
                  _buildQuickAction(
                    icon: Icons.push_pin,
                    title: 'Pin chat',
                    subtitle: _isPinned ? 'Chat is pinned' : 'Pin this chat to the top',
                    onTap: () {
                      setState(() {
                        _isPinned = !_isPinned;
                      });
                    },
                    trailing: Switch(
                      value: _isPinned,
                      onChanged: (value) {
                        setState(() {
                          _isPinned = value;
                        });
                      },
                      activeColor: const Color(0xFF667EEA),
                    ),
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: 16),
            
            // Group Settings
            Container(
              color: Colors.white,
              child: Column(
                children: [
                  _buildQuickAction(
                    icon: Icons.photo_library,
                    title: 'Shared media',
                    subtitle: 'Photos, videos, and files',
                    onTap: () {
                      _showSharedMediaDialog();
                    },
                  ),
                  _buildQuickAction(
                    icon: Icons.description,
                    title: 'Group description',
                    subtitle: 'Add a description to your group',
                    onTap: () {
                      _showGroupDescriptionDialog();
                    },
                  ),
                  if (_isAdmin) ...[
                    _buildQuickAction(
                      icon: Icons.admin_panel_settings,
                      title: 'Admin settings',
                      subtitle: 'Manage group permissions',
                      onTap: () {
                        _showAdminSettingsDialog();
                      },
                    ),
                  ],
                ],
              ),
            ),
            
            const SizedBox(height: 16),
            
            // Members Section
            Container(
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Members (${_members.length})',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF262626),
                          ),
                        ),
                        if (_isAdmin)
                          TextButton(
                            onPressed: () {},
                            child: const Text(
                              'Add',
                              style: TextStyle(
                                color: Color(0xFF667EEA),
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                  ..._members.map((member) => _buildMemberTile(member)),
                ],
              ),
            ),
            
            const SizedBox(height: 16),
            
            // Danger Zone
            Container(
              color: Colors.white,
              child: Column(
                children: [
                  ListTile(
                    leading: const Icon(
                      Icons.exit_to_app,
                      color: Color(0xFFDC2626),
                      size: 24,
                    ),
                    title: const Text(
                      'Leave group',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFFDC2626),
                      ),
                    ),
                    onTap: () {
                      _showLeaveGroupDialog();
                    },
                  ),
                  if (_isAdmin)
                    ListTile(
                      leading: const Icon(
                        Icons.delete_forever,
                        color: Color(0xFFDC2626),
                        size: 24,
                      ),
                      title: const Text(
                        'Delete group',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFFDC2626),
                        ),
                      ),
                      onTap: () {
                        _showDeleteGroupDialog();
                      },
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

  Widget _buildActionButton({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: const Color(0xFF667EEA),
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              color: Colors.white,
              size: 24,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: Color(0xFF6B7280),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuickAction({
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
    Widget? trailing,
    Color? titleColor,
    Color? subtitleColor,
  }) {
    return ListTile(
      leading: Icon(
        icon,
        color: titleColor ?? const Color(0xFF667EEA),
        size: 24,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: titleColor ?? const Color(0xFF262626),
        ),
      ),
      subtitle: Text(
        subtitle,
        style: TextStyle(
          fontSize: 14,
          color: subtitleColor ?? const Color(0xFF6B7280),
        ),
      ),
      trailing: trailing,
      onTap: onTap,
    );
  }

  Widget _buildMemberTile(Map<String, dynamic> member) {
    return ListTile(
      leading: GestureDetector(
        onTap: () {
          _showMemberOptionsDialog(member);
        },
        child: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Color(0xFF667EEA), Color(0xFF764BA2)],
            ),
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Text(
              member['avatar'],
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
      title: Row(
        children: [
          Text(
            member['name'],
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Color(0xFF262626),
            ),
          ),
          if (member['role'] == 'admin') ...[
            const SizedBox(width: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
              decoration: BoxDecoration(
                color: const Color(0xFF667EEA),
                borderRadius: BorderRadius.circular(4),
              ),
              child: const Text(
                'Admin',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ],
      ),
      subtitle: Text(
        member['status'] == 'online' ? 'Online' : member['lastSeen'],
        style: TextStyle(
          fontSize: 14,
          color: member['status'] == 'online' 
              ? const Color(0xFF22C55E) 
              : const Color(0xFF6B7280),
        ),
      ),
      trailing: member['status'] == 'online'
          ? Container(
              width: 8,
              height: 8,
              decoration: const BoxDecoration(
                color: Color(0xFF22C55E),
                shape: BoxShape.circle,
              ),
            )
          : null,
      onTap: () {
        _showMemberOptionsDialog(member);
      },
    );
  }

  void _showLeaveGroupDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Leave Group'),
          content: const Text('Are you sure you want to leave this group? You will no longer receive messages from this group.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                context.go('/messages');
              },
              child: const Text(
                'Leave',
                style: TextStyle(color: Color(0xFFDC2626)),
              ),
            ),
          ],
        );
      },
    );
  }

  void _showEditGroupDialog() {
    String newGroupName = widget.groupName;
    String? newPhotoUrl;
    
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Dialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
              ),
              elevation: 0,
              backgroundColor: Colors.transparent,
              child: Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.1),
                      blurRadius: 20,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Header
                    Row(
                      children: [
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color: const Color(0xFF667EEA).withValues(alpha: 0.1),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Icon(
                            Icons.edit,
                            color: Color(0xFF667EEA),
                            size: 20,
                          ),
                        ),
                        const SizedBox(width: 16),
                        const Expanded(
                          child: Text(
                            'Edit Group',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFF262626),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    // Group Photo
                    GestureDetector(
                      onTap: () {
                        // Handle photo selection
                        print('Select new group photo');
                      },
                      child: Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [Color(0xFF667EEA), Color(0xFF764BA2)],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xFF667EEA).withValues(alpha: 0.3),
                              blurRadius: 15,
                              offset: const Offset(0, 8),
                            ),
                          ],
                        ),
                        child: Center(
                          child: newPhotoUrl != null
                              ? ClipOval(
                                  child: Image.network(
                                    newPhotoUrl,
                                    width: 100,
                                    height: 100,
                                    fit: BoxFit.cover,
                                  ),
                                )
                              : Text(
                                  newGroupName[0].toUpperCase(),
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 36,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF3F4F6),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Text(
                        'Tap to change photo',
                        style: TextStyle(
                          fontSize: 13,
                          color: Color(0xFF6B7280),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    // Group Name
                    Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFFF9FAFB),
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: const Color(0xFFE5E7EB),
                          width: 1,
                        ),
                      ),
                      child: TextField(
                        decoration: const InputDecoration(
                          labelText: 'Group Name',
                          labelStyle: TextStyle(
                            color: Color(0xFF6B7280),
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                          hintText: 'Enter group name',
                          hintStyle: TextStyle(
                            color: Color(0xFF9CA3AF),
                            fontSize: 14,
                          ),
                        ),
                        controller: TextEditingController(text: newGroupName),
                        onChanged: (value) {
                          newGroupName = value;
                        },
                        style: const TextStyle(
                          fontSize: 16,
                          color: Color(0xFF262626),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    const SizedBox(height: 32),
                    // Action Buttons
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                              color: const Color(0xFFF3F4F6),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: TextButton(
                              onPressed: () => Navigator.of(context).pop(),
                              style: TextButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                              ),
                              child: const Text(
                                'Cancel',
                                style: TextStyle(
                                  color: Color(0xFF6B7280),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                colors: [Color(0xFF667EEA), Color(0xFF764BA2)],
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                              ),
                              borderRadius: BorderRadius.circular(16),
                              boxShadow: [
                                BoxShadow(
                                  color: const Color(0xFF667EEA).withValues(alpha: 0.3),
                                  blurRadius: 12,
                                  offset: const Offset(0, 6),
                                ),
                              ],
                            ),
                            child: TextButton(
                              onPressed: () {
                                // Handle save logic here
                                print('Save group changes: $newGroupName');
                                Navigator.of(context).pop();
                              },
                              style: TextButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                              ),
                              child: const Text(
                                'Save',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
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
          },
        );
      },
    );
  }

  void _showDeleteGroupDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Delete Group'),
          content: const Text('Are you sure you want to delete this group? This action cannot be undone and all members will be removed.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                context.go('/messages');
              },
              child: const Text(
                'Delete',
                style: TextStyle(color: Color(0xFFDC2626)),
              ),
            ),
          ],
        );
      },
    );
  }

  void _showSharedMediaDialog() {
    final List<Map<String, dynamic>> sharedMedia = [
      {
        'type': 'photo',
        'url': 'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=150&h=150&fit=crop',
        'sender': 'Emma',
        'time': '2 hours ago',
      },
      {
        'type': 'video',
        'url': 'https://images.unsplash.com/photo-1494790108755-2616b612b786?w=150&h=150&fit=crop',
        'sender': 'Mia',
        'time': '1 day ago',
      },
      {
        'type': 'file',
        'url': 'document.pdf',
        'sender': 'John',
        'time': '3 days ago',
      },
      {
        'type': 'photo',
        'url': 'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?w=150&h=150&fit=crop',
        'sender': 'Sarah',
        'time': '1 week ago',
      },
    ];

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.85,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(24),
              topRight: Radius.circular(24),
            ),
          ),
          child: Column(
            children: [
              // Header with drag handle
              Container(
                padding: const EdgeInsets.only(top: 16, bottom: 8),
                child: Container(
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                    color: const Color(0xFFD1D5DB),
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
              // Header
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                decoration: const BoxDecoration(
                  color: Color(0xFFF9FAFB),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24),
                    topRight: Radius.circular(24),
                  ),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: const Color(0xFF667EEA).withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Icon(
                        Icons.photo_library,
                        color: Color(0xFF667EEA),
                        size: 20,
                      ),
                    ),
                    const SizedBox(width: 16),
                    const Expanded(
                      child: Text(
                        'Shared Media',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF262626),
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () => Navigator.of(context).pop(),
                      icon: Container(
                        width: 32,
                        height: 32,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.1),
                              blurRadius: 8,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: const Icon(
                          Icons.close,
                          size: 18,
                          color: Color(0xFF6B7280),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // Filter tabs
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 40,
                        decoration: BoxDecoration(
                          color: const Color(0xFF667EEA),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Center(
                          child: Text(
                            'Photos',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Container(
                        height: 40,
                        decoration: BoxDecoration(
                          color: const Color(0xFFF3F4F6),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Center(
                          child: Text(
                            'Videos',
                            style: TextStyle(
                              color: Color(0xFF6B7280),
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Container(
                        height: 40,
                        decoration: BoxDecoration(
                          color: const Color(0xFFF3F4F6),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Center(
                          child: Text(
                            'Files',
                            style: TextStyle(
                              color: Color(0xFF6B7280),
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // Media grid - full width without padding
              Expanded(
                child: GridView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                  ),
                  itemCount: sharedMedia.length,
                  itemBuilder: (context, index) {
                    final media = sharedMedia[index];
                    return GestureDetector(
                      onTap: () {
                        // Handle media tap
                        print('Tapped on ${media['type']}: ${media['url']}');
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.05),
                              blurRadius: 8,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: media['type'] == 'file'
                              ? Container(
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFF3F4F6),
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  child: const Icon(
                                    Icons.description,
                                    color: Color(0xFF6B7280),
                                    size: 32,
                                  ),
                                )
                              : Image.network(
                                  media['url'] as String,
                                  fit: BoxFit.cover,
                                ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 24),
            ],
          ),
        );
      },
    );
  }

  void _showGroupDescriptionDialog() {
    String description = 'This is a community group for sharing ideas and connecting with like-minded people.';
    bool isEditing = false;
    
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: const Text('Group Description'),
              content: SizedBox(
                width: double.maxFinite,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (!isEditing) ...[
                      Text(
                        description,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Color(0xFF262626),
                        ),
                      ),
                      const SizedBox(height: 16),
                      TextButton(
                        onPressed: () {
                          setState(() {
                            isEditing = true;
                          });
                        },
                        child: const Text(
                          'Edit Description',
                          style: TextStyle(color: Color(0xFF667EEA)),
                        ),
                      ),
                    ] else ...[
                      TextField(
                        maxLines: 3,
                        decoration: const InputDecoration(
                          labelText: 'Description',
                          border: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFF667EEA)),
                          ),
                        ),
                        controller: TextEditingController(text: description),
                        onChanged: (value) {
                          description = value;
                        },
                      ),
                    ],
                  ],
                ),
              ),
              actions: [
                if (isEditing) ...[
                  TextButton(
                    onPressed: () {
                      setState(() {
                        isEditing = false;
                      });
                    },
                    child: const Text('Cancel'),
                  ),
                  TextButton(
                    onPressed: () {
                      // Handle save logic here
                      print('Save description: $description');
                      setState(() {
                        isEditing = false;
                      });
                    },
                    child: const Text(
                      'Save',
                      style: TextStyle(color: Color(0xFF667EEA)),
                    ),
                  ),
                ] else ...[
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: const Text('Close'),
                  ),
                ],
              ],
            );
          },
        );
      },
    );
  }

  void _showAdminSettingsDialog() {
    bool canSendMessages = true;
    bool canEditGroup = false;
    bool canAddMembers = true;
    bool canRemoveMembers = false;
    
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: const Text('Admin Settings'),
              content: SizedBox(
                width: double.maxFinite,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      'Manage group permissions for members',
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(0xFF6B7280),
                      ),
                    ),
                    const SizedBox(height: 16),
                    SwitchListTile(
                      title: const Text('Send Messages'),
                      subtitle: const Text('Members can send messages'),
                      value: canSendMessages,
                      onChanged: (value) {
                        setState(() {
                          canSendMessages = value;
                        });
                      },
                      activeColor: const Color(0xFF667EEA),
                    ),
                    SwitchListTile(
                      title: const Text('Edit Group'),
                      subtitle: const Text('Members can edit group info'),
                      value: canEditGroup,
                      onChanged: (value) {
                        setState(() {
                          canEditGroup = value;
                        });
                      },
                      activeColor: const Color(0xFF667EEA),
                    ),
                    SwitchListTile(
                      title: const Text('Add Members'),
                      subtitle: const Text('Members can add new people'),
                      value: canAddMembers,
                      onChanged: (value) {
                        setState(() {
                          canAddMembers = value;
                        });
                      },
                      activeColor: const Color(0xFF667EEA),
                    ),
                    SwitchListTile(
                      title: const Text('Remove Members'),
                      subtitle: const Text('Members can remove others'),
                      value: canRemoveMembers,
                      onChanged: (value) {
                        setState(() {
                          canRemoveMembers = value;
                        });
                      },
                      activeColor: const Color(0xFF667EEA),
                    ),
                  ],
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text('Cancel'),
                ),
                TextButton(
                  onPressed: () {
                    // Handle save logic here
                    print('Save admin settings');
                    Navigator.of(context).pop();
                  },
                  child: const Text(
                    'Save',
                    style: TextStyle(color: Color(0xFF667EEA)),
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }

  void _showMemberOptionsDialog(Map<String, dynamic> member) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('${member['name']} Options'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (_isAdmin && member['role'] != 'admin') ...[
                ListTile(
                  leading: const Icon(
                    Icons.admin_panel_settings,
                    color: Color(0xFF667EEA),
                  ),
                  title: const Text('Make Admin'),
                  onTap: () {
                    Navigator.of(context).pop();
                    _makeMemberAdmin(member);
                  },
                ),
              ],
              if (_isAdmin) ...[
                ListTile(
                  leading: const Icon(
                    Icons.block,
                    color: Color(0xFFDC2626),
                  ),
                  title: const Text('Remove from Group'),
                  onTap: () {
                    Navigator.of(context).pop();
                    _removeMemberFromGroup(member);
                  },
                ),
                ListTile(
                  leading: const Icon(
                    Icons.block,
                    color: Color(0xFFDC2626),
                  ),
                  title: const Text('Deny Sending Messages'),
                  onTap: () {
                    Navigator.of(context).pop();
                    _denyMemberMessages(member);
                  },
                ),
              ],
              ListTile(
                leading: const Icon(
                  Icons.person,
                  color: Color(0xFF667EEA),
                ),
                title: const Text('View Profile'),
                onTap: () {
                  Navigator.of(context).pop();
                  _viewMemberProfile(member);
                },
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancel'),
            ),
          ],
        );
      },
    );
  }

  void _makeMemberAdmin(Map<String, dynamic> member) {
    // Handle making member admin
    print('Making ${member['name']} admin');
    // You can implement the actual logic here
  }

  void _removeMemberFromGroup(Map<String, dynamic> member) {
    // Handle removing member from group
    print('Removing ${member['name']} from group');
    // You can implement the actual logic here
  }

  void _denyMemberMessages(Map<String, dynamic> member) {
    // Handle denying member from sending messages
    print('Denying ${member['name']} from sending messages');
    // You can implement the actual logic here
  }

  void _viewMemberProfile(Map<String, dynamic> member) {
    // Handle viewing member profile
    print('Viewing ${member['name']} profile');
    // You can implement the actual logic here
  }


}
