import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MessagesPage extends StatefulWidget {
  const MessagesPage({super.key});

  @override
  State<MessagesPage> createState() => _MessagesPageState();
}

class _MessagesPageState extends State<MessagesPage> {
  String? _activeChat;
  String _message = '';
  String _searchQuery = '';
  String _activeTab = 'conversations';
  bool _showAIChat = false;
  String _aiInput = '';
  bool _isVoiceActive = false;
  
  final List<Map<String, dynamic>> _aiMessages = [
    {
      'id': 1,
      'text': "Hi! I'm your AI assistant. I can help you learn about all the features in our app. What would you like to know?",
      'sender': 'ai',
      'time': '2:30 PM',
    }
  ];
  
  final List<Map<String, dynamic>> _conversations = [
    {
      'id': '1',
      'name': 'Emma Thompson',
      'avatar': 'https://images.unsplash.com/photo-1494790108755-2616b612b786?w=150&h=150&fit=crop&crop=face',
      'lastMessage': 'Hey! How are you doing?',
      'time': '2m ago',
      'unread': 2,
      'online': true,
      'isTyping': false
    },
    {
      'id': '2',
      'name': 'Mia Rodriguez',
      'avatar': 'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?w=150&h=150&fit=crop&crop=face',
      'lastMessage': 'Thanks for the booking!',
      'time': '1h ago',
      'unread': 0,
      'online': false,
      'isTyping': true
    },
    {
      'id': '3',
      'name': 'Alex Johnson',
      'avatar': 'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=150&h=150&fit=crop&crop=face',
      'lastMessage': 'See you tomorrow at the meeting!',
      'time': '3h ago',
      'unread': 0,
      'online': false,
      'isTyping': false
    }
  ];

  final Map<String, List<Map<String, dynamic>>> _messages = {
    '1': [
      { 'id': 1, 'text': 'Hey! How are you doing?', 'sender': 'them', 'time': '2:30 PM', 'status': 'read' },
      { 'id': 2, 'text': 'I\'m good, thanks! How about you?', 'sender': 'me', 'time': '2:31 PM', 'status': 'read' }
    ]
  };

  Map<String, dynamic>? _getActiveConversation() {
    if (_activeChat == null) return null;
    try {
      return _conversations.firstWhere((conv) => conv['id'] == _activeChat);
    } catch (e) {
      // Return null if conversation not found (e.g., for channels)
      return null;
    }
  }

  void _handleAISendMessage() {
    if (_aiInput.trim().isNotEmpty) {
      setState(() {
        _aiMessages.add({
          'id': _aiMessages.length + 1,
          'text': _aiInput,
          'sender': 'user',
          'time': DateTime.now().toString().substring(11, 16),
        });
        
        // Generate AI response
        _aiMessages.add({
          'id': _aiMessages.length + 1,
          'text': _generateAIResponse(_aiInput),
          'sender': 'ai',
          'time': DateTime.now().toString().substring(11, 16),
        });
        
        _aiInput = '';
      });
    }
  }

  String _generateAIResponse(String userInput) {
    final input = userInput.toLowerCase();
    
    if (input.contains('feature') || input.contains('help') || input.contains('what')) {
      return "Our app has many great features! You can browse profiles, send messages, join groups, and more. What specific feature would you like to know about?";
    } else if (input.contains('message') || input.contains('chat')) {
      return "You can send messages to anyone you're connected with. Just tap on their conversation and type your message!";
    } else if (input.contains('profile') || input.contains('edit')) {
      return "To edit your profile, go to the profile section and tap the edit button. You can update photos, bio, and preferences.";
    } else if (input.contains('match') || input.contains('like')) {
      return "When you like someone's profile, they'll be notified. If they like you back, it's a match!";
    } else {
      return "That's an interesting question! I'm here to help you navigate our app. Feel free to ask about any features or how things work.";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          backgroundColor: const Color(0xFFFAFAFA),
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            leading: Container(
              margin: const EdgeInsets.all(8),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(20)),
                boxShadow: [
                  BoxShadow(
                    color: Color(0x1A000000),
                    blurRadius: 8,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.black),
                onPressed: _activeChat != null 
                    ? () => setState(() => _activeChat = null) 
                    : () => context.go('/'),
                iconSize: 20,
                padding: const EdgeInsets.all(8),
              ),
            ),
            title: _activeChat != null 
                ? _activeChat.toString().startsWith('channel_')
                    ? Row(
                        children: [
                          Container(
                            width: 32,
                            height: 32,
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                colors: [Color(0xFF667EEA), Color(0xFF764BA2)],
                              ),
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child: Text(
                                _activeChat.toString().replaceFirst('channel_', '')[0].toUpperCase(),
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Text(
                            _activeChat.toString().replaceFirst('channel_', ''),
                            style: const TextStyle(
                              color: Color(0xFF262626),
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      )
                    : Row(
                    children: [
                      Container(
                        width: 32,
                        height: 32,
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [Color(0xFF667EEA), Color(0xFF764BA2)],
                          ),
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Text(
                            _activeChat.toString().startsWith('group_')
                                ? _activeChat.toString().replaceFirst('group_', '')[0].toUpperCase()
                                : (_getActiveConversation()?['name'] ?? 'U')[0].toUpperCase(),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Text(
                        _activeChat.toString().startsWith('group_')
                            ? _activeChat.toString().replaceFirst('group_', '')
                            : _getActiveConversation()?['name'] ?? '',
                        style: const TextStyle(
                          color: Color(0xFF262626),
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  )
                : const Text(
                    'Messages',
                    style: TextStyle(
                      color: Color(0xFF262626),
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
            actions: [
              if (_activeChat != null && _activeChat.toString().startsWith('channel_')) ...[
                // Channel actions: search, more options
                IconButton(
                  onPressed: () {
                    // Search in channel
                    print('Search in channel');
                  },
                  icon: const Icon(Icons.search, color: Color(0xFF667EEA)),
                ),
                PopupMenuButton<String>(
                  icon: const Icon(Icons.more_vert, color: Color(0xFF667EEA)),
                  onSelected: (value) {
                    if (value == 'mute') {
                      // Toggle mute/unmute
                      print('Toggle mute for channel');
                    } else if (value == 'follow') {
                      // Toggle follow/unfollow
                      print('Toggle follow for channel');
                    } else if (value == 'report') {
                      // Report channel
                      print('Report channel');
                    }
                  },
                  itemBuilder: (BuildContext context) => [
                    const PopupMenuItem<String>(
                      value: 'mute',
                      child: Row(
                        children: [
                          Icon(Icons.notifications_off, color: Color(0xFF667EEA)),
                          SizedBox(width: 12),
                          Text('Mute notifications'),
                        ],
                      ),
                    ),
                    const PopupMenuItem<String>(
                      value: 'follow',
                      child: Row(
                        children: [
                          Icon(Icons.person_add, color: Color(0xFF667EEA)),
                          SizedBox(width: 12),
                          Text('Follow channel'),
                        ],
                      ),
                    ),
                    const PopupMenuItem<String>(
                      value: 'report',
                      child: Row(
                        children: [
                          Icon(Icons.report, color: Color(0xFFDC2626)),
                          SizedBox(width: 12),
                          Text('Report channel'),
                        ],
                      ),
                    ),
                  ],
                ),
              ] else if (_activeChat != null) ...[
                // Individual/Group chat actions: call and video call
                IconButton(onPressed: () {}, icon: const Icon(Icons.call, color: Color(0xFF667EEA))),
                IconButton(onPressed: () {}, icon: const Icon(Icons.video_call, color: Color(0xFF667EEA))),
              ] else ...[
                PopupMenuButton<String>(
                  icon: const Icon(Icons.more_horiz, color: Color(0xFF262626)),
                  onSelected: (value) {
                    if (value == 'select_contact') {
                      // Handle select contact
                      print('Select Contact tapped');
                    } else if (value == 'create_group') {
                      // Handle create group
                      print('Create Group tapped');
                    } else if (value == 'create_channel') {
                      // Handle create channel
                      print('Create Channel tapped');
                    }
                  },
                  itemBuilder: (BuildContext context) => [
                    const PopupMenuItem<String>(
                      value: 'select_contact',
                      child: Row(
                        children: [
                          Icon(Icons.person_add, color: Color(0xFF667EEA)),
                          SizedBox(width: 12),
                          Text('Select Contact'),
                        ],
                      ),
                    ),
                    const PopupMenuItem<String>(
                      value: 'create_group',
                      child: Row(
                        children: [
                          Icon(Icons.group_add, color: Color(0xFF667EEA)),
                          SizedBox(width: 12),
                          Text('Create Group'),
                        ],
                      ),
                    ),
                    const PopupMenuItem<String>(
                      value: 'create_channel',
                      child: Row(
                        children: [
                          Icon(Icons.campaign, color: Color(0xFF667EEA)),
                          SizedBox(width: 12),
                          Text('Create Channel'),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ],
          ),
          body: Column(
            children: [
              if (_activeChat == null) ...[
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
                        hintText: 'Search messages...',
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                        prefixIcon: Icon(Icons.search, color: Color(0xFF8E8E8E), size: 16),
                      ),
                    ),
                  ),
                ),

                // Tab Navigation
                Row(
                  children: [
                    _buildTab('conversations', 'Messages'),
                    _buildTab('groups', 'Groups', badge: 1),
                    _buildTab('requests', 'Requests', badge: 2),
                    _buildTab('channels', 'Channels', badge: 3),
                  ],
                ),

                // Content based on active tab
                Expanded(
                  child: _activeTab == 'conversations' 
                      ? _buildConversationsList()
                      : _activeTab == 'groups'
                          ? _buildGroupsList()
                          : _activeTab == 'requests'
                              ? _buildRequestsList()
                              : _buildChannelsList(),
                ),
              ] else ...[
                // Check if it's a group chat, individual chat, or channel
                if (_activeChat.toString().startsWith('group_')) ...[
                  // Group Chat Messages
                  Expanded(child: _buildGroupChatMessages()),
                  // Group Message Input
                  _buildGroupMessageInput(),
                ] else if (_activeChat.toString().startsWith('channel_')) ...[
                  // Channel Messages (Read-only)
                  Expanded(child: _buildChannelMessages()),
                  // No input area for channels
                ] else ...[
                  // Individual Chat Messages
                  Expanded(child: _buildChatMessages()),
                  // Message Input
                  _buildMessageInput(),
                ],
              ],
            
            
            ],
          ),
        ),
        
        // AI Chat Interface
        if (_showAIChat) ...[
          Positioned.fill(
            child: Container(
              constraints: const BoxConstraints.expand(),
              child: Scaffold(
                resizeToAvoidBottomInset: true,
                body: _buildAIChatInterface(),
              ),
            ),
          ),
        ],
        
        // Floating AI Chat Button
        if (_activeChat == null && _activeTab != 'channels') ...[
          _buildFloatingAIChatButton(),
        ],
      ],
    );
  }

  Widget _buildGroupChatMessages() {
    // Mock group chat messages
    final groupMessages = [
      {
        'sender': 'Emma',
        'text': 'Welcome to the community!',
        'time': '2h ago',
        'isMe': false,
      },
      {
        'sender': 'You',
        'text': 'Thanks everyone!',
        'time': '1h ago',
        'isMe': true,
      },
      {
        'sender': 'Mia',
        'text': 'Great to have you here!',
        'time': '30m ago',
        'isMe': false,
      },
      {
        'sender': 'John',
        'text': 'This is going to be fun!',
        'time': '15m ago',
        'isMe': false,
      },
      {
        'sender': 'You',
        'text': 'Absolutely! Looking forward to it.',
        'time': '10m ago',
        'isMe': true,
      },
    ];

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: groupMessages.length,
      itemBuilder: (context, index) {
        final message = groupMessages[index];
        return Container(
          margin: const EdgeInsets.only(bottom: 12),
          child: Row(
            mainAxisAlignment: message['isMe'] as bool ? MainAxisAlignment.end : MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (!(message['isMe'] as bool)) ...[
                Container(
                  width: 32,
                  height: 32,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0xFF667EEA), Color(0xFF764BA2)],
                    ),
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text(
                      (message['sender'] as String)[0].toUpperCase(),
                      style: const TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
              ],
              Flexible(
                child: Container(
                  constraints: const BoxConstraints(maxWidth: 250),
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: message['isMe'] as bool ? const Color(0xFF667EEA) : const Color(0xFFF0F0F0),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (!(message['isMe'] as bool)) ...[
                        Text(
                          message['sender'] as String,
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF667EEA),
                          ),
                        ),
                        const SizedBox(height: 4),
                      ],
                      Text(
                        message['text'] as String,
                        style: TextStyle(
                          fontSize: 14,
                          color: message['isMe'] as bool ? Colors.white : const Color(0xFF333333),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        message['time'] as String,
                        style: TextStyle(
                          fontSize: 11,
                          color: message['isMe'] as bool ? Colors.white.withValues(alpha: 0.7) : const Color(0xFF6B7280),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildGroupMessageInput() {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.palette, color: Color(0xFF667EEA))),
          IconButton(onPressed: () {}, icon: const Icon(Icons.image_outlined, color: Color(0xFF667EEA))),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: const Color(0xFFDBDBDB)),
                borderRadius: BorderRadius.circular(20),
              ),
              child: TextField(
                onChanged: (value) => setState(() => _message = value),
                decoration: const InputDecoration(
                  hintText: 'Message...',
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                ),
              ),
            ),
          ),
          // Voice button after input field
          IconButton(
            onPressed: () {
              setState(() {
                _isVoiceActive = !_isVoiceActive;
              });
            },
            icon: Icon(
              Icons.mic,
              color: _isVoiceActive ? const Color(0xFF667EEA) : const Color(0xFF262626),
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: _message.trim().isNotEmpty ? const Color(0xFF667EEA) : const Color(0xFFDBDBDB),
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.send, color: Colors.white, size: 18),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTab(String tab, String label, {int? badge}) {
    final isActive = _activeTab == tab;
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() => _activeTab = tab);
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12),
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

  Widget _buildConversationsList() {
    final filteredConversations = _conversations.where((conv) {
      if (_searchQuery.isEmpty) return true;
      return conv['name'].toLowerCase().contains(_searchQuery.toLowerCase());
    }).toList();

    if (filteredConversations.isEmpty) {
      return const Center(
        child: Padding(
          padding: EdgeInsets.all(60),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.favorite_outline, size: 64, color: Color(0xFF9CA3AF)),
              SizedBox(height: 16),
              Text('No conversations yet', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Color(0xFF374151))),
              SizedBox(height: 8),
              Text('Start connecting with people to see your messages here', style: TextStyle(fontSize: 14, color: Color(0xFF6B7280)), textAlign: TextAlign.center),
            ],
          ),
        ),
      );
    }

    return ListView.builder(
      itemCount: filteredConversations.length,
      itemBuilder: (context, index) {
        final conversation = filteredConversations[index];
        return _buildConversationItem(conversation);
      },
    );
  }

  Widget _buildGroupsList() {
    final groups = [
      {
        'name': 'Omify Community',
        'members': 'You, Emma, Mia and 12 others',
        'unread': 3,
        'lastMessage': 'Welcome to the community!',
        'time': '2h ago',
        'avatar': 'O',
        'color': const Color(0xFF667EEA),
      },
      {
        'name': 'Dating Tips & Advice',
        'members': 'You, Sarah, Alex and 8 others',
        'unread': 1,
        'lastMessage': 'Great advice everyone!',
        'time': '5h ago',
        'avatar': 'D',
        'color': const Color(0xFF667EEA),
      },
      {
        'name': 'Movie Lovers',
        'members': 'You, John, Lisa and 15 others',
        'unread': 0,
        'lastMessage': 'New movie coming out this weekend!',
        'time': '1d ago',
        'avatar': 'M',
        'color': const Color(0xFF667EEA),
      },
      {
        'name': 'Tech Enthusiasts',
        'members': 'You, David, Rachel and 22 others',
        'unread': 0,
        'lastMessage': 'Latest tech updates are amazing!',
        'time': '2d ago',
        'avatar': 'T',
        'color': const Color(0xFF667EEA),
      },
    ];

    return ListView.builder(
      itemCount: groups.length,
      itemBuilder: (context, index) {
        final group = groups[index];
        return Container(
          color: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Row(
            children: [
              // Group profile picture - taps to group details
              GestureDetector(
                onTap: () {
                  // Navigate to group details page
                  final groupName = group['name'] as String;
                  context.go('/group/${groupName.toLowerCase().replaceAll(' ', '-')}?name=${Uri.encodeComponent(groupName)}');
                },
                child: Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        (group['color'] as Color).withOpacity(0.9),
                        (group['color'] as Color).withOpacity(0.7),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text(
                      group['avatar'] as String,
                      style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ),
                const SizedBox(width: 12),
                // Conversation area - taps to open group chat
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      // Open group chat
                      setState(() => _activeChat = 'group_${group['name']}');
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          group['name'] as String,
                          style: const TextStyle(
                            fontSize: 17, 
                            fontWeight: FontWeight.w700, 
                            color: Color(0xFF1F2937),
                            letterSpacing: 0.2,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          group['lastMessage'] as String,
                          style: const TextStyle(
                            fontSize: 15, 
                            color: Color(0xFF1F2937), 
                            fontWeight: FontWeight.w400
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                // Right side: time and unread count
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      group['time'] as String,
                      style: const TextStyle(
                        fontSize: 13, 
                        color: Color(0xFF9CA3AF), 
                        fontWeight: FontWeight.w500
                      ),
                    ),
                    const SizedBox(height: 12),
                    if ((group['unread'] as int) > 0) ...[
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: const Color(0xFF667EEA),
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xFF667EEA).withValues(alpha: 0.3),
                              blurRadius: 6,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Text(
                          group['unread'].toString(),
                          style: const TextStyle(
                            color: Colors.white, 
                            fontSize: 12, 
                            fontWeight: FontWeight.w700
                          ),
                        ),
                      ),
                    ],
                  ],
                ),
              ],
            ),
          );
        },
  
    );
    
  }

  Widget _buildRequestsList() {
    final requests = [
      {
        'name': 'Sarah Wilson',
        'avatar': 'https://images.unsplash.com/photo-1534528741775-53994a69daeb?w=150&h=150&fit=crop&crop=face',
        'message': 'Wants to send you a message',
        'time': '2h ago',
        'mutualFriends': '3 mutual friends',
      },
      {
        'name': 'Alex Chen',
        'avatar': 'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=150&h=150&fit=crop&crop=face',
        'message': 'Would like to connect with you',
        'time': '5h ago',
        'mutualFriends': '5 mutual friends',
      },
      {
        'name': 'Emma Rodriguez',
        'avatar': 'https://images.unsplash.com/photo-1494790108755-2616b612b786?w=150&h=150&fit=crop&crop=face',
        'message': 'Interested in your profile',
        'time': '1d ago',
        'mutualFriends': '2 mutual friends',
      },
      {
        'name': 'Michael Brown',
        'avatar': 'https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?w=150&h=150&fit=crop&crop=face',
        'message': 'Saw you at the coffee shop',
        'time': '2d ago',
        'mutualFriends': '1 mutual friend',
      },
    ];

    return ListView.builder(
      itemCount: requests.length,
      itemBuilder: (context, index) {
        final request = requests[index];
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
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: NetworkImage(request['avatar'] as String),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              request['name'] as String,
                              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Color(0xFF262626)),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Text(
                            request['time'] as String,
                            style: const TextStyle(fontSize: 12, color: Color(0xFF8E8E8E), fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Text(
                        request['message'] as String,
                        style: const TextStyle(fontSize: 14, color: Color(0xFF6B7280)),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        request['mutualFriends'] as String,
                        style: const TextStyle(fontSize: 12, color: Color(0xFF667EEA), fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        // Accept request logic
                      },
                      child: Container(
                        width: 32,
                        height: 32,
                        decoration: const BoxDecoration(
                          color: Color(0xFF667EEA),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(Icons.check, color: Colors.white, size: 16),
                      ),
                    ),
                    const SizedBox(height: 8),
                    GestureDetector(
                      onTap: () {
                        // Decline request logic
                      },
                      child: Container(
                        width: 32,
                        height: 32,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(Icons.close, color: Color(0xFF6B7280), size: 16),
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
  }

  Widget _buildChannelsList() {
    final followedChannels = [
      {
        'name': 'Tech News Daily',
        'description': 'Latest technology updates and innovations',
        'subscribers': '12.5K',
        'lastPost': 'New AI breakthrough announced!',
        'time': '1h ago',
        'avatar': 'T',
        'color': const Color(0xFF667EEA),
        'verified': true,
        'isFollowed': true,
        'unread': 3,
      },
      {
        'name': 'Travel Adventures',
        'description': 'Explore the world through amazing stories',
        'subscribers': '8.2K',
        'lastPost': 'Hidden beaches in Bali you must visit',
        'time': '3h ago',
        'avatar': 'T',
        'color': const Color(0xFF10B981),
        'verified': false,
        'isFollowed': true,
        'unread': 2,
      },
      {
        'name': 'Cooking Masterclass',
        'description': 'Learn to cook like a professional chef',
        'subscribers': '15.7K',
        'lastPost': 'Easy 30-minute dinner recipes',
        'time': '5h ago',
        'avatar': 'C',
        'color': const Color(0xFFF59E0B),
        'verified': true,
        'isFollowed': true,
        'unread': 1,
      },
      {
        'name': 'Fitness Motivation',
        'description': 'Get fit and stay healthy together',
        'subscribers': '22.1K',
        'lastPost': 'Morning workout routine for beginners',
        'time': '1d ago',
        'avatar': 'F',
        'color': const Color(0xFFEF4444),
        'verified': true,
        'isFollowed': true,
        'unread': 5,
      },
    ];

    final otherChannels = [
      {
        'name': 'Gaming Universe',
        'description': 'Latest gaming news and reviews',
        'subscribers': '18.3K',
        'lastPost': 'New RPG game breaking records!',
        'time': '4h ago',
        'avatar': 'G',
        'color': const Color(0xFF8B5CF6),
        'verified': true,
        'isFollowed': false,
      },
      {
        'name': 'Science Daily',
        'description': 'Discoveries and breakthroughs in science',
        'subscribers': '9.7K',
        'lastPost': 'New planet discovered in solar system',
        'time': '6h ago',
        'avatar': 'S',
        'color': const Color(0xFF06B6D4),
        'verified': false,
        'isFollowed': false,
      },
      {
        'name': 'Business Insights',
        'description': 'Latest business trends and analysis',
        'subscribers': '14.2K',
        'lastPost': 'Market trends for 2024',
        'time': '8h ago',
        'avatar': 'B',
        'color': const Color(0xFF059669),
        'verified': true,
        'isFollowed': false,
      },
    ];

    return ListView.builder(
      itemCount: followedChannels.length + 1 + otherChannels.length, // followed + explore section + other channels
      itemBuilder: (context, index) {
        if (index == followedChannels.length) {
          // Explore section
          return Container(
            color: Colors.white,
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Explore',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF262626),
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Discover more channels and content',
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xFF6B7280),
                  ),
                ),
              ],
            ),
          );
        } else if (index < followedChannels.length) {
          // Followed channels (first 4)
          final channel = followedChannels[index];
          return GestureDetector(
          onTap: () {
            // Open channel to view content
            setState(() => _activeChat = 'channel_${channel['name']}');
          },
          child: Container(
          color: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Row(
            children: [
              // Channel avatar
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      (channel['color'] as Color).withOpacity(0.9),
                      (channel['color'] as Color).withOpacity(0.7),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    channel['avatar'] as String,
                    style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              // Channel info
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          channel['name'] as String,
                          style: const TextStyle(
                            fontSize: 17, 
                            fontWeight: FontWeight.w700, 
                            color: Color(0xFF1F2937),
                            letterSpacing: 0.2,
                          ),
                        ),
                        if (channel['verified'] as bool) ...[
                          const SizedBox(width: 4),
                          const Icon(
                            Icons.verified,
                            color: Color(0xFF667EEA),
                            size: 16,
                          ),
                        ],
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      channel['lastPost'] as String,
                      style: const TextStyle(
                        fontSize: 15, 
                        color: Color(0xFF1F2937), 
                        fontWeight: FontWeight.w400
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              // Right side: time and unread count
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    channel['time'] as String,
                    style: const TextStyle(
                      fontSize: 13, 
                      color: Color(0xFF9CA3AF), 
                      fontWeight: FontWeight.w500
                    ),
                  ),
                  const SizedBox(height: 12),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: const Color(0xFF10B981),
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFF10B981).withValues(alpha: 0.3),
                          blurRadius: 6,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Text(
                      '${(channel['unread'] ?? 0).toString()}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ));
        } else {
          // Other channels (after explore section)
          final channel = otherChannels[index - followedChannels.length - 1];
          return Container(
            color: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            child: Row(
              children: [
                // Channel avatar
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        (channel['color'] as Color).withOpacity(0.9),
                        (channel['color'] as Color).withOpacity(0.7),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text(
                      channel['avatar'] as String,
                      style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                // Channel info
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            channel['name'] as String,
                            style: const TextStyle(
                              fontSize: 17, 
                              fontWeight: FontWeight.w700, 
                              color: Color(0xFF1F2937),
                              letterSpacing: 0.2,
                            ),
                          ),
                          if (channel['verified'] as bool) ...[
                            const SizedBox(width: 4),
                            const Icon(
                              Icons.verified,
                              color: Color(0xFF667EEA),
                              size: 16,
                            ),
                          ],
                        ],
                      ),
                      const SizedBox(height: 8),
                      Text(
                        channel['lastPost'] as String,
                        style: const TextStyle(
                          fontSize: 15, 
                          color: Color(0xFF1F2937), 
                          fontWeight: FontWeight.w400
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        channel['time'] as String,
                        style: const TextStyle(
                          fontSize: 13, 
                          color: Color(0xFF9CA3AF), 
                          fontWeight: FontWeight.w500
                        ),
                      ),
                    ],
                  ),
                ),
                // Follow button
                const SizedBox(width: 8),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: const Color(0xFF667EEA),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: const Text(
                    'Follow',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          );
        }
      },
    );
  }

  Widget _buildChannelMessages() {
    // Mock channel messages with different content types
    final channelMessages = [
      {
        'sender': 'Tech News Daily',
        'text': '🚀 Breaking: New AI breakthrough announced! Researchers have developed a revolutionary language model that can understand context better than ever before. This could change how we interact with technology. The model, called GPT-5, shows unprecedented capabilities in reasoning, problem-solving, and creative tasks. Early tests indicate it can outperform humans in many cognitive tasks while maintaining ethical boundaries.',
        'time': '1h ago',
        'type': 'text',
        'views': '2.3K',
        'image': 'https://images.unsplash.com/photo-1677442136019-21780ecad995?w=800&h=600&fit=crop',
        'hasImage': true,
      },
      {
        'sender': 'Tech News Daily',
        'text': '📱 Apple just released iOS 17.2 with major security updates and performance improvements. Make sure to update your devices!',
        'time': '3h ago',
        'type': 'text',
        'views': '1.8K',
        'hasImage': false,
      },
      {
        'sender': 'Tech News Daily',
        'text': '💻 The future of computing: Quantum computers are getting closer to practical applications. Here\'s what you need to know about this revolutionary technology that will transform cryptography, drug discovery, and complex simulations.',
        'time': '6h ago',
        'type': 'video',
        'views': '3.1K',
        'videoThumbnail': 'https://images.unsplash.com/photo-1635070041078-e363dbe005cb?w=800&h=600&fit=crop',
        'videoDuration': '2:45',
        'hasVideo': true,
      },
      {
        'sender': 'Tech News Daily',
        'text': '🔒 Cybersecurity alert: New phishing attacks targeting tech companies. Always verify email sources and never click suspicious links. These sophisticated attacks use AI-generated content to bypass traditional detection methods.',
        'time': '1d ago',
        'type': 'text',
        'views': '4.2K',
        'hasImage': false,
      },
      {
        'sender': 'Tech News Daily',
        'text': '🌐 Web3 revolution: How blockchain technology is reshaping the internet. From DeFi to NFTs, the future is decentralized. This comprehensive guide covers everything from smart contracts to decentralized autonomous organizations (DAOs) and the metaverse.',
        'time': '2d ago',
        'type': 'text',
        'views': '5.7K',
        'image': 'https://images.unsplash.com/photo-1639762681485-074b7f938ba0?w=800&h=600&fit=crop',
        'hasImage': true,
      },
    ];

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: channelMessages.length,
      itemBuilder: (context, index) {
        final message = channelMessages[index];
        return Container(
          margin: const EdgeInsets.only(bottom: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Channel header
              Row(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Color(0xFF667EEA), Color(0xFF764BA2)],
                      ),
                      shape: BoxShape.circle,
                    ),
                    child: const Center(
                      child: Text(
                        'T',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
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
                              message['sender'] as String,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF262626),
                              ),
                            ),
                            const SizedBox(width: 8),
                            const Icon(
                              Icons.verified,
                              color: Color(0xFF667EEA),
                              size: 16,
                            ),
                          ],
                        ),
                        Text(
                          message['time'] as String,
                          style: const TextStyle(
                            fontSize: 12,
                            color: Color(0xFF9CA3AF),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              // Message content container
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: const Color(0xFFE5E7EB),
                    width: 1,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.05),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Text content with expandable functionality
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: _buildExpandableText(message['text'] as String),
                    ),
                    // Media content (image or video)
                    if (message['hasImage'] == true) ...[
                      const Divider(height: 1, color: Color(0xFFE5E7EB)),
                      _buildImageContent(message['image'] as String),
                    ] else if (message['hasVideo'] == true) ...[
                      const Divider(height: 1, color: Color(0xFFE5E7EB)),
                      _buildVideoContent(
                        message['videoThumbnail'] as String,
                        message['videoDuration'] as String,
                      ),
                    ],
                  ],
                ),
              ),
              const SizedBox(height: 8),
              // Message stats (views, no reply option)
              Row(
                children: [
                  Icon(
                    Icons.remove_red_eye,
                    size: 16,
                    color: Colors.grey.shade600,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    '${message['views']} views',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey.shade600,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    'No replies',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey.shade500,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildExpandableText(String text) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final TextSpan textSpan = TextSpan(
          text: text,
          style: const TextStyle(
            fontSize: 15,
            color: Color(0xFF262626),
            height: 1.4,
          ),
        );
        
        final TextPainter textPainter = TextPainter(
          text: textSpan,
          textDirection: TextDirection.ltr,
          maxLines: 3,
        );
        textPainter.layout(maxWidth: constraints.maxWidth - 32); // Account for padding
        
        if (textPainter.didExceedMaxLines) {
          return StatefulBuilder(
            builder: (context, setState) {
              bool isExpanded = false;
              
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    text,
                    style: const TextStyle(
                      fontSize: 15,
                      color: Color(0xFF262626),
                      height: 1.4,
                    ),
                    maxLines: isExpanded ? null : 3,
                    overflow: isExpanded ? null : TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isExpanded = !isExpanded;
                      });
                    },
                    child: Text(
                      isExpanded ? 'Show less' : 'Read more',
                      style: const TextStyle(
                        color: Color(0xFF667EEA),
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              );
            },
          );
        } else {
          return Text(
            text,
            style: const TextStyle(
              fontSize: 15,
              color: Color(0xFF262626),
              height: 1.4,
            ),
          );
        }
      },
    );
  }

  Widget _buildImageContent(String imageUrl) {
    return Container(
      width: double.infinity,
      height: 200,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(16),
          bottomRight: Radius.circular(16),
        ),
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(16),
          bottomRight: Radius.circular(16),
        ),
        child: Image.network(
          imageUrl,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            return Container(
              color: const Color(0xFFF3F4F6),
              child: const Icon(
                Icons.image_not_supported,
                color: Color(0xFF9CA3AF),
                size: 48,
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildVideoContent(String thumbnailUrl, String duration) {
    return Container(
      width: double.infinity,
      height: 200,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(16),
          bottomRight: Radius.circular(16),
        ),
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(16),
          bottomRight: Radius.circular(16),
        ),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.network(
              thumbnailUrl,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  color: const Color(0xFFF3F4F6),
                  child: const Icon(
                    Icons.videocam_off,
                    color: Color(0xFF9CA3AF),
                    size: 48,
                  ),
                );
              },
            ),
            // Play button overlay
            Center(
              child: Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.black.withValues(alpha: 0.7),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.play_arrow,
                  color: Colors.white,
                  size: 30,
                ),
              ),
            ),
            // Duration badge
            Positioned(
              bottom: 12,
              right: 12,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.black.withValues(alpha: 0.8),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  duration,
                  style: const TextStyle(
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
    );
  }

  Widget _buildConversationItem(Map<String, dynamic> conversation) {
    return GestureDetector(
      onTap: () => setState(() => _activeChat = conversation['id']),
      child: Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Row(
            children: [
              Container(
                margin: const EdgeInsets.only(right: 16),
                child: Stack(
                  children: [
                    Container(
                      width: 52,
                      height: 52,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: NetworkImage(conversation['avatar']), 
                          fit: BoxFit.cover
                        ),
                      ),
                    ),
                    if (conversation['online'])
                      Positioned(
                        bottom: 2,
                        right: 2,
                        child: Container(
                          width: 14,
                          height: 14,
                          decoration: BoxDecoration(
                            color: const Color(0xFF22C55E),
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white, width: 2.5),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withValues(alpha: 0.1),
                                blurRadius: 4,
                                offset: const Offset(0, 1),
                              ),
                            ],
                          ),
                        ),
                      ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          conversation['name'], 
                          style: const TextStyle(
                            fontSize: 16, 
                            fontWeight: FontWeight.w600, 
                            color: Color(0xFF262626),
                          )
                        ),
                        Text(
                          conversation['time'], 
                          style: const TextStyle(
                            fontSize: 12, 
                            color: Color(0xFF8E8E8E), 
                            fontWeight: FontWeight.w500
                          )
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Expanded(
                          child: conversation['isTyping'] 
                              ? const Text(
                                  'typing...', 
                                  style: TextStyle(
                                    fontSize: 15, 
                                    color: Color(0xFF667EEA), 
                                    fontStyle: FontStyle.italic, 
                                    fontWeight: FontWeight.w600
                                  )
                                )
                              : Text(
                                  conversation['lastMessage'], 
                                  style: const TextStyle(
                                    fontSize: 14, 
                                    color: Color(0xFF262626),
                                  ), 
                                  maxLines: 1, 
                                  overflow: TextOverflow.ellipsis
                                ),
                        ),
                        if (conversation['unread'] > 0) ...[
                          const SizedBox(width: 12),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              color: const Color(0xFF667EEA),
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: const Color(0xFF667EEA).withValues(alpha: 0.3),
                                  blurRadius: 6,
                                  offset: const Offset(0, 2),
                                ),
                              ],
                            ),
                            child: Text(
                              conversation['unread'].toString(), 
                              style: const TextStyle(
                                color: Colors.white, 
                                fontSize: 11, 
                                fontWeight: FontWeight.w600
                              )
                            ),
                          ),
                        ],
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

  Widget _buildChatMessages() {
    final chatMessages = _messages[_activeChat] ?? [];
    
    if (chatMessages.isEmpty) {
      return const Center(child: Text('No messages yet', style: TextStyle(fontSize: 16, color: Color(0xFF6B7280))));
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: chatMessages.length,
      itemBuilder: (context, index) {
        final message = chatMessages[index];
        return _buildChatMessage(message);
      },
    );
  }

  Widget _buildChatMessage(Map<String, dynamic> message) {
    final isMe = message['sender'] == 'me';
    
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      child: Row(
        mainAxisAlignment: isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          if (!isMe) ...[
            Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(image: NetworkImage(_getActiveConversation()?['avatar'] ?? ''), fit: BoxFit.cover),
              ),
            ),
            const SizedBox(width: 8),
          ],
          
          Flexible(
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: isMe ? const Color(0xFF667EEA) : Colors.white,
                borderRadius: BorderRadius.circular(18),
                boxShadow: const [BoxShadow(color: Color(0x1A000000), blurRadius: 2, offset: Offset(0, 1))],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    message['text'], 
                    style: TextStyle(
                      fontSize: 15, 
                      color: isMe ? Colors.white : const Color(0xFF262626),
                      height: 1.4,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        message['time'], 
                        style: TextStyle(
                          fontSize: 12, 
                          color: isMe ? Colors.white.withOpacity(0.7) : const Color(0xFF9CA3AF),
                        ),
                      ),
                      if (isMe) ...[
                        const SizedBox(width: 4),
                        Text(
                          message['status'] == 'read' ? '✓✓' : '✓', 
                          style: TextStyle(
                            fontSize: 12, 
                            color: Colors.white.withOpacity(0.7),
                          ),
                        ),
                      ],
                    ],
                  ),
                ],
              ),
            ),
          ),
          
          if (isMe) ...[
            const SizedBox(width: 8),
            Container(
              width: 32,
              height: 32,
              decoration: const BoxDecoration(color: Color(0xFFE5E7EB), shape: BoxShape.circle),
              child: const Icon(Icons.person, color: Color(0xFF6B7280), size: 16),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildMessageInput() {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.palette, color: Color(0xFF667EEA))),
          IconButton(onPressed: () {}, icon: const Icon(Icons.image_outlined, color: Color(0xFF667EEA))),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: const Color(0xFFDBDBDB)),
                borderRadius: BorderRadius.circular(20),
              ),
              child: TextField(
                onChanged: (value) => setState(() => _message = value),
                decoration: const InputDecoration(
                  hintText: 'Message...',
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                ),
              ),
            ),
          ),
          IconButton(
            onPressed: () {
              setState(() {
                _isVoiceActive = !_isVoiceActive;
              });
            },
            icon: Icon(
              Icons.mic,
              color: _isVoiceActive ? const Color(0xFF667EEA) : const Color(0xFF262626),
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: _message.trim().isNotEmpty ? const Color(0xFF667EEA) : const Color(0xFFDBDBDB),
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.send, color: Colors.white, size: 18),
            ),
          ),
        ],
      ),
    );
  }

    Widget _buildAIChatInterface() {
    return Material(
      color: Colors.white,
      child: Scaffold(
        backgroundColor: Colors.white,
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
              onPressed: () => setState(() => _showAIChat = false),
              iconSize: 20,
              padding: const EdgeInsets.all(8),
            ),
          ),
          title: Row(
            children: [
              Container(
                width: 32,
                height: 32,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFF667EEA), Color(0xFF764BA2)],
                  ),
                  shape: BoxShape.circle,
                ),
                child: const Center(
                  child: Icon(
                    Icons.smart_toy,
                    color: Colors.white,
                    size: 16,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              const Text(
                'Omify AI',
                style: TextStyle(
                  color: Color(0xFF262626),
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          actions: [
            PopupMenuButton<String>(
              icon: const Icon(Icons.more_horiz, color: Color(0xFF262626)),
              onSelected: (value) {
                if (value == 'select_contact') {
                  // Handle select contact
                  print('Select Contact tapped');
                } else if (value == 'create_group') {
                  // Handle create group
                  print('Create Group tapped');
                }
              },
              itemBuilder: (BuildContext context) => [
                const PopupMenuItem<String>(
                  value: 'select_contact',
                  child: Row(
                    children: [
                      Icon(Icons.person_add, color: Color(0xFF667EEA)),
                      SizedBox(width: 12),
                      Text('Select Contact'),
                    ],
                  ),
                ),
                const PopupMenuItem<String>(
                  value: 'create_group',
                  child: Row(
                    children: [
                      Icon(Icons.group_add, color: Color(0xFF667EEA)),
                      SizedBox(width: 12),
                      Text('Create Group'),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
        body: Column(
          children: [
            
            // AI Chat Messages
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: _aiMessages.length,
                itemBuilder: (context, index) {
                  final message = _aiMessages[index];
                  final isUser = message['sender'] == 'user';
                  
                  return Container(
                    margin: const EdgeInsets.only(bottom: 12),
                    child: Row(
                      mainAxisAlignment: isUser ? MainAxisAlignment.end : MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (!isUser) ...[
                          Container(
                            width: 32,
                            height: 32,
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                colors: [Color(0xFF667EEA), Color(0xFF764BA2)],
                              ),
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(Icons.smart_toy, color: Colors.white, size: 16),
                          ),
                          const SizedBox(width: 8),
                        ],
                        
                        Flexible(
                          child: Container(
                            constraints: const BoxConstraints(maxWidth: 250),
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: isUser ? const Color(0xFF667EEA) : const Color(0xFFF0F0F0),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Text(
                              message['text'],
                              style: TextStyle(
                                fontSize: 14,
                                color: isUser ? Colors.white : const Color(0xFF333333),
                              ),
                            ),
                          ),
                        ),
                        
                        if (isUser) ...[
                          const SizedBox(width: 8),
                          Container(
                            width: 32,
                            height: 32,
                            decoration: const BoxDecoration(
                              color: Color(0xFFE5E7EB),
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(Icons.person, color: Color(0xFF6B7280), size: 16),
                          ),
                        ],
                      ],
                    ),
                  );
                },
              ),
            ),
            
            // AI Chat Input
            Container(
              padding: const EdgeInsets.all(16),
              decoration: const BoxDecoration(
                border: Border(top: BorderSide(color: Color(0xFFE5E7EB))),
              ),
              child: Row(
                children: [
                  IconButton(onPressed: () {}, icon: const Icon(Icons.palette, color: Color(0xFF667EEA))),
                  IconButton(onPressed: () {}, icon: const Icon(Icons.image_outlined, color: Color(0xFF667EEA))),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: const Color(0xFFDBDBDB)),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: TextField(
                        onChanged: (value) => setState(() => _aiInput = value),
                        onSubmitted: (_) => _handleAISendMessage(),
                        decoration: const InputDecoration(
                          hintText: 'Ask about app features...',
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                        ),
                      ),
                    ),
                  ),
                  // Voice button after input field
                  IconButton(
                    onPressed: () {
                      setState(() {
                        _isVoiceActive = !_isVoiceActive;
                      });
                    },
                    icon: Icon(
                      Icons.mic,
                      color: _isVoiceActive ? const Color(0xFF667EEA) : const Color(0xFF262626),
                    ),
                  ),
                  const SizedBox(width: 8),
                  GestureDetector(
                    onTap: _handleAISendMessage,
                    child: Container(
                      width: 32,
                      height: 32,
                      decoration: BoxDecoration(
                        color: _aiInput.trim().isNotEmpty ? const Color(0xFF667EEA) : const Color(0xFFDBDBDB),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.send, color: Colors.white, size: 16),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFloatingAIChatButton() {
    return Positioned(
      bottom: 100,
      right: 20,
      child: GestureDetector(
        onTap: () => setState(() => _showAIChat = true),
        child: Container(
          width: 56,
          height: 56,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF667EEA), Color(0xFF764BA2)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Color(0x33000000),
                blurRadius: 16,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: const Icon(Icons.chat_bubble, color: Colors.white, size: 24),
        ),
      ),
    );
  }
}
