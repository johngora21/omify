import { Link, useLocation, useNavigate } from 'react-router-dom';
import { AiOutlineHome, AiFillHome } from 'react-icons/ai';
import { BiSpa } from 'react-icons/bi';
import { MdVideoLibrary } from 'react-icons/md';
import { IoRadioOutline, IoRadio } from 'react-icons/io5';
import { IoAdd } from 'react-icons/io5';

const BottomNav = () => {
  const location = useLocation();
  const navigate = useNavigate();

  const navItems = [
    { 
      path: '/', 
      label: 'Home', 
      icon: AiOutlineHome,
      activeIcon: AiFillHome
    },
    { 
      path: '/erotic', 
      label: 'Erotic', 
      icon: BiSpa,
      activeIcon: BiSpa
    },
    { 
      path: '/reels', 
      label: 'Reels', 
      icon: MdVideoLibrary,
      activeIcon: MdVideoLibrary
    },
    { 
              path: '/entertainment',
        label: 'Entertainment', 
      icon: IoRadioOutline,
      activeIcon: IoRadio
    },
  ];

  return (
    <div style={{
      position: 'fixed',
      bottom: 0,
      left: 0,
      right: 0,
      height: '70px',
      background: 'rgba(255, 255, 255, 0.95)',
      backdropFilter: 'blur(10px)',
      borderTop: '1px solid rgba(229, 231, 235, 0.3)',
      zIndex: 1000,
      display: 'flex',
      alignItems: 'center',
      padding: '0 16px',
      boxShadow: '0 -4px 6px -1px rgba(0, 0, 0, 0.1)',
      maxWidth: '100vw',
      overflowX: 'hidden'
    }}>
      {/* Left side navigation items */}
      <div style={{ display: 'flex', flex: 1, justifyContent: 'space-around' }}>
        {navItems.slice(0, 2).map((item) => {
          const isActive = location.pathname === item.path;
          const IconComponent = isActive ? item.activeIcon : item.icon;
          
          return (
            <Link
              key={item.path}
              to={item.path}
              style={{
                display: 'flex',
                alignItems: 'center',
                justifyContent: 'center',
                textDecoration: 'none',
                padding: '12px',
                borderRadius: '12px',
                transition: 'all 0.2s ease',
                background: isActive ? 'rgba(59, 130, 246, 0.1)' : 'transparent',
                color: isActive ? '#3b82f6' : '#6b7280',
                minWidth: '50px',
                minHeight: '50px'
              }}
            >
              <IconComponent 
                size={26} 
                style={{
                  transition: 'all 0.2s ease'
                }}
              />
            </Link>
          );
        })}
      </div>

      {/* Center Add Post Button */}
      <div style={{
        display: 'flex',
        alignItems: 'center',
        justifyContent: 'center',
        padding: '8px',
        minWidth: '80px'
      }}>
        <button
          onClick={() => navigate('/create')}
          style={{
            width: '56px',
            height: '56px',
            borderRadius: '50%',
            background: 'linear-gradient(135deg, #667eea 0%, #764ba2 100%)',
            border: 'none',
            display: 'flex',
            alignItems: 'center',
            justifyContent: 'center',
            cursor: 'pointer',
            transition: 'all 0.2s ease',
            boxShadow: '0 4px 12px rgba(102, 126, 234, 0.4)'
          }}
          onMouseEnter={(e) => {
            e.currentTarget.style.transform = 'scale(1.1)';
            e.currentTarget.style.boxShadow = '0 6px 16px rgba(102, 126, 234, 0.6)';
          }}
          onMouseLeave={(e) => {
            e.currentTarget.style.transform = 'scale(1)';
            e.currentTarget.style.boxShadow = '0 4px 12px rgba(102, 126, 234, 0.4)';
          }}
        >
          <IoAdd size={28} color="white" />
        </button>
      </div>

      {/* Right side navigation items */}
      <div style={{ display: 'flex', flex: 1, justifyContent: 'space-around' }}>
        {navItems.slice(2).map((item) => {
          const isActive = location.pathname === item.path;
          const IconComponent = isActive ? item.activeIcon : item.icon;
          
          return (
            <Link
              key={item.path}
              to={item.path}
              style={{
                display: 'flex',
                alignItems: 'center',
                justifyContent: 'center',
                textDecoration: 'none',
                padding: '12px',
                borderRadius: '12px',
                transition: 'all 0.2s ease',
                background: isActive ? 'rgba(59, 130, 246, 0.1)' : 'transparent',
                color: isActive ? '#3b82f6' : '#6b7280',
                minWidth: '50px',
                minHeight: '50px'
              }}
            >
              <IconComponent 
                size={26} 
                style={{
                  transition: 'all 0.2s ease'
                }}
              />
            </Link>
          );
        })}
      </div>
    </div>
  );
};

export default BottomNav;
