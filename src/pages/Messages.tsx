import { useState } from 'react';
import { useNavigate } from 'react-router-dom';
import { IoSearchOutline, IoEllipsisVertical, IoVideocam, IoCall, IoEllipsisHorizontal, IoArrowBack, IoHeartOutline, IoImageOutline, IoMicOutline, IoArrowForward, IoHappyOutline, IoColorPalette } from 'react-icons/io5';
import { BiSend } from 'react-icons/bi';

const Messages = () => {
  const navigate = useNavigate();
  const [activeChat, setActiveChat] = useState<string | null>(null);
  const [message, setMessage] = useState('');
  const [searchQuery, setSearchQuery] = useState('');
  const [activeTab, setActiveTab] = useState('conversations');

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
            display: 'flex',
            alignItems: 'center',
            justifyContent: 'space-between'
          }}>
            <div style={{ display: 'flex', alignItems: 'center', gap: '12px' }}>
              <button 
                onClick={() => navigate('/')}
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
              <h1 style={{ margin: 0, fontSize: '20px', fontWeight: '600' }}>Messages</h1>
            </div>
            <div style={{ display: 'flex', gap: '12px' }}>
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
                <IoEllipsisHorizontal size={20} color="#262626" />
              </button>
            </div>
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
    </div>
  );
};

export default Messages; 