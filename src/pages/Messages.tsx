import { useState } from 'react';
import { useNavigate } from 'react-router-dom';
import { IoSearchOutline, IoEllipsisVertical, IoVideocam, IoCall, IoEllipsisHorizontal, IoArrowBack, IoHeartOutline, IoImageOutline, IoMicOutline, IoArrowForward, IoHappyOutline, IoColorPalette, IoChatbubble } from 'react-icons/io5';
import { BiSend } from 'react-icons/bi';

const Messages = () => {
  const navigate = useNavigate();
  const [activeChat, setActiveChat] = useState<string | null>(null);
  const [message, setMessage] = useState('');
  const [searchQuery, setSearchQuery] = useState('');
  const [activeTab, setActiveTab] = useState('conversations');
  const [showAIChat, setShowAIChat] = useState(false);
  const [aiMessages, setAiMessages] = useState([
    {
      id: 1,
      text: "Hi! I'm your AI assistant. I can help you learn about all the features in our app. What would you like to know?",
      sender: 'ai',
      time: new Date().toLocaleTimeString()
    }
  ]);
  const [aiInput, setAiInput] = useState('');

  const conversations = [
    {
      id: '1',
      name: 'Emma Thompson',
      avatar: 'https://images.unsplash.com/photo-1494790108755-2616b612b786?w=150&h=150&fit=crop&crop=face',
      lastMessage: 'Hey! How are you doing?',
      time: '2m ago',
      unread: 2,
      online: true,
      streak: 5,
      isTyping: false
    },
    {
      id: '2',
      name: 'Mia Rodriguez',
      avatar: 'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?w=150&h=150&fit=crop&crop=face',
      lastMessage: 'Thanks for the booking!',
      time: '1h ago',
      unread: 0,
      online: false,
      streak: 12,
      isTyping: true
    },
    {
      id: '3',
      name: 'Sophia Chen',
      avatar: 'https://images.unsplash.com/photo-1544005313-94ddf0286df2?w=150&h=150&fit=crop&crop=face',
      lastMessage: 'See you tomorrow!',
      time: '3h ago',
      unread: 1,
      online: true,
      streak: 8,
      isTyping: false
    },
    {
      id: '4',
      name: 'Isabella Johnson',
      avatar: 'https://images.unsplash.com/photo-1487412720507-e7ab37603c6f?w=150&h=150&fit=crop&crop=face',
      lastMessage: 'Perfect timing!',
      time: '5h ago',
      unread: 0,
      online: false,
      streak: 3,
      isTyping: false
    }
  ];

  const messages = {
    '1': [
      { id: 1, text: 'Hey! How are you doing?', sender: 'them', time: '2:30 PM', status: 'read' },
      { id: 2, text: 'I\'m good, thanks! How about you?', sender: 'me', time: '2:31 PM', status: 'read' },
      { id: 3, text: 'Great! Are you available this weekend?', sender: 'them', time: '2:32 PM', status: 'read' },
      { id: 4, text: 'Yes, I have some free time. What did you have in mind?', sender: 'me', time: '2:33 PM', status: 'sent' }
    ],
    '2': [
      { id: 1, text: 'Thanks for the booking!', sender: 'them', time: '1:15 PM', status: 'read' },
      { id: 2, text: 'You\'re welcome! Looking forward to it.', sender: 'me', time: '1:16 PM', status: 'read' },
      { id: 3, text: 'Can\'t wait to meet you! 😊', sender: 'them', time: '1:17 PM', status: 'read' }
    ]
  };

  const handleSendMessage = () => {
    if (message.trim() && activeChat) {
      // In a real app, this would send the message to the backend
      console.log('Sending message:', message);
      setMessage('');
    }
  };

  const handleAISendMessage = () => {
    if (aiInput.trim()) {
      const userMessage = {
        id: aiMessages.length + 1,
        text: aiInput,
        sender: 'user',
        time: new Date().toLocaleTimeString()
      };
      
      setAiMessages(prev => [...prev, userMessage]);
      setAiInput('');

      // Simulate AI response
      setTimeout(() => {
        const aiResponse = generateAIResponse(aiInput);
        const aiMessage = {
          id: aiMessages.length + 2,
          text: aiResponse,
          sender: 'ai',
          time: new Date().toLocaleTimeString()
        };
        setAiMessages(prev => [...prev, aiMessage]);
      }, 1000);
    }
  };

  const generateAIResponse = (userInput: string) => {
    const input = userInput.toLowerCase();
    
    if (input.includes('movie') || input.includes('entertainment')) {
      return "Our Entertainment section features movies, TV shows, and live sports! You can browse trending movies, watch trailers, and save your favorites. We also have a dedicated Movies page where you can see all your saved content.";
    } else if (input.includes('dating') || input.includes('match')) {
      return "Our dating features help you find meaningful connections! Browse profiles, send messages, and discover people with similar interests. You can also use our advanced matching algorithms to find your perfect match.";
    } else if (input.includes('erotic') || input.includes('massage') || input.includes('escort')) {
      return "We offer various adult services including massage therapy, dating services, and companionship. All providers are verified and professional. You can browse by category and read detailed profiles with reviews.";
    } else if (input.includes('premium') || input.includes('subscription')) {
      return "Premium plans unlock exclusive features like unlimited messaging, HD content, live sports, and priority support. Choose from Basic ($4.99), Premium ($9.99), or VIP ($19.99) plans with monthly or yearly billing.";
    } else if (input.includes('profile') || input.includes('account')) {
      return "Your profile is your digital identity! Add photos, update your bio, and manage your privacy settings. You can also view your activity, saved items, and account preferences in the Settings section.";
    } else if (input.includes('message') || input.includes('chat')) {
      return "Messaging is a core feature! You can chat with matches, service providers, and other users. We support text, images, and voice messages. Your conversations are private and secure.";
    } else if (input.includes('notification') || input.includes('alert')) {
      return "Stay updated with smart notifications! Get alerts for new messages, matches, booking confirmations, and app updates. You can customize notification preferences in Settings.";
    } else if (input.includes('bookmark') || input.includes('save')) {
      return "Save your favorites! Bookmark movies, profiles, and content you love. Access all your saved items in the Bookmarks section. It's your personal collection of things you want to revisit.";
    } else if (input.includes('help') || input.includes('support')) {
      return "Need help? Our support team is here for you! You can contact us through the Settings page, and we also offer in-app help guides. For urgent issues, premium users get priority support.";
    } else {
      return "I'm here to help you explore all our features! You can ask me about movies, dating, premium features, profiles, messaging, notifications, bookmarks, or general app support. What would you like to know more about?";
    }
  };

  const filteredConversations = conversations.filter(conv =>
    conv.name.toLowerCase().includes(searchQuery.toLowerCase())
  );

  const getActiveConversation = () => {
    return conversations.find(c => c.id === activeChat);
  };

  return (
    <div style={{
      height: '100vh',
      display: 'flex',
      flexDirection: 'column',
      background: '#fafafa'
    }}>
      {!activeChat ? (
        /* Conversations List View */
        <>
          {/* Header */}
          <div style={{
            background: 'white',
            padding: '16px',
            position: 'relative'
          }}>
            {/* Back Arrow */}
            <button 
              onClick={() => navigate('/')}
              style={{
                position: 'absolute',
                top: '50%',
                left: '16px',
                transform: 'translateY(-50%)',
                background: 'rgba(0, 0, 0, 0.1)',
                border: 'none',
                borderRadius: '50%',
                width: '40px',
                height: '40px',
                display: 'flex',
                alignItems: 'center',
                justifyContent: 'center',
                cursor: 'pointer',
                zIndex: 10
              }}
            >
              <IoArrowBack size={20} color="#1a1a1a" />
            </button>
            
            {/* Title */}
            <div style={{
              textAlign: 'center',
              fontSize: '20px',
              fontWeight: '600',
              color: '#1a1a1a'
            }}>
              Messages
            </div>
            
            {/* Menu Button */}
            <button style={{
              position: 'absolute',
              top: '50%',
              right: '16px',
              transform: 'translateY(-50%)',
              background: 'none',
              border: 'none',
              cursor: 'pointer',
              padding: '8px',
              borderRadius: '8px',
              display: 'flex',
              alignItems: 'center',
              justifyContent: 'center'
            }}>
              <IoEllipsisHorizontal size={20} color="#262626" />
            </button>
          </div>

          {/* Search */}
          <div style={{
            padding: '16px',
            background: 'white'
          }}>
            <div style={{
              position: 'relative',
              background: '#efefef',
              borderRadius: '8px',
              padding: '8px 16px 8px 38px',
              fontSize: '14px'
            }}>
              <IoSearchOutline 
                size={16} 
                color="#8e8e8e" 
                style={{
                  position: 'absolute',
                  left: '12px',
                  top: '50%',
                  transform: 'translateY(-50%)'
                }}
              />
              <input
                type="text"
                placeholder="Search messages..."
                value={searchQuery}
                onChange={(e) => setSearchQuery(e.target.value)}
                style={{
                  background: 'transparent',
                  border: 'none',
                  outline: 'none',
                  fontSize: '14px',
                  width: '100%',
                  color: '#262626'
                }}
              />
            </div>
          </div>

          {/* Tab Navigation */}
          <div style={{
            background: 'white',
            padding: '0 16px'
          }}>
            <div style={{
              display: 'flex',
              gap: '8px',
              overflowX: 'auto',
              padding: '12px 0'
            }}>
              {[
                { id: 'conversations', label: 'Messages' },
                { id: 'groups', label: 'Groups', badge: 1 },
                { id: 'requests', label: 'Requests', badge: 2 }
              ].map((tab) => (
                <button
                  key={tab.id}
                  onClick={() => setActiveTab(tab.id)}
                  style={{
                    background: activeTab === tab.id ? '#0095f6' : 'transparent',
                    color: activeTab === tab.id ? 'white' : '#6b7280',
                    border: 'none',
                    padding: '8px 16px',
                    borderRadius: '20px',
                    fontSize: '14px',
                    fontWeight: '500',
                    cursor: 'pointer',
                    whiteSpace: 'nowrap',
                    display: 'flex',
                    alignItems: 'center',
                    gap: '6px'
                  }}
                >
                  {tab.label}
                  {tab.badge && (
                    <span style={{
                      background: activeTab === tab.id ? 'rgba(255,255,255,0.2)' : '#0095f6',
                      color: activeTab === tab.id ? 'white' : 'white',
                      fontSize: '11px',
                      padding: '2px 6px',
                      borderRadius: '10px',
                      fontWeight: '600'
                    }}>
                      {tab.badge}
                    </span>
                  )}
                </button>
              ))}
            </div>
          </div>

          {/* Tab Content */}
          <div style={{ flex: 1, overflowY: 'auto' }}>
            {activeTab === 'conversations' && (
              <div style={{ background: 'white' }}>
                {filteredConversations.length === 0 ? (
                <div style={{
                  display: 'flex',
                  flexDirection: 'column',
                  alignItems: 'center',
                  justifyContent: 'center',
                  padding: '40px 16px',
                  textAlign: 'center'
                }}>
                  <div style={{
                    width: '64px',
                    height: '64px',
                    borderRadius: '50%',
                    background: '#f3f4f6',
                    display: 'flex',
                    alignItems: 'center',
                    justifyContent: 'center',
                    marginBottom: '16px'
                  }}>
                    <IoHeartOutline size={32} color="#9ca3af" />
                  </div>
                  <h3 style={{ margin: '0 0 8px 0', fontSize: '18px', fontWeight: '600', color: '#374151' }}>
                    No conversations yet
                  </h3>
                  <p style={{ margin: 0, fontSize: '14px', color: '#6b7280' }}>
                    Start connecting with people to see your messages here
                  </p>
                </div>
              ) : (
                <div>
                  {filteredConversations.map((conversation) => (
                    <div
                      key={conversation.id}
                      onClick={() => setActiveChat(conversation.id)}
                      style={{
                        display: 'flex',
                        alignItems: 'center',
                        padding: '16px 20px',
                        background: 'white',
                        borderBottom: '1px solid #f0f0f0',
                        cursor: 'pointer',
                        transition: 'all 0.2s ease',
                        margin: '0 8px',
                        borderRadius: '12px',
                        marginBottom: '4px',
                        boxShadow: '0 1px 3px rgba(0,0,0,0.05)'
                      }}
                      onMouseEnter={(e) => {
                        e.currentTarget.style.backgroundColor = '#f8f9fa';
                        e.currentTarget.style.transform = 'translateY(-1px)';
                        e.currentTarget.style.boxShadow = '0 4px 12px rgba(0,0,0,0.1)';
                      }}
                      onMouseLeave={(e) => {
                        e.currentTarget.style.backgroundColor = 'white';
                        e.currentTarget.style.transform = 'translateY(0)';
                        e.currentTarget.style.boxShadow = '0 1px 3px rgba(0,0,0,0.05)';
                      }}
                    >
                      <div style={{ position: 'relative', marginRight: '12px' }}>
                        <img
                          src={conversation.avatar}
                          alt={conversation.name}
                          style={{
                            width: '48px',
                            height: '48px',
                            borderRadius: '50%',
                            objectFit: 'cover'
                          }}
                        />
                        {conversation.online && (
                          <div style={{
                            position: 'absolute',
                            bottom: '2px',
                            right: '2px',
                            width: '12px',
                            height: '12px',
                            background: '#22c55e',
                            borderRadius: '50%',
                            border: '2px solid white'
                          }} />
                        )}
                      </div>
                      
                      <div style={{ flex: 1, minWidth: 0 }}>
                            <div style={{
                              display: 'flex',
                              alignItems: 'center',
                              justifyContent: 'space-between',
                              marginBottom: '6px'
                            }}>
                              <h3 style={{
                                margin: 0,
                                fontSize: '16px',
                                fontWeight: '600',
                                color: '#262626',
                                whiteSpace: 'nowrap',
                                overflow: 'hidden',
                                textOverflow: 'ellipsis'
                              }}>
                                {conversation.name}
                              </h3>
                              <span style={{
                                fontSize: '12px',
                                color: '#8e8e8e',
                                fontWeight: '500'
                              }}>
                                {conversation.time}
                              </span>
                            </div>

                            <div style={{
                              display: 'flex',
                              alignItems: 'center',
                              justifyContent: 'space-between'
                            }}>
                              <div style={{ display: 'flex', alignItems: 'center', gap: '8px', flex: 1 }}>
                                {conversation.isTyping ? (
                                  <span style={{
                                    fontSize: '14px',
                                    color: '#0095f6',
                                    fontStyle: 'italic',
                                    fontWeight: '500'
                                  }}>
                                    typing...
                                  </span>
                                ) : (
                                  <p style={{
                                    margin: 0,
                                    fontSize: '14px',
                                    color: '#6b7280',
                                    whiteSpace: 'nowrap',
                                    overflow: 'hidden',
                                    textOverflow: 'ellipsis',
                                    flex: 1,
                                    lineHeight: '1.4'
                                  }}>
                                    {conversation.lastMessage}
                                  </p>
                                )}
                              </div>

                              <div style={{ display: 'flex', alignItems: 'center', gap: '8px' }}>
                                {conversation.unread > 0 && (
                                  <div style={{
                                    background: '#0095f6',
                                    color: 'white',
                                    fontSize: '11px',
                                    padding: '2px 6px',
                                    borderRadius: '50%',
                                    minWidth: '16px',
                                    height: '16px',
                                    display: 'flex',
                                    alignItems: 'center',
                                    justifyContent: 'center',
                                    fontWeight: '600'
                                  }}>
                                    {conversation.unread}
                                  </div>
                                )}
                              </div>
                            </div>
                          </div>
                    </div>
                  ))}
                </div>
              )}
            </div>
          )}

          {activeTab === 'requests' && (
            <div style={{ background: 'white' }}>
              <div style={{
                display: 'flex',
                alignItems: 'center',
                gap: '12px',
                padding: '16px 20px',
                background: '#f8f9fa',
                margin: '8px',
                borderRadius: '12px',
                cursor: 'pointer',
                transition: 'background-color 0.2s'
              }}
              onMouseEnter={(e) => e.currentTarget.style.backgroundColor = '#f0f0f0'}
              onMouseLeave={(e) => e.currentTarget.style.backgroundColor = '#f8f9fa'}
              >
                <img
                  src="https://images.unsplash.com/photo-1534528741775-53994a69daeb?w=150&h=150&fit=crop&crop=face"
                  alt="Request"
                  style={{
                    width: '40px',
                    height: '40px',
                    borderRadius: '50%',
                    objectFit: 'cover'
                  }}
                />
                <div style={{ flex: 1 }}>
                  <h4 style={{ margin: '0 0 4px 0', fontSize: '14px', fontWeight: '600' }}>
                    Sarah Wilson
                  </h4>
                  <p style={{ margin: 0, fontSize: '12px', color: '#6b7280' }}>
                    Wants to send you a message
                  </p>
                </div>
                <IoArrowForward size={16} color="#6b7280" />
              </div>
            </div>
          )}

          {activeTab === 'groups' && (
            <div style={{ background: 'white' }}>
              <div style={{
                display: 'flex',
                alignItems: 'center',
                gap: '12px',
                padding: '16px 20px',
                background: '#f8f9fa',
                margin: '8px',
                borderRadius: '12px',
                cursor: 'pointer',
                transition: 'background-color 0.2s'
              }}
              onMouseEnter={(e) => e.currentTarget.style.backgroundColor = '#f0f0f0'}
              onMouseLeave={(e) => e.currentTarget.style.backgroundColor = '#f8f9fa'}
              >
                <div style={{
                  width: '40px',
                  height: '40px',
                  borderRadius: '50%',
                  background: 'linear-gradient(135deg, #667eea 0%, #764ba2 100%)',
                  display: 'flex',
                  alignItems: 'center',
                  justifyContent: 'center',
                  color: 'white',
                  fontSize: '16px',
                  fontWeight: '600'
                }}>
                  O
                </div>
                <div style={{ flex: 1 }}>
                  <h4 style={{ margin: '0 0 4px 0', fontSize: '14px', fontWeight: '600' }}>
                    Omify Community
                  </h4>
                  <p style={{ margin: 0, fontSize: '12px', color: '#6b7280' }}>
                    You, Emma, Mia and 12 others
                  </p>
                </div>
                <div style={{
                  background: '#0095f6',
                  color: 'white',
                  fontSize: '11px',
                  padding: '2px 6px',
                  borderRadius: '50%',
                  minWidth: '16px',
                  height: '16px',
                  display: 'flex',
                  alignItems: 'center',
                  justifyContent: 'center',
                  fontWeight: '600'
                }}>
                  3
                </div>
              </div>
            </div>
          )}
        </div>
      </>
      ) : (
        /* Chat View */
        <div style={{ flex: 1, display: 'flex', flexDirection: 'column' }}>
          {/* Chat Header */}
          <div style={{
            background: 'white',
            padding: '12px 16px',
            display: 'flex',
            alignItems: 'center',
            gap: '12px'
          }}>
            <button
              onClick={() => setActiveChat(null)}
              style={{
                background: 'none',
                border: 'none',
                cursor: 'pointer',
                padding: '8px',
                borderRadius: '8px',
                display: 'flex',
                alignItems: 'center',
                justifyContent: 'center'
              }}
            >
              <IoArrowBack size={20} color="#262626" />
            </button>
            
            <div style={{ position: 'relative' }}>
              <img
                src={getActiveConversation()?.avatar}
                alt="Avatar"
                style={{
                  width: '40px',
                  height: '40px',
                  borderRadius: '50%',
                  objectFit: 'cover'
                }}
              />
              {getActiveConversation()?.online && (
                <div style={{
                  position: 'absolute',
                  bottom: '2px',
                  right: '2px',
                  width: '10px',
                  height: '10px',
                  background: '#22c55e',
                  borderRadius: '50%',
                  border: '2px solid white'
                }} />
              )}
            </div>
            
            <div style={{ flex: 1 }}>
              <h3 style={{ margin: 0, fontSize: '16px', fontWeight: '600' }}>
                {getActiveConversation()?.name}
              </h3>
              <span style={{ fontSize: '12px', color: '#8e8e8e' }}>
                {getActiveConversation()?.online ? 'Online' : 'Offline'}
                {getActiveConversation()?.isTyping && ' • typing...'}
              </span>
            </div>
            
            <div style={{ display: 'flex', gap: '8px' }}>
              <button style={{
                background: 'none',
                border: 'none',
                cursor: 'pointer',
                padding: '8px',
                borderRadius: '8px'
              }}>
                <IoVideocam size={20} color="#262626" />
              </button>
              <button style={{
                background: 'none',
                border: 'none',
                cursor: 'pointer',
                padding: '8px',
                borderRadius: '8px'
              }}>
                <IoCall size={20} color="#262626" />
              </button>
              <button style={{
                background: 'none',
                border: 'none',
                cursor: 'pointer',
                padding: '8px',
                borderRadius: '8px'
              }}>
                <IoEllipsisVertical size={20} color="#262626" />
              </button>
            </div>
          </div>

          {/* Messages */}
          <div style={{
            flex: 1,
            overflowY: 'auto',
            padding: '16px',
            background: '#f8f9fa'
          }}>
            {messages[activeChat as keyof typeof messages]?.map((msg) => (
              <div
                key={msg.id}
                style={{
                  display: 'flex',
                  justifyContent: msg.sender === 'me' ? 'flex-end' : 'flex-start',
                  marginBottom: '12px'
                }}
              >
                <div style={{
                  maxWidth: '70%',
                  padding: '12px 16px',
                  borderRadius: '18px',
                  background: msg.sender === 'me' ? '#0095f6' : 'white',
                  color: msg.sender === 'me' ? 'white' : '#262626',
                  boxShadow: '0 1px 2px rgba(0,0,0,0.1)',
                  position: 'relative'
                }}>
                  <p style={{ margin: 0, fontSize: '14px' }}>{msg.text}</p>
                  <div style={{
                    display: 'flex',
                    alignItems: 'center',
                    justifyContent: 'flex-end',
                    gap: '4px',
                    marginTop: '4px'
                  }}>
                    <span style={{
                      fontSize: '11px',
                      opacity: 0.7
                    }}>
                      {msg.time}
                    </span>
                    {msg.sender === 'me' && (
                      <span style={{
                        fontSize: '10px',
                        opacity: 0.7
                      }}>
                        {msg.status === 'read' ? '✓✓' : '✓'}
                      </span>
                    )}
                  </div>
                </div>
              </div>
            ))}
          </div>

          {/* Message Input */}
          <div style={{
            background: 'white',
            padding: '16px',
            display: 'flex',
            alignItems: 'center',
            gap: '12px'
          }}>
            <button style={{
              background: 'none',
              border: 'none',
              cursor: 'pointer',
              padding: '8px',
              borderRadius: '8px',
              display: 'flex',
              alignItems: 'center',
              justifyContent: 'center'
            }}>
              <IoColorPalette size={20} color="#262626" />
            </button>
            
            <button style={{
              background: 'none',
              border: 'none',
              cursor: 'pointer',
              padding: '8px',
              borderRadius: '8px',
              display: 'flex',
              alignItems: 'center',
              justifyContent: 'center'
            }}>
              <IoImageOutline size={20} color="#262626" />
            </button>
            
            <input
              type="text"
              placeholder="Message..."
              value={message}
              onChange={(e) => setMessage(e.target.value)}
              onKeyPress={(e) => e.key === 'Enter' && handleSendMessage()}
              style={{
                flex: 1,
                border: '1px solid #dbdbdb',
                borderRadius: '20px',
                padding: '12px 16px',
                fontSize: '14px',
                outline: 'none'
              }}
            />
            
            <button style={{
              background: 'none',
              border: 'none',
              cursor: 'pointer',
              padding: '8px',
              borderRadius: '8px',
              display: 'flex',
              alignItems: 'center',
              justifyContent: 'center'
            }}>
              <IoMicOutline size={20} color="#262626" />
            </button>
            
            <button
              onClick={handleSendMessage}
              disabled={!message.trim()}
              style={{
                background: message.trim() ? '#0095f6' : '#dbdbdb',
                border: 'none',
                borderRadius: '50%',
                width: '40px',
                height: '40px',
                display: 'flex',
                alignItems: 'center',
                justifyContent: 'center',
                cursor: message.trim() ? 'pointer' : 'not-allowed'
              }}
            >
              <BiSend size={18} color="white" />
            </button>
          </div>
        </div>
      )}

                 {/* AI Chat Interface */}
           {showAIChat && (
             <div style={{
               position: 'fixed',
               top: 0,
               left: 0,
               width: '100vw',
               height: '100vh',
               background: 'white',
               display: 'flex',
               flexDirection: 'column',
               zIndex: 1000
             }}>
                         {/* AI Chat Header */}
               <div style={{
                 background: 'linear-gradient(135deg, #667eea 0%, #764ba2 100%)',
                 color: 'white',
                 padding: '16px',
                 display: 'flex',
                 alignItems: 'center',
                 justifyContent: 'space-between'
               }}>
            <div style={{ display: 'flex', alignItems: 'center', gap: '8px' }}>
              <IoChatbubble size={20} />
              <span style={{ fontWeight: '600' }}>AI Assistant</span>
            </div>
            <button
              onClick={() => setShowAIChat(false)}
              style={{
                background: 'none',
                border: 'none',
                color: 'white',
                cursor: 'pointer',
                fontSize: '18px'
              }}
            >
              ×
            </button>
          </div>

          {/* AI Chat Messages */}
          <div style={{
            flex: 1,
            padding: '16px',
            overflowY: 'auto',
            display: 'flex',
            flexDirection: 'column',
            gap: '12px'
          }}>
            {aiMessages.map((msg) => (
              <div
                key={msg.id}
                style={{
                  display: 'flex',
                  justifyContent: msg.sender === 'user' ? 'flex-end' : 'flex-start'
                }}
              >
                <div style={{
                  maxWidth: '80%',
                  padding: '8px 12px',
                  borderRadius: '16px',
                  background: msg.sender === 'user' ? '#0095f6' : '#f0f0f0',
                  color: msg.sender === 'user' ? 'white' : '#333',
                  fontSize: '14px',
                  wordWrap: 'break-word'
                }}>
                  {msg.text}
                </div>
              </div>
            ))}
          </div>

          {/* AI Chat Input */}
          <div style={{
            padding: '16px',
            borderTop: '1px solid #e5e7eb',
            display: 'flex',
            gap: '8px'
          }}>
            <input
              type="text"
              placeholder="Ask about app features..."
              value={aiInput}
              onChange={(e) => setAiInput(e.target.value)}
              onKeyPress={(e) => e.key === 'Enter' && handleAISendMessage()}
              style={{
                flex: 1,
                border: '1px solid #dbdbdb',
                borderRadius: '20px',
                padding: '8px 12px',
                fontSize: '14px',
                outline: 'none'
              }}
            />
            <button
              onClick={handleAISendMessage}
              disabled={!aiInput.trim()}
              style={{
                background: aiInput.trim() ? '#0095f6' : '#dbdbdb',
                border: 'none',
                borderRadius: '50%',
                width: '32px',
                height: '32px',
                display: 'flex',
                alignItems: 'center',
                justifyContent: 'center',
                cursor: aiInput.trim() ? 'pointer' : 'not-allowed'
              }}
            >
              <BiSend size={14} color="white" />
            </button>
          </div>
        </div>
      )}

      {/* Floating AI Chat Button */}
      <button
        onClick={() => setShowAIChat(!showAIChat)}
        style={{
          position: 'fixed',
          bottom: '100px',
          right: '20px',
          width: '56px',
          height: '56px',
          background: 'linear-gradient(135deg, #667eea 0%, #764ba2 100%)',
          border: 'none',
          borderRadius: '50%',
          display: 'flex',
          alignItems: 'center',
          justifyContent: 'center',
          cursor: 'pointer',
          boxShadow: '0 4px 16px rgba(0,0,0,0.2)',
          zIndex: 999,
          transition: 'transform 0.2s ease'
        }}
        onMouseEnter={(e) => e.currentTarget.style.transform = 'scale(1.1)'}
        onMouseLeave={(e) => e.currentTarget.style.transform = 'scale(1)'}
      >
        <IoChatbubble size={24} color="white" />
      </button>
    </div>
  );
};

export default Messages; 