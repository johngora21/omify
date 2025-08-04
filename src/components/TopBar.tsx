import { Link, useNavigate, useLocation } from 'react-router-dom';
import { IoSearchOutline, IoHeartOutline, IoChatbubbleEllipsesOutline, IoPersonOutline } from 'react-icons/io5';
import type { User } from '../types';

interface TopBarProps {
  user: User | null;
  setUser: (user: User | null) => void;
  onMenuClick: () => void;
}

const TopBar = ({ user, setUser, onMenuClick }: TopBarProps) => {
  const navigate = useNavigate();
  const location = useLocation();
  const isHomePage = location.pathname === '/';
  
  const handleLogout = () => {
    setUser(null);
  };

  const handleSearchClick = () => {
    // Navigate to search page or open search modal
    navigate('/search');
  };

  const handleNotificationsClick = () => {
    // Navigate to notifications page
    navigate('/notifications');
  };

  return (
    <div style={{
      position: 'fixed',
      top: 0,
      left: 0,
      right: 0,
      height: '60px',
      background: 'white',
      borderBottom: '1px solid #dbdbdb',
      zIndex: 1000,
      display: 'flex',
      alignItems: 'center',
      padding: '0 16px',
      justifyContent: 'space-between'
    }}>
      {/* Left Side - Menu */}
      <div style={{ display: 'flex', alignItems: 'center' }}>
        <button
          onClick={onMenuClick}
          style={{
            background: 'rgba(0, 0, 0, 0.1)',
            border: 'none',
            cursor: 'pointer',
            padding: '8px',
            borderRadius: '50%',
            display: 'flex',
            alignItems: 'center',
            justifyContent: 'center',
            width: '40px',
            height: '40px'
          }}
        >
          <IoPersonOutline size={24} color="#262626" />
        </button>
      </div>

      {/* Center - Omify Brand */}
      <div style={{
        display: 'flex',
        alignItems: 'center',
        flex: 1,
        justifyContent: 'center'
      }}>
        <Link to="/" style={{
          textDecoration: 'none',
          display: 'flex',
          alignItems: 'center'
        }}>
          <span style={{
            fontSize: '20px',
            fontWeight: 'bold',
            background: 'linear-gradient(135deg, #667eea 0%, #764ba2 100%)',
            WebkitBackgroundClip: 'text',
            WebkitTextFillColor: 'transparent',
            backgroundClip: 'text',
            fontFamily: 'cursive'
          }}>
            Omify
          </span>
        </Link>
      </div>

      {/* Center - Search Bar (responsive) */}
      <div 
        className="search-bar"
        style={{
          flex: 1,
          maxWidth: '268px',
          margin: '0 auto',
          position: 'relative',
          display: 'none' // Hidden by default on mobile
        }}
      >
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
            placeholder="Search services..."
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

      {/* Right Side - Actions & User */}
      <div style={{ display: 'flex', alignItems: 'center', gap: '16px' }}>
        {user ? (
          <>
            {/* Search - Only show on homepage */}
            {isHomePage && (
              <button 
                onClick={handleSearchClick}
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
                <IoSearchOutline size={24} color="#262626" />
              </button>
            )}

            {/* Notifications */}
            <button 
              onClick={handleNotificationsClick}
              style={{
                background: 'none',
                border: 'none',
                cursor: 'pointer',
                padding: '8px',
                borderRadius: '8px',
                display: 'flex',
                alignItems: 'center',
                justifyContent: 'center',
                position: 'relative'
              }}
            >
              <IoHeartOutline size={24} color="#262626" />
              <span style={{
                position: 'absolute',
                top: '4px',
                right: '4px',
                width: '6px',
                height: '6px',
                background: '#ed4956',
                borderRadius: '50%'
              }}></span>
            </button>

            {/* Messages */}
            <Link to="/messages" style={{
              background: 'none',
              border: 'none',
              cursor: 'pointer',
              padding: '8px',
              borderRadius: '8px',
              display: 'flex',
              alignItems: 'center',
              justifyContent: 'center',
              textDecoration: 'none',
              color: '#262626'
            }}>
              <IoChatbubbleEllipsesOutline size={24} />
            </Link>

            {/* Profile Menu */}
            <div style={{ position: 'relative' }}>
              <Link to="/profile" style={{
                display: 'flex',
                alignItems: 'center',
                gap: '8px',
                textDecoration: 'none',
                color: '#262626'
              }}>
                <div style={{
                  width: '32px',
                  height: '32px',
                  borderRadius: '50%',
                  background: 'linear-gradient(135deg, #3b82f6 0%, #1d4ed8 100%)',
                  display: 'flex',
                  alignItems: 'center',
                  justifyContent: 'center',
                  color: 'white',
                  fontSize: '14px',
                  fontWeight: '600'
                }}>
                  {user.name.charAt(0).toUpperCase()}
                </div>
              </Link>
            </div>

            {/* Logout (hidden on mobile) */}
            <button
              onClick={handleLogout}
              style={{
                background: 'none',
                border: '1px solid #dbdbdb',
                color: '#262626',
                padding: '6px 12px',
                borderRadius: '8px',
                fontSize: '14px',
                fontWeight: '500',
                cursor: 'pointer',
                display: window.innerWidth > 768 ? 'block' : 'none'
              }}
            >
              Logout
            </button>
          </>
        ) : (
          <>
            {/* Search - Only show on homepage */}
            {isHomePage && (
              <button 
                onClick={handleSearchClick}
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
                <IoSearchOutline size={24} color="#262626" />
              </button>
            )}

            {/* Notifications */}
            <button 
              onClick={handleNotificationsClick}
              style={{
                background: 'none',
                border: 'none',
                cursor: 'pointer',
                padding: '8px',
                borderRadius: '8px',
                display: 'flex',
                alignItems: 'center',
                justifyContent: 'center',
                position: 'relative'
              }}
            >
              <IoHeartOutline size={24} color="#262626" />
              <span style={{
                position: 'absolute',
                top: '4px',
                right: '4px',
                width: '6px',
                height: '6px',
                background: '#ed4956',
                borderRadius: '50%'
              }}></span>
            </button>

            {/* Messages */}
            <Link to="/messages" style={{
              background: 'none',
              border: 'none',
              cursor: 'pointer',
              padding: '8px',
              borderRadius: '8px',
              display: 'flex',
              alignItems: 'center',
              justifyContent: 'center',
              textDecoration: 'none',
              color: '#262626'
            }}>
              <IoChatbubbleEllipsesOutline size={24} />
            </Link>
          </>
        )}
      </div>
    </div>
  );
};

export default TopBar;
