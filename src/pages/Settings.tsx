import { useState } from 'react';
import { useNavigate } from 'react-router-dom';
import { 
  IoPersonOutline, 
  IoShieldCheckmarkOutline, 
  IoNotificationsOutline, 
  IoColorPaletteOutline, 
  IoLanguageOutline, 
  IoHelpCircleOutline, 
  IoLogOutOutline, 
  IoTrashOutline, 
  IoEyeOutline, 
  IoEyeOffOutline,
  IoArrowBack,
  IoChevronForward,
  IoMoonOutline,
  IoSunnyOutline,
  IoVolumeHighOutline,
  IoVolumeMuteOutline,
  IoLockClosedOutline,
  IoMailOutline,
  IoCallOutline,
  IoLocationOutline,
  IoGlobeOutline,
  IoHeartOutline,
  IoBookmarkOutline,
  IoStarOutline,
  IoCloseOutline,
  IoCardOutline
} from 'react-icons/io5';
import { FaRegHeart, FaRegBookmark } from 'react-icons/fa';

const Settings = ({ onMenuClick }: { onMenuClick?: () => void }) => {
  const navigate = useNavigate();
  const [showPassword, setShowPassword] = useState(false);
  const [showConfirmPassword, setShowConfirmPassword] = useState(false);
  const [notifications, setNotifications] = useState({
    messages: true,
    bookings: true,
    promotions: false,
    updates: true,
    newMatches: true,
    nearbyProviders: false
  });
  const [theme, setTheme] = useState('light');
  const [language, setLanguage] = useState('English');

  const mockUser = {
    name: 'Alex Johnson',
    email: 'alex.johnson@example.com',
    phone: '+1 (555) 123-4567',
    location: 'San Francisco, CA',
    language: 'English',
    theme: 'Light',
    avatar: 'https://images.unsplash.com/photo-1494790108755-2616b612b786?w=150&h=150&fit=crop&crop=face'
  };

  const handleLogout = () => {
    // Handle logout logic
    console.log('Logging out...');
  };

  const handleDeleteAccount = () => {
    // Handle account deletion logic
    console.log('Deleting account...');
  };

  const toggleNotification = (key: string) => {
    setNotifications(prev => ({
      ...prev,
      [key]: !prev[key as keyof typeof prev]
    }));
  };

  const settingsSections = [
    {
      title: 'Account',
      items: [
        {
          icon: <IoShieldCheckmarkOutline size={20} />,
          title: 'Privacy & Security',
          subtitle: 'Manage your account security',
          action: 'navigate',
          color: '#10b981'
        },
        {
          icon: <IoNotificationsOutline size={20} />,
          title: 'Notifications',
          subtitle: 'Customize your notifications',
          action: 'navigate',
          color: '#f59e0b'
        }
      ]
    },
    {
      title: 'Preferences',
      items: [
        {
          icon: <IoColorPaletteOutline size={20} />,
          title: 'Appearance',
          subtitle: 'Dark mode and themes',
          action: 'navigate',
          color: '#8b5cf6'
        },
        {
          icon: <IoLanguageOutline size={20} />,
          title: 'Language',
          subtitle: 'Change app language',
          action: 'navigate',
          color: '#ef4444'
        },
        {
          icon: <IoVolumeHighOutline size={20} />,
          title: 'Sound & Haptics',
          subtitle: 'Audio and vibration settings',
          action: 'navigate',
          color: '#06b6d4'
        }
      ]
    },
    {
      title: 'Support',
      items: [
        {
          icon: <IoHelpCircleOutline size={20} />,
          title: 'Help & Support',
          subtitle: 'Get help and contact us',
          action: 'navigate',
          color: '#84cc16'
        },
        {
          icon: <IoStarOutline size={20} />,
          title: 'Rate App',
          subtitle: 'Rate us on app store',
          action: 'navigate',
          color: '#f97316'
        },
        {
          icon: <IoCardOutline size={20} />,
          title: 'Payment Details',
          subtitle: 'Manage payment methods',
          action: 'navigate',
          color: '#3b82f6'
        }
      ]
    }
  ];

  return (
    <div style={{
      minHeight: '100vh',
      background: '#f8f9fa',
      paddingBottom: '80px'
    }}>
      {/* Header */}
      <div style={{
        background: 'white',
        padding: '16px',
        borderBottom: '1px solid #e5e7eb',
        position: 'relative'
      }}>
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
        <h1 style={{
          fontSize: '20px',
          fontWeight: '700',
          color: '#1a1a1a',
          margin: 0,
          textAlign: 'center'
        }}>
          Settings
        </h1>
      </div>

              <div style={{
          padding: '16px',
          maxWidth: '600px',
          margin: '0 auto'
        }}>

        {/* Settings Sections */}
        {settingsSections.map((section, sectionIndex) => (
          <div key={sectionIndex} style={{ marginBottom: '24px' }}>
            <h3 style={{
              fontSize: '16px',
              fontWeight: '600',
              color: '#374151',
              margin: '0 0 12px 0',
              paddingLeft: '4px'
            }}>
              {section.title}
            </h3>
            <div style={{
              background: 'white',
              borderRadius: '16px',
              overflow: 'hidden',
              boxShadow: '0 2px 8px rgba(0,0,0,0.1)'
            }}>
              {section.items.map((item, itemIndex) => (
                <div key={itemIndex}>
                  <button
                    style={{
                      width: '100%',
                      display: 'flex',
                      alignItems: 'center',
                      gap: '16px',
                      padding: '16px 20px',
                      background: 'white',
                      border: 'none',
                      cursor: 'pointer',
                      textAlign: 'left',
                      borderBottom: itemIndex < section.items.length - 1 ? '1px solid #f3f4f6' : 'none'
                    }}
                  >
                    <div style={{
                      width: '40px',
                      height: '40px',
                      borderRadius: '12px',
                      background: item.color,
                      display: 'flex',
                      alignItems: 'center',
                      justifyContent: 'center',
                      flexShrink: 0
                    }}>
                      <div style={{ color: 'white' }}>
                        {item.icon}
                      </div>
                    </div>
                    <div style={{ flex: 1 }}>
                      <div style={{
                        fontSize: '16px',
                        fontWeight: '500',
                        color: '#1a1a1a',
                        marginBottom: '2px'
                      }}>
                        {item.title}
                      </div>
                      <div style={{
                        fontSize: '14px',
                        color: '#6b7280'
                      }}>
                        {item.subtitle}
                      </div>
                    </div>
                    <IoChevronForward size={16} color="#9ca3af" />
                  </button>
                </div>
              ))}
            </div>
          </div>
        ))}

        {/* Danger Zone */}
        <div style={{ marginBottom: '24px' }}>
          <h3 style={{
            fontSize: '16px',
            fontWeight: '600',
            color: '#374151',
            margin: '0 0 12px 0',
            paddingLeft: '4px'
          }}>
            Account Actions
          </h3>
          <div style={{
            background: 'white',
            borderRadius: '16px',
            overflow: 'hidden',
            boxShadow: '0 2px 8px rgba(0,0,0,0.1)'
          }}>
            <button
              onClick={handleLogout}
              style={{
                width: '100%',
                display: 'flex',
                alignItems: 'center',
                gap: '16px',
                padding: '16px 20px',
                background: 'white',
                border: 'none',
                cursor: 'pointer',
                textAlign: 'left',
                borderBottom: '1px solid #f3f4f6'
              }}
            >
              <div style={{
                width: '40px',
                height: '40px',
                borderRadius: '12px',
                background: '#f59e0b',
                display: 'flex',
                alignItems: 'center',
                justifyContent: 'center',
                flexShrink: 0
              }}>
                <IoLogOutOutline size={20} color="white" />
              </div>
              <div style={{ flex: 1 }}>
                <div style={{
                  fontSize: '16px',
                  fontWeight: '500',
                  color: '#1a1a1a',
                  marginBottom: '2px'
                }}>
                  Log Out
                </div>
                <div style={{
                  fontSize: '14px',
                  color: '#6b7280'
                }}>
                  Sign out of your account
                </div>
              </div>
              <IoChevronForward size={16} color="#9ca3af" />
            </button>
            <button
              onClick={handleDeleteAccount}
              style={{
                width: '100%',
                display: 'flex',
                alignItems: 'center',
                gap: '16px',
                padding: '16px 20px',
                background: 'white',
                border: 'none',
                cursor: 'pointer',
                textAlign: 'left'
              }}
            >
              <div style={{
                width: '40px',
                height: '40px',
                borderRadius: '12px',
                background: '#ef4444',
                display: 'flex',
                alignItems: 'center',
                justifyContent: 'center',
                flexShrink: 0
              }}>
                <IoTrashOutline size={20} color="white" />
              </div>
              <div style={{ flex: 1 }}>
                <div style={{
                  fontSize: '16px',
                  fontWeight: '500',
                  color: '#1a1a1a',
                  marginBottom: '2px'
                }}>
                  Delete Account
                </div>
                <div style={{
                  fontSize: '14px',
                  color: '#6b7280'
                }}>
                  Permanently delete your account
                </div>
              </div>
              <IoChevronForward size={16} color="#9ca3af" />
            </button>
          </div>
        </div>

        {/* App Version */}
        <div style={{
          textAlign: 'center',
          padding: '20px',
          color: '#9ca3af',
          fontSize: '14px'
        }}>
          Version 1.0.0
        </div>
      </div>
    </div>
  );
};

export default Settings; 