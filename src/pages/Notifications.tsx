import { useState } from 'react';
import { useNavigate } from 'react-router-dom';
import { IoEllipsisVertical, IoHeartOutline, IoChatbubbleOutline, IoBookmarkOutline, IoPersonAddOutline, IoCheckmarkCircleOutline, IoTimeOutline, IoArrowBack } from 'react-icons/io5';

const Notifications = () => {
  const navigate = useNavigate();
  const [activeTab, setActiveTab] = useState('all');

  const notifications = [
    {
      id: '1',
      type: 'like',
      user: {
        name: 'Emma Thompson',
        avatar: 'https://images.unsplash.com/photo-1494790108755-2616b612b786?w=150&h=150&fit=crop&crop=face'
      },
      action: 'liked your post',
      time: '2m ago',
      read: false,
      postImage: 'https://images.unsplash.com/photo-1517841905240-472988babdf9?w=100&h=100&fit=crop'
    },
    {
      id: '2',
      type: 'comment',
      user: {
        name: 'Mia Rodriguez',
        avatar: 'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?w=150&h=150&fit=crop&crop=face'
      },
      action: 'commented on your post',
      comment: 'Amazing! Love this 😍',
      time: '5m ago',
      read: false,
      postImage: 'https://images.unsplash.com/photo-1524504388940-b1c1722653e1?w=100&h=100&fit=crop'
    },
    {
      id: '3',
      type: 'booking',
      user: {
        name: 'Sophia Chen',
        avatar: 'https://images.unsplash.com/photo-1544005313-94ddf0286df2?w=150&h=150&fit=crop&crop=face'
      },
      action: 'booked your service',
      time: '1h ago',
      read: true,
      service: 'Swedish Massage'
    },
    {
      id: '4',
      type: 'follow',
      user: {
        name: 'Isabella Johnson',
        avatar: 'https://images.unsplash.com/photo-1487412720507-e7ab37603c6f?w=150&h=150&fit=crop&crop=face'
      },
      action: 'started following you',
      time: '2h ago',
      read: true
    },
    {
      id: '5',
      type: 'booking_accepted',
      user: {
        name: 'Emma Thompson',
        avatar: 'https://images.unsplash.com/photo-1494790108755-2616b612b786?w=150&h=150&fit=crop&crop=face'
      },
      action: 'accepted your booking request',
      time: '3h ago',
      read: true,
      service: 'Deep Tissue Massage'
    },
    {
      id: '6',
      type: 'like',
      user: {
        name: 'Ava Wilson',
        avatar: 'https://images.unsplash.com/photo-1534528741775-53994a69daeb?w=150&h=150&fit=crop&crop=face'
      },
      action: 'liked your story',
      time: '4h ago',
      read: true
    },
    {
      id: '7',
      type: 'reminder',
      user: {
        name: 'System',
        avatar: null
      },
      action: 'You have a booking in 30 minutes',
      time: '30m ago',
      read: false,
      service: 'Hot Stone Massage'
    },
    {
      id: '8',
      type: 'payment',
      user: {
        name: 'Mia Rodriguez',
        avatar: 'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?w=150&h=150&fit=crop&crop=face'
      },
      action: 'sent you a tip',
      time: '1d ago',
      read: true,
      amount: '$50'
    }
  ];

  const getNotificationIcon = (type: string) => {
    switch (type) {
      case 'like':
        return <IoHeartOutline size={16} color="#ed4956" />;
      case 'comment':
        return <IoChatbubbleOutline size={16} color="#0095f6" />;
      case 'booking':
      case 'booking_accepted':
        return <IoCheckmarkCircleOutline size={16} color="#22c55e" />;
      case 'follow':
        return <IoPersonAddOutline size={16} color="#8b5cf6" />;
      case 'reminder':
        return <IoTimeOutline size={16} color="#f59e0b" />;
      case 'payment':
        return <IoBookmarkOutline size={16} color="#10b981" />;
      default:
        return <IoHeartOutline size={16} color="#6b7280" />;
    }
  };

  const getNotificationColor = (type: string) => {
    return 'white';
  };

  const filteredNotifications = notifications.filter(notification => {
    if (activeTab === 'all') return true;
    if (activeTab === 'unread') return !notification.read;
    if (activeTab === 'bookings') return notification.type === 'booking' || notification.type === 'booking_accepted';
    if (activeTab === 'social') return notification.type === 'like' || notification.type === 'comment' || notification.type === 'follow';
    
    return true;
  });

  return (
    <div style={{
      height: '100vh',
      display: 'flex',
      flexDirection: 'column',
      background: '#fafafa'
    }}>
      {/* Header */}
      <div style={{
        background: 'white',
        padding: '20px 16px',
        display: 'flex',
        alignItems: 'center',
        justifyContent: 'space-between'
      }}>
        <div style={{ display: 'flex', alignItems: 'center', gap: '16px' }}>
          <button
            onClick={() => navigate(-1)}
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
            <IoArrowBack size={24} color="#262626" />
          </button>
          <h1 style={{ margin: 0, fontSize: '24px', fontWeight: '700', color: '#1f2937' }}>Notifications</h1>
        </div>
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
          <IoEllipsisVertical size={20} color="#6b7280" />
        </button>
      </div>

      {/* Tab Navigation */}
      <div style={{
        background: 'white',
        padding: '0 16px'
      }}>
        <div style={{
          display: 'flex',
          gap: '4px',
          overflowX: 'auto',
          padding: '16px 0'
        }}>
          {[
            { id: 'all', label: 'All' },
            { id: 'unread', label: 'Unread' },
            { id: 'bookings', label: 'Bookings' },
            { id: 'social', label: 'Social' }
          ].map((tab) => (
            <button
              key={tab.id}
              onClick={() => setActiveTab(tab.id)}
              style={{
                background: activeTab === tab.id ? '#0095f6' : 'transparent',
                border: 'none',
                borderRadius: '20px',
                padding: '8px 16px',
                fontSize: '14px',
                fontWeight: '500',
                cursor: 'pointer',
                color: activeTab === tab.id ? 'white' : '#6b7280',
                transition: 'all 0.2s ease',
                whiteSpace: 'nowrap'
              }}
            >
              {tab.label}
            </button>
          ))}
        </div>
      </div>

      {/* Notifications List */}
      <div style={{ flex: 1, overflowY: 'auto' }}>
        {filteredNotifications.length === 0 ? (
          <div style={{
            display: 'flex',
            flexDirection: 'column',
            alignItems: 'center',
            justifyContent: 'center',
            padding: '60px 16px',
            textAlign: 'center'
          }}>
            <div style={{
              width: '80px',
              height: '80px',
              borderRadius: '50%',
              background: '#f3f4f6',
              display: 'flex',
              alignItems: 'center',
              justifyContent: 'center',
              marginBottom: '20px'
            }}>
              <IoHeartOutline size={40} color="#9ca3af" />
            </div>
            <h3 style={{ margin: '0 0 12px 0', fontSize: '20px', fontWeight: '600', color: '#374151' }}>
              No notifications yet
            </h3>
            <p style={{ margin: 0, fontSize: '16px', color: '#6b7280', lineHeight: '1.5' }}>
              {activeTab === 'unread' ? 'You\'re all caught up!' : 
               activeTab === 'bookings' ? 'No booking notifications yet' :
               activeTab === 'social' ? 'No social interactions yet' :
               'Start connecting with people to see notifications here'}
            </p>
          </div>
        ) : (
          <div>
            {filteredNotifications.map((notification) => (
              <div
                key={notification.id}
                style={{
                  display: 'flex',
                  alignItems: 'flex-start',
                  padding: '20px 16px',
                  background: 'white',
                  borderBottom: '1px solid #f0f0f0',
                  cursor: 'pointer',
                  transition: 'all 0.2s ease'
                }}
                onMouseEnter={(e) => e.currentTarget.style.backgroundColor = '#f8f9fa'}
                onMouseLeave={(e) => e.currentTarget.style.backgroundColor = 'white'}
              >
                {/* Avatar */}
                <div style={{ marginRight: '16px', position: 'relative' }}>
                  {notification.user.avatar ? (
                    <img
                      src={notification.user.avatar}
                      alt={notification.user.name}
                      style={{
                        width: '48px',
                        height: '48px',
                        borderRadius: '50%',
                        objectFit: 'cover'
                      }}
                    />
                  ) : (
                    <div style={{
                      width: '48px',
                      height: '48px',
                      borderRadius: '50%',
                      background: '#f3f4f6',
                      display: 'flex',
                      alignItems: 'center',
                      justifyContent: 'center'
                    }}>
                      <IoTimeOutline size={24} color="#9ca3af" />
                    </div>
                  )}
                  
                  {/* Unread indicator */}
                  {!notification.read && (
                    <div style={{
                      position: 'absolute',
                      top: '2px',
                      right: '2px',
                      width: '14px',
                      height: '14px',
                      background: '#0095f6',
                      borderRadius: '50%',
                      border: '2px solid white',
                      boxShadow: '0 2px 4px rgba(0,0,0,0.1)'
                    }} />
                  )}
                </div>

                {/* Content */}
                <div style={{ flex: 1, minWidth: 0 }}>
                  <div style={{
                    display: 'flex',
                    alignItems: 'flex-start',
                    justifyContent: 'space-between',
                    marginBottom: '4px'
                  }}>
                    <div style={{ flex: 1, minWidth: 0 }}>
                      <p style={{
                        margin: '0 0 4px 0',
                        fontSize: '15px',
                        fontWeight: '600',
                        color: '#1f2937',
                        lineHeight: '1.4'
                      }}>
                        <span style={{ color: '#0095f6' }}>{notification.user.name}</span>
                        {' '}{notification.action}
                      </p>
                      
                      {notification.comment && (
                        <p style={{
                          margin: '4px 0 0 0',
                          fontSize: '14px',
                          color: '#6b7280',
                          fontStyle: 'italic',
                          lineHeight: '1.4'
                        }}>
                          "{notification.comment}"
                        </p>
                      )}
                      
                      {notification.service && (
                        <div style={{
                          display: 'inline-flex',
                          alignItems: 'center',
                          gap: '6px',
                          marginTop: '4px',
                          padding: '4px 8px',
                          background: '#f3f4f6',
                          borderRadius: '12px',
                          fontSize: '12px',
                          color: '#6b7280',
                          fontWeight: '500'
                        }}>
                          {getNotificationIcon(notification.type)}
                          {notification.service}
                        </div>
                      )}
                      
                      {notification.amount && (
                        <div style={{
                          display: 'inline-flex',
                          alignItems: 'center',
                          gap: '6px',
                          marginTop: '4px',
                          padding: '4px 8px',
                          background: '#ecfdf5',
                          borderRadius: '12px',
                          fontSize: '12px',
                          color: '#10b981',
                          fontWeight: '600'
                        }}>
                          {getNotificationIcon(notification.type)}
                          {notification.amount}
                        </div>
                      )}
                    </div>
                    
                    <div style={{
                      display: 'flex',
                      flexDirection: 'column',
                      alignItems: 'flex-end',
                      gap: '8px'
                    }}>
                      <span style={{
                        fontSize: '12px',
                        color: '#9ca3af',
                        fontWeight: '500'
                      }}>
                        {notification.time}
                      </span>
                      
                      {notification.postImage && (
                        <img
                          src={notification.postImage}
                          alt="Post"
                          style={{
                            width: '44px',
                            height: '44px',
                            borderRadius: '8px',
                            objectFit: 'cover'
                          }}
                        />
                      )}
                    </div>
                  </div>
                </div>
              </div>
            ))}
          </div>
        )}
      </div>
    </div>
  );
};

export default Notifications; 