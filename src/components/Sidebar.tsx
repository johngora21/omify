import { Link } from 'react-router-dom';
import { IoPersonOutline, IoBookmarkOutline, IoSettingsOutline, IoCloseOutline, IoStarOutline, IoBriefcaseOutline } from 'react-icons/io5';
import { MdVerified } from 'react-icons/md';
import type { User } from '../types';

interface SidebarProps {
  isOpen: boolean;
  onClose: () => void;
  user: User | null;
  setUser: (user: User | null) => void;
}

const Sidebar = ({ isOpen, onClose, user, setUser }: SidebarProps) => {
  const handleLogout = () => {
    setUser(null);
    onClose();
  };

  return (
    <>
      {/* Overlay */}
      {isOpen && (
        <div
          onClick={onClose}
          style={{
            position: 'fixed',
            top: 0,
            left: 0,
            right: 0,
            bottom: 0,
            background: 'rgba(0, 0, 0, 0.5)',
            zIndex: 999,
          }}
        />
      )}

      {/* Sidebar */}
      <div style={{
        position: 'fixed',
        top: 0,
        left: isOpen ? 0 : '-100%',
        width: 'min(300px, 85vw)',
        height: '100vh',
        background: 'white',
        zIndex: 1000,
        transition: 'left 0.3s ease',
        boxShadow: '2px 0 8px rgba(0,0,0,0.1)',
        display: 'flex',
        flexDirection: 'column'
      }}>


        {/* Profile Section */}
        <div style={{
          padding: '20px',
          borderBottom: '1px solid #e5e7eb'
        }}>
          {user ? (
            <div style={{
              display: 'flex',
              alignItems: 'center',
              gap: '12px'
            }}>
              <div style={{
                width: '60px',
                height: '60px',
                borderRadius: '50%',
                background: 'linear-gradient(135deg, #3b82f6 0%, #1d4ed8 100%)',
                display: 'flex',
                alignItems: 'center',
                justifyContent: 'center',
                color: 'white',
                fontSize: '20px',
                fontWeight: '600'
              }}>
                {user.name.charAt(0).toUpperCase()}
              </div>
              <div>
                <div style={{
                  fontSize: '16px',
                  fontWeight: '600',
                  color: '#1a1a1a',
                  display: 'flex',
                  alignItems: 'center',
                  gap: '6px'
                }}>
                  {user.name}
                  {user.isVerified && (
                    <MdVerified size={16} color="#3b82f6" />
                  )}
                </div>
                <div style={{
                  fontSize: '14px',
                  color: '#6b7280'
                }}>
                  @{user.name.toLowerCase().replace(/\s+/g, '')}
                </div>
              </div>
            </div>
          ) : (
            <div style={{
              display: 'flex',
              alignItems: 'center',
              gap: '12px'
            }}>
              <div style={{
                width: '60px',
                height: '60px',
                borderRadius: '50%',
                background: '#f3f4f6',
                display: 'flex',
                alignItems: 'center',
                justifyContent: 'center',
                color: '#6b7280'
              }}>
                <IoPersonOutline size={24} />
              </div>
              <div>
                <div style={{
                  fontSize: '16px',
                  fontWeight: '600',
                  color: '#1a1a1a'
                }}>
                  Guest User
                </div>
                <div style={{
                  fontSize: '14px',
                  color: '#6b7280'
                }}>
                  Sign in to access features
                </div>
              </div>
            </div>
          )}
        </div>

        {/* Navigation */}
        <div style={{
          flex: 1,
          padding: '20px 0'
        }}>
          <div style={{
            display: 'flex',
            flexDirection: 'column',
            gap: '4px'
          }}>
            <Link to="/profile" onClick={onClose} style={{
              display: 'flex',
              alignItems: 'center',
              gap: '12px',
              padding: '16px 20px',
              textDecoration: 'none',
              color: '#1a1a1a',
              fontSize: '16px',
              fontWeight: '500',
              transition: 'background-color 0.2s'
            }}>
              <IoPersonOutline size={20} />
              Profile
            </Link>
            
            <Link to="/premium" onClick={onClose} style={{
              display: 'flex',
              alignItems: 'center',
              gap: '12px',
              padding: '16px 20px',
              textDecoration: 'none',
              color: '#1a1a1a',
              fontSize: '16px',
              fontWeight: '500',
              transition: 'background-color 0.2s'
            }}>
              <IoStarOutline size={20} />
              Premium
            </Link>
            
            <Link to="/professional" onClick={onClose} style={{
              display: 'flex',
              alignItems: 'center',
              gap: '12px',
              padding: '16px 20px',
              textDecoration: 'none',
              color: '#1a1a1a',
              fontSize: '16px',
              fontWeight: '500',
              transition: 'background-color 0.2s'
            }}>
              <IoBriefcaseOutline size={20} />
              Professional
            </Link>
            
            <Link to="/bookmarks" onClick={onClose} style={{
              display: 'flex',
              alignItems: 'center',
              gap: '12px',
              padding: '16px 20px',
              textDecoration: 'none',
              color: '#1a1a1a',
              fontSize: '16px',
              fontWeight: '500',
              transition: 'background-color 0.2s'
            }}>
              <IoBookmarkOutline size={20} />
              Bookmarks
            </Link>
            
            <Link to="/settings" onClick={onClose} style={{
              display: 'flex',
              alignItems: 'center',
              gap: '12px',
              padding: '16px 20px',
              textDecoration: 'none',
              color: '#1a1a1a',
              fontSize: '16px',
              fontWeight: '500',
              transition: 'background-color 0.2s'
            }}>
              <IoSettingsOutline size={20} />
              Settings
            </Link>
          </div>
        </div>

        {/* Footer */}
        <div style={{
          padding: '20px',
          borderTop: '1px solid #e5e7eb'
        }}>
          {user ? (
            <div style={{
              display: 'flex',
              flexDirection: 'column',
              gap: '8px'
            }}>
              <button
                onClick={handleLogout}
                style={{
                  display: 'flex',
                  alignItems: 'center',
                  gap: '12px',
                  padding: '12px 16px',
                  background: 'none',
                  border: 'none',
                  color: '#ef4444',
                  fontSize: '14px',
                  fontWeight: '500',
                  borderRadius: '8px',
                  cursor: 'pointer',
                  transition: 'background-color 0.2s',
                  width: '100%',
                  textAlign: 'left'
                }}
              >
                <IoPersonOutline size={18} />
                Logout
              </button>
            </div>
          ) : (
            <div style={{
              display: 'flex',
              flexDirection: 'column',
              gap: '8px'
            }}>
              <Link to="/login" onClick={onClose} style={{
                display: 'flex',
                alignItems: 'center',
                gap: '12px',
                padding: '12px 16px',
                textDecoration: 'none',
                color: '#1a1a1a',
                fontSize: '14px',
                fontWeight: '500',
                borderRadius: '8px',
                transition: 'background-color 0.2s'
              }}>
                <IoPersonOutline size={18} />
                Login
              </Link>
              <Link to="/register" onClick={onClose} style={{
                display: 'flex',
                alignItems: 'center',
                gap: '12px',
                padding: '12px 16px',
                textDecoration: 'none',
                color: '#1a1a1a',
                fontSize: '14px',
                fontWeight: '500',
                borderRadius: '8px',
                transition: 'background-color 0.2s'
              }}>
                <IoPersonOutline size={18} />
                Sign Up
              </Link>
            </div>
          )}
        </div>
      </div>
    </>
  );
};

export default Sidebar; 