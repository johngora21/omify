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
    return _conversations.firstWhere((conv) => conv['id'] == _activeChat);
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
          body: SafeArea(
            child: Column(
              children: [
                if (_activeChat == null) ...[
                  // Header for Messages list
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
                          child: Text('Messages', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: Color(0xFF1A1A1A))),
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
                ] else ...[
                  // Header for active chat - Instagram style
                  Container(
                    color: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    child: Row(
                      children: [
                        // Back Arrow
                        GestureDetector(
                          onTap: () => setState(() => _activeChat = null),
                          child: const Icon(Icons.arrow_back, size: 24, color: Color(0xFF262626)),
                        ),
                        
                        const SizedBox(width: 12),
                        
                        // Profile Avatar
                        Container(
                          width: 32,
                          height: 32,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: NetworkImage(_getActiveConversation()?['avatar'] ?? ''),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        
                        const SizedBox(width: 12),
                        
                        // Profile Info
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                _getActiveConversation()?['name'] ?? 'Chat',
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFF262626),
                                ),
                              ),
                              if (_getActiveConversation()?['online'] == true)
                                const Text(
                                  'Active now',
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Color(0xFF8E8E8E),
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                            ],
                          ),
                        ),
                        
                        // Action Buttons
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {},
                              child: const Icon(Icons.video_call, size: 24, color: Color(0xFF262626)),
                            ),
                            const SizedBox(width: 16),
                            GestureDetector(
                              onTap: () {},
                              child: const Icon(Icons.call, size: 24, color: Color(0xFF262626)),
                            ),
                            const SizedBox(width: 16),
                            GestureDetector(
                              onTap: () {},
                              child: const Icon(Icons.more_horiz, size: 24, color: Color(0xFF262626)),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
                
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

                  // Tab Navigation - Horizontal scrolling
                  Container(
                    color: Colors.white,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        children: [
                          _buildTab('conversations', 'Messages'),
                          const SizedBox(width: 8),
                          _buildTab('groups', 'Groups', badge: 1),
                          const SizedBox(width: 8),
                          _buildTab('requests', 'Requests', badge: 2),
                        ],
                      ),
                    ),
                  ),

                  // Content based on active tab
                  Expanded(
                    child: _activeTab == 'conversations' 
                        ? _buildConversationsList()
                        : _activeTab == 'groups'
                            ? _buildGroupsList()
                            : _buildRequestsList(),
                  ),
                ] else ...[
                  // Chat Messages
                  Expanded(child: _buildChatMessages()),
                  // Message Input
                  _buildMessageInput(),
                ],
              ],
            ),
          ),
        ),
        
        // AI Chat Interface
        if (_showAIChat) 
          Positioned.fill(
            child: Container(
              constraints: const BoxConstraints.expand(),
              child: Scaffold(
                resizeToAvoidBottomInset: true,
                body: _buildAIChatInterface(),
              ),
            ),
          ),
        
        // Floating AI Chat Button
        if (_activeChat == null) _buildFloatingAIChatButton(),
      ],
    );
  }

  Widget _buildTab(String id, String label, {int? badge}) {
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
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(label, style: TextStyle(color: isActive ? Colors.white : const Color(0xFF6B7280), fontSize: 16, fontWeight: FontWeight.w700)),
            if (badge != null) ...[
              const SizedBox(width: 6),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                  color: isActive ? Colors.white.withOpacity(0.2) : const Color(0xFF0095F6),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(badge.toString(), style: TextStyle(color: isActive ? Colors.white : Colors.white, fontSize: 12, fontWeight: FontWeight.w600)),
              ),
            ],
          ],
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
        'color': const Color(0xFF4CAF50),
      },
      {
        'name': 'Movie Lovers',
        'members': 'You, John, Lisa and 15 others',
        'unread': 0,
        'lastMessage': 'New movie coming out this weekend!',
        'time': '1d ago',
        'avatar': 'M',
        'color': const Color(0xFFE91E63),
      },
    ];

    return ListView.builder(
      itemCount: groups.length,
      itemBuilder: (context, index) {
        final group = groups[index];
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
                    gradient: LinearGradient(
                      colors: [group['color'] as Color, group['color'] as Color].map((c) => c.withOpacity(0.8)).toList(),
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
                              group['name'] as String,
                              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Color(0xFF262626)),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Text(
                            group['time'] as String,
                            style: const TextStyle(fontSize: 12, color: Color(0xFF8E8E8E), fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Text(
                        group['members'] as String,
                        style: const TextStyle(fontSize: 13, color: Color(0xFF6B7280)),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        group['lastMessage'] as String,
                        style: const TextStyle(fontSize: 14, color: Color(0xFF262626)),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                if ((group['unread'] as int) > 0) ...[
                  const SizedBox(width: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                    decoration: const BoxDecoration(color: Color(0xFF0095F6), shape: BoxShape.circle),
                    child: Text(
                      group['unread'].toString(),
                      style: const TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ],
            ),
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
                        style: const TextStyle(fontSize: 12, color: Color(0xFF0095F6), fontWeight: FontWeight.w500),
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
                          color: Color(0xFF0095F6),
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

  Widget _buildConversationItem(Map<String, dynamic> conversation) {
    return GestureDetector(
      onTap: () => setState(() => _activeChat = conversation['id']),
      child: Container(
        color: Colors.white,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            boxShadow: const [BoxShadow(color: Color(0x0D000000), blurRadius: 3, offset: Offset(0, 1))],
          ),
          child: Row(
            children: [
              Container(
                margin: const EdgeInsets.only(right: 12),
                child: Stack(
                  children: [
                    Container(
                      width: 48,
                      height: 48,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(image: NetworkImage(conversation['avatar']), fit: BoxFit.cover),
                      ),
                    ),
                    if (conversation['online'])
                      Positioned(
                        bottom: 2,
                        right: 2,
                        child: Container(
                          width: 12,
                          height: 12,
                          decoration: BoxDecoration(
                            color: const Color(0xFF22C55E),
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white, width: 2),
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
                        Text(conversation['name'], style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Color(0xFF262626))),
                        Text(conversation['time'], style: const TextStyle(fontSize: 12, color: Color(0xFF8E8E8E), fontWeight: FontWeight.w500)),
                      ],
                    ),
                    const SizedBox(height: 6),
                    Row(
                      children: [
                        Expanded(
                          child: conversation['isTyping'] 
                              ? const Text('typing...', style: TextStyle(fontSize: 14, color: Color(0xFF0095F6), fontStyle: FontStyle.italic, fontWeight: FontWeight.w500))
                              : Text(conversation['lastMessage'], style: TextStyle(fontSize: 14, color: conversation['unread'] > 0 ? const Color(0xFF262626) : const Color(0xFF6B7280), fontWeight: conversation['unread'] > 0 ? FontWeight.w500 : FontWeight.w400), maxLines: 1, overflow: TextOverflow.ellipsis),
                        ),
                        if (conversation['unread'] > 0) ...[
                          const SizedBox(width: 8),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                            decoration: const BoxDecoration(color: Color(0xFF0095F6), shape: BoxShape.circle),
                            child: Text(conversation['unread'].toString(), style: const TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.w600)),
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
                color: isMe ? const Color(0xFF0095F6) : Colors.white,
                borderRadius: BorderRadius.circular(18),
                boxShadow: const [BoxShadow(color: Color(0x1A000000), blurRadius: 2, offset: Offset(0, 1))],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(message['text'], style: TextStyle(fontSize: 14, color: isMe ? Colors.white : const Color(0xFF262626))),
                  const SizedBox(height: 4),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(message['time'], style: TextStyle(fontSize: 11, color: isMe ? Colors.white.withOpacity(0.7) : const Color(0xFF6B7280).withOpacity(0.7))),
                      if (isMe) ...[
                        const SizedBox(width: 4),
                        Text(message['status'] == 'read' ? '✓✓' : '✓', style: TextStyle(fontSize: 10, color: Colors.white.withOpacity(0.7))),
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
          IconButton(onPressed: () {}, icon: const Icon(Icons.palette, color: Color(0xFF262626))),
          IconButton(onPressed: () {}, icon: const Icon(Icons.image_outlined, color: Color(0xFF262626))),
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
          IconButton(onPressed: () {}, icon: const Icon(Icons.mic, color: Color(0xFF262626))),
          GestureDetector(
            onTap: () {},
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: _message.trim().isNotEmpty ? const Color(0xFF0095F6) : const Color(0xFFDBDBDB),
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
      child: SafeArea(
        child: Column(
          children: [
            // AI Chat Header
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF667EEA), Color(0xFF764BA2)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  const Icon(Icons.chat_bubble, color: Colors.white, size: 20),
                  const SizedBox(width: 8),
                  const Text(
                    'AI Assistant',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () => setState(() => _showAIChat = false),
                    child: const Icon(Icons.close, color: Colors.white, size: 24),
                  ),
                ],
              ),
            ),
            
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
                              color: isUser ? const Color(0xFF0095F6) : const Color(0xFFF0F0F0),
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
                  const SizedBox(width: 8),
                  GestureDetector(
                    onTap: _handleAISendMessage,
                    child: Container(
                      width: 32,
                      height: 32,
                      decoration: BoxDecoration(
                        color: _aiInput.trim().isNotEmpty ? const Color(0xFF0095F6) : const Color(0xFFDBDBDB),
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
