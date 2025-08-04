import { useState } from 'react';
import { IoPersonOutline, IoShieldCheckmarkOutline, IoNotificationsOutline, IoColorPaletteOutline, IoLanguageOutline, IoHelpCircleOutline, IoLogOutOutline, IoTrashOutline, IoEyeOutline, IoEyeOffOutline } from 'react-icons/io5';
import { FaRegHeart, FaRegBookmark } from 'react-icons/fa';

const Settings = () => {
  const [activeSection, setActiveSection] = useState('profile');
  const [showPassword, setShowPassword] = useState(false);
  const [showConfirmPassword, setShowConfirmPassword] = useState(false);
  const [notifications, setNotifications] = useState({
    messages: true,
    bookings: true,
    promotions: false,
    updates: true
  });

  const mockUser = {
    name: 'Alex Johnson',
    email: 'alex.johnson@example.com',
    phone: '+1 (555) 123-4567',
    location: 'San Francisco, CA',
    language: 'English',
    theme: 'Light'
  };

  const handleLogout = () => {
    // Handle logout logic
    console.log('Logging out...');
  };

  const handleDeleteAccount = () => {
    // Handle account deletion logic
    console.log('Deleting account...');
  };

  return (
    <div style={{
      minHeight: '100vh',
      background: '#f8f9fa',
      paddingBottom: '80px'
    }}>
      {/* Header */}
      <div style={{
        background: 'white',
        padding: '20px 16px',
        borderBottom: '1px solid #e5e7eb'
      }}>
        <h1 style={{
          fontSize: '24px',
          fontWeight: '700',
          color: '#1a1a1a',
          margin: 0,
          textAlign: 'center'
        }}>
          Settings
        </h1>
      </div>

      <div style={{
        display: 'flex',
        maxWidth: '800px',
        margin: '0 auto',
        padding: '16px'
      }}>
        {/* Sidebar */}
        <div style={{
          width: '200px',
          background: 'white',
          borderRadius: '16px',
          padding: '20px',
          marginRight: '16px',
          height: 'fit-content',
          boxShadow: '0 2px 8px rgba(0,0,0,0.1)'
        }}>
          <div style={{
            display: 'flex',
            flexDirection: 'column',
            gap: '4px'
          }}>
            <button
              onClick={() => setActiveSection('profile')}
              style={{
                display: 'flex',
                alignItems: 'center',
                gap: '12px',
                padding: '12px 16px',
                background: activeSection === 'profile' ? '#f3f4f6' : 'transparent',
                border: 'none',
                borderRadius: '8px',
                fontSize: '16px',
                fontWeight: '500',
                color: activeSection === 'profile' ? '#1a1a1a' : '#6b7280',
                cursor: 'pointer',
                textAlign: 'left'
              }}
            >
              <IoPersonOutline size={20} />
              Profile
            </button>
            <button
              onClick={() => setActiveSection('security')}
              style={{
                display: 'flex',
                alignItems: 'center',
                gap: '12px',
                padding: '12px 16px',
                background: activeSection === 'security' ? '#f3f4f6' : 'transparent',
                border: 'none',
                borderRadius: '8px',
                fontSize: '16px',
                fontWeight: '500',
                color: activeSection === 'security' ? '#1a1a1a' : '#6b7280',
                cursor: 'pointer',
                textAlign: 'left'
              }}
            >
              <IoShieldCheckmarkOutline size={20} />
              Security
            </button>
            <button
              onClick={() => setActiveSection('notifications')}
              style={{
                display: 'flex',
                alignItems: 'center',
                gap: '12px',
                padding: '12px 16px',
                background: activeSection === 'notifications' ? '#f3f4f6' : 'transparent',
                border: 'none',
                borderRadius: '8px',
                fontSize: '16px',
                fontWeight: '500',
                color: activeSection === 'notifications' ? '#1a1a1a' : '#6b7280',
                cursor: 'pointer',
                textAlign: 'left'
              }}
            >
              <IoNotificationsOutline size={20} />
              Notifications
            </button>
            <button
              onClick={() => setActiveSection('appearance')}
              style={{
                display: 'flex',
                alignItems: 'center',
                gap: '12px',
                padding: '12px 16px',
                background: activeSection === 'appearance' ? '#f3f4f6' : 'transparent',
                border: 'none',
                borderRadius: '8px',
                fontSize: '16px',
                fontWeight: '500',
                color: activeSection === 'appearance' ? '#1a1a1a' : '#6b7280',
                cursor: 'pointer',
                textAlign: 'left'
              }}
            >
              <IoColorPaletteOutline size={20} />
              Appearance
            </button>
            <button
              onClick={() => setActiveSection('language')}
              style={{
                display: 'flex',
                alignItems: 'center',
                gap: '12px',
                padding: '12px 16px',
                background: activeSection === 'language' ? '#f3f4f6' : 'transparent',
                border: 'none',
                borderRadius: '8px',
                fontSize: '16px',
                fontWeight: '500',
                color: activeSection === 'language' ? '#1a1a1a' : '#6b7280',
                cursor: 'pointer',
                textAlign: 'left'
              }}
            >
              <IoLanguageOutline size={20} />
              Language
            </button>
            <button
              onClick={() => setActiveSection('help')}
              style={{
                display: 'flex',
                alignItems: 'center',
                gap: '12px',
                padding: '12px 16px',
                background: activeSection === 'help' ? '#f3f4f6' : 'transparent',
                border: 'none',
                borderRadius: '8px',
                fontSize: '16px',
                fontWeight: '500',
                color: activeSection === 'help' ? '#1a1a1a' : '#6b7280',
                cursor: 'pointer',
                textAlign: 'left'
              }}
            >
              <IoHelpCircleOutline size={20} />
              Help & Support
            </button>
          </div>
        </div>

        {/* Main Content */}
        <div style={{
          flex: 1,
          background: 'white',
          borderRadius: '16px',
          padding: '32px',
          boxShadow: '0 2px 8px rgba(0,0,0,0.1)'
        }}>
          {activeSection === 'profile' && (
            <div>
              <h2 style={{
                fontSize: '20px',
                fontWeight: '600',
                color: '#1a1a1a',
                marginBottom: '24px'
              }}>
                Profile Settings
              </h2>
              
              <div style={{ display: 'flex', flexDirection: 'column', gap: '20px' }}>
                <div>
                  <label style={{
                    display: 'block',
                    marginBottom: '8px',
                    fontSize: '14px',
                    fontWeight: '500',
                    color: '#374151'
                  }}>
                    Full Name
                  </label>
                  <input
                    type="text"
                    defaultValue={mockUser.name}
                    style={{
                      width: '100%',
                      padding: '12px 16px',
                      border: '1px solid #e5e7eb',
                      borderRadius: '8px',
                      fontSize: '16px',
                      background: 'white',
                      outline: 'none'
                    }}
                  />
                </div>

                <div>
                  <label style={{
                    display: 'block',
                    marginBottom: '8px',
                    fontSize: '14px',
                    fontWeight: '500',
                    color: '#374151'
                  }}>
                    Email
                  </label>
                  <input
                    type="email"
                    defaultValue={mockUser.email}
                    style={{
                      width: '100%',
                      padding: '12px 16px',
                      border: '1px solid #e5e7eb',
                      borderRadius: '8px',
                      fontSize: '16px',
                      background: 'white',
                      outline: 'none'
                    }}
                  />
                </div>

                <div>
                  <label style={{
                    display: 'block',
                    marginBottom: '8px',
                    fontSize: '14px',
                    fontWeight: '500',
                    color: '#374151'
                  }}>
                    Phone Number
                  </label>
                  <input
                    type="tel"
                    defaultValue={mockUser.phone}
                    style={{
                      width: '100%',
                      padding: '12px 16px',
                      border: '1px solid #e5e7eb',
                      borderRadius: '8px',
                      fontSize: '16px',
                      background: 'white',
                      outline: 'none'
                    }}
                  />
                </div>

                <div>
                  <label style={{
                    display: 'block',
                    marginBottom: '8px',
                    fontSize: '14px',
                    fontWeight: '500',
                    color: '#374151'
                  }}>
                    Location
                  </label>
                  <input
                    type="text"
                    defaultValue={mockUser.location}
                    style={{
                      width: '100%',
                      padding: '12px 16px',
                      border: '1px solid #e5e7eb',
                      borderRadius: '8px',
                      fontSize: '16px',
                      background: 'white',
                      outline: 'none'
                    }}
                  />
                </div>

                <button style={{
                  padding: '12px 24px',
                  background: 'linear-gradient(135deg, #3b82f6 0%, #1d4ed8 100%)',
                  color: 'white',
                  border: 'none',
                  borderRadius: '8px',
                  fontSize: '16px',
                  fontWeight: '600',
                  cursor: 'pointer'
                }}>
                  Save Changes
                </button>
              </div>
            </div>
          )}

          {activeSection === 'security' && (
            <div>
              <h2 style={{
                fontSize: '20px',
                fontWeight: '600',
                color: '#1a1a1a',
                marginBottom: '24px'
              }}>
                Security Settings
              </h2>
              
              <div style={{ display: 'flex', flexDirection: 'column', gap: '20px' }}>
                <div>
                  <label style={{
                    display: 'block',
                    marginBottom: '8px',
                    fontSize: '14px',
                    fontWeight: '500',
                    color: '#374151'
                  }}>
                    Current Password
                  </label>
                  <div style={{ position: 'relative' }}>
                    <input
                      type={showPassword ? 'text' : 'password'}
                      placeholder="Enter current password"
                      style={{
                        width: '100%',
                        padding: '12px 16px',
                        paddingRight: '48px',
                        border: '1px solid #e5e7eb',
                        borderRadius: '8px',
                        fontSize: '16px',
                        background: 'white',
                        outline: 'none'
                      }}
                    />
                    <button
                      onClick={() => setShowPassword(!showPassword)}
                      style={{
                        position: 'absolute',
                        right: '16px',
                        top: '50%',
                        transform: 'translateY(-50%)',
                        background: 'none',
                        border: 'none',
                        color: '#9ca3af',
                        cursor: 'pointer'
                      }}
                    >
                      {showPassword ? <IoEyeOffOutline size={20} /> : <IoEyeOutline size={20} />}
                    </button>
                  </div>
                </div>

                <div>
                  <label style={{
                    display: 'block',
                    marginBottom: '8px',
                    fontSize: '14px',
                    fontWeight: '500',
                    color: '#374151'
                  }}>
                    New Password
                  </label>
                  <div style={{ position: 'relative' }}>
                    <input
                      type={showConfirmPassword ? 'text' : 'password'}
                      placeholder="Enter new password"
                      style={{
                        width: '100%',
                        padding: '12px 16px',
                        paddingRight: '48px',
                        border: '1px solid #e5e7eb',
                        borderRadius: '8px',
                        fontSize: '16px',
                        background: 'white',
                        outline: 'none'
                      }}
                    />
                    <button
                      onClick={() => setShowConfirmPassword(!showConfirmPassword)}
                      style={{
                        position: 'absolute',
                        right: '16px',
                        top: '50%',
                        transform: 'translateY(-50%)',
                        background: 'none',
                        border: 'none',
                        color: '#9ca3af',
                        cursor: 'pointer'
                      }}
                    >
                      {showConfirmPassword ? <IoEyeOffOutline size={20} /> : <IoEyeOutline size={20} />}
                    </button>
                  </div>
                </div>

                <button style={{
                  padding: '12px 24px',
                  background: 'linear-gradient(135deg, #3b82f6 0%, #1d4ed8 100%)',
                  color: 'white',
                  border: 'none',
                  borderRadius: '8px',
                  fontSize: '16px',
                  fontWeight: '600',
                  cursor: 'pointer'
                }}>
                  Update Password
                </button>
              </div>
            </div>
          )}

          {activeSection === 'notifications' && (
            <div>
              <h2 style={{
                fontSize: '20px',
                fontWeight: '600',
                color: '#1a1a1a',
                marginBottom: '24px'
              }}>
                Notification Settings
              </h2>
              
              <div style={{ display: 'flex', flexDirection: 'column', gap: '16px' }}>
                <div style={{
                  display: 'flex',
                  alignItems: 'center',
                  justifyContent: 'space-between',
                  padding: '16px',
                  border: '1px solid #e5e7eb',
                  borderRadius: '8px'
                }}>
                  <div>
                    <div style={{ fontSize: '16px', fontWeight: '500', color: '#1a1a1a' }}>
                      Messages
                    </div>
                    <div style={{ fontSize: '14px', color: '#6b7280' }}>
                      Receive notifications for new messages
                    </div>
                  </div>
                  <input
                    type="checkbox"
                    checked={notifications.messages}
                    onChange={(e) => setNotifications({...notifications, messages: e.target.checked})}
                    style={{ width: '20px', height: '20px' }}
                  />
                </div>

                <div style={{
                  display: 'flex',
                  alignItems: 'center',
                  justifyContent: 'space-between',
                  padding: '16px',
                  border: '1px solid #e5e7eb',
                  borderRadius: '8px'
                }}>
                  <div>
                    <div style={{ fontSize: '16px', fontWeight: '500', color: '#1a1a1a' }}>
                      Bookings
                    </div>
                    <div style={{ fontSize: '14px', color: '#6b7280' }}>
                      Notifications for booking updates
                    </div>
                  </div>
                  <input
                    type="checkbox"
                    checked={notifications.bookings}
                    onChange={(e) => setNotifications({...notifications, bookings: e.target.checked})}
                    style={{ width: '20px', height: '20px' }}
                  />
                </div>

                <div style={{
                  display: 'flex',
                  alignItems: 'center',
                  justifyContent: 'space-between',
                  padding: '16px',
                  border: '1px solid #e5e7eb',
                  borderRadius: '8px'
                }}>
                  <div>
                    <div style={{ fontSize: '16px', fontWeight: '500', color: '#1a1a1a' }}>
                      Promotions
                    </div>
                    <div style={{ fontSize: '14px', color: '#6b7280' }}>
                      Special offers and promotions
                    </div>
                  </div>
                  <input
                    type="checkbox"
                    checked={notifications.promotions}
                    onChange={(e) => setNotifications({...notifications, promotions: e.target.checked})}
                    style={{ width: '20px', height: '20px' }}
                  />
                </div>

                <div style={{
                  display: 'flex',
                  alignItems: 'center',
                  justifyContent: 'space-between',
                  padding: '16px',
                  border: '1px solid #e5e7eb',
                  borderRadius: '8px'
                }}>
                  <div>
                    <div style={{ fontSize: '16px', fontWeight: '500', color: '#1a1a1a' }}>
                      App Updates
                    </div>
                    <div style={{ fontSize: '14px', color: '#6b7280' }}>
                      New features and updates
                    </div>
                  </div>
                  <input
                    type="checkbox"
                    checked={notifications.updates}
                    onChange={(e) => setNotifications({...notifications, updates: e.target.checked})}
                    style={{ width: '20px', height: '20px' }}
                  />
                </div>
              </div>
            </div>
          )}

          {activeSection === 'appearance' && (
            <div>
              <h2 style={{
                fontSize: '20px',
                fontWeight: '600',
                color: '#1a1a1a',
                marginBottom: '24px'
              }}>
                Appearance Settings
              </h2>
              
              <div style={{ display: 'flex', flexDirection: 'column', gap: '16px' }}>
                <div>
                  <label style={{
                    display: 'block',
                    marginBottom: '8px',
                    fontSize: '14px',
                    fontWeight: '500',
                    color: '#374151'
                  }}>
                    Theme
                  </label>
                  <select
                    defaultValue={mockUser.theme}
                    style={{
                      width: '100%',
                      padding: '12px 16px',
                      border: '1px solid #e5e7eb',
                      borderRadius: '8px',
                      fontSize: '16px',
                      background: 'white',
                      outline: 'none'
                    }}
                  >
                    <option value="Light">Light</option>
                    <option value="Dark">Dark</option>
                    <option value="Auto">Auto</option>
                  </select>
                </div>
              </div>
            </div>
          )}

          {activeSection === 'language' && (
            <div>
              <h2 style={{
                fontSize: '20px',
                fontWeight: '600',
                color: '#1a1a1a',
                marginBottom: '24px'
              }}>
                Language Settings
              </h2>
              
              <div style={{ display: 'flex', flexDirection: 'column', gap: '16px' }}>
                <div>
                  <label style={{
                    display: 'block',
                    marginBottom: '8px',
                    fontSize: '14px',
                    fontWeight: '500',
                    color: '#374151'
                  }}>
                    Language
                  </label>
                  <select
                    defaultValue={mockUser.language}
                    style={{
                      width: '100%',
                      padding: '12px 16px',
                      border: '1px solid #e5e7eb',
                      borderRadius: '8px',
                      fontSize: '16px',
                      background: 'white',
                      outline: 'none'
                    }}
                  >
                    <option value="English">English</option>
                    <option value="Spanish">Spanish</option>
                    <option value="French">French</option>
                    <option value="German">German</option>
                    <option value="Chinese">Chinese</option>
                  </select>
                </div>
              </div>
            </div>
          )}

          {activeSection === 'help' && (
            <div>
              <h2 style={{
                fontSize: '20px',
                fontWeight: '600',
                color: '#1a1a1a',
                marginBottom: '24px'
              }}>
                Help & Support
              </h2>
              
              <div style={{ display: 'flex', flexDirection: 'column', gap: '16px' }}>
                <div style={{
                  padding: '16px',
                  border: '1px solid #e5e7eb',
                  borderRadius: '8px',
                  cursor: 'pointer'
                }}>
                  <div style={{ fontSize: '16px', fontWeight: '500', color: '#1a1a1a' }}>
                    FAQ
                  </div>
                  <div style={{ fontSize: '14px', color: '#6b7280' }}>
                    Frequently asked questions
                  </div>
                </div>

                <div style={{
                  padding: '16px',
                  border: '1px solid #e5e7eb',
                  borderRadius: '8px',
                  cursor: 'pointer'
                }}>
                  <div style={{ fontSize: '16px', fontWeight: '500', color: '#1a1a1a' }}>
                    Contact Support
                  </div>
                  <div style={{ fontSize: '14px', color: '#6b7280' }}>
                    Get help from our support team
                  </div>
                </div>

                <div style={{
                  padding: '16px',
                  border: '1px solid #e5e7eb',
                  borderRadius: '8px',
                  cursor: 'pointer'
                }}>
                  <div style={{ fontSize: '16px', fontWeight: '500', color: '#1a1a1a' }}>
                    Privacy Policy
                  </div>
                  <div style={{ fontSize: '14px', color: '#6b7280' }}>
                    Read our privacy policy
                  </div>
                </div>

                <div style={{
                  padding: '16px',
                  border: '1px solid #e5e7eb',
                  borderRadius: '8px',
                  cursor: 'pointer'
                }}>
                  <div style={{ fontSize: '16px', fontWeight: '500', color: '#1a1a1a' }}>
                    Terms of Service
                  </div>
                  <div style={{ fontSize: '14px', color: '#6b7280' }}>
                    Read our terms of service
                  </div>
                </div>
              </div>
            </div>
          )}
        </div>
      </div>

      {/* Danger Zone */}
      <div style={{
        maxWidth: '800px',
        margin: '0 auto',
        padding: '16px'
      }}>
        <div style={{
          background: 'white',
          borderRadius: '16px',
          padding: '32px',
          boxShadow: '0 2px 8px rgba(0,0,0,0.1)'
        }}>
          <h2 style={{
            fontSize: '20px',
            fontWeight: '600',
            color: '#dc2626',
            marginBottom: '24px'
          }}>
            Danger Zone
          </h2>
          
          <div style={{ display: 'flex', flexDirection: 'column', gap: '16px' }}>
            <button
              onClick={handleLogout}
              style={{
                display: 'flex',
                alignItems: 'center',
                gap: '12px',
                padding: '12px 24px',
                background: 'white',
                color: '#dc2626',
                border: '2px solid #dc2626',
                borderRadius: '8px',
                fontSize: '16px',
                fontWeight: '600',
                cursor: 'pointer'
              }}
            >
              <IoLogOutOutline size={20} />
              Logout
            </button>
            
            <button
              onClick={handleDeleteAccount}
              style={{
                display: 'flex',
                alignItems: 'center',
                gap: '12px',
                padding: '12px 24px',
                background: '#dc2626',
                color: 'white',
                border: 'none',
                borderRadius: '8px',
                fontSize: '16px',
                fontWeight: '600',
                cursor: 'pointer'
              }}
            >
              <IoTrashOutline size={20} />
              Delete Account
            </button>
          </div>
        </div>
      </div>
    </div>
  );
};

export default Settings; 