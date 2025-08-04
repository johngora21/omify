import { Link } from 'react-router-dom';
import type { User } from '../types';

interface NavbarProps {
  user: User | null;
  setUser: (user: User | null) => void;
}

const Navbar = ({ user, setUser }: NavbarProps) => {
  const handleLogout = () => {
    setUser(null);
  };

  return (
    <nav style={{
      background: 'rgba(255, 255, 255, 0.1)',
      backdropFilter: 'blur(10px)',
      borderBottom: '1px solid rgba(255, 255, 255, 0.2)',
      position: 'sticky',
      top: 0,
      zIndex: 50,
      padding: '0 1rem'
    }}>
      <div style={{
        maxWidth: '80rem',
        margin: '0 auto',
        display: 'flex',
        justifyContent: 'space-between',
        alignItems: 'center',
        height: '80px'
      }}>
        <div style={{ display: 'flex', alignItems: 'center' }}>
          <Link to="/" style={{ 
            textDecoration: 'none',
            fontSize: '1.875rem',
            fontWeight: 'bold',
            background: 'linear-gradient(135deg, #db2777 0%, #8b5cf6 100%)',
            WebkitBackgroundClip: 'text',
            WebkitTextFillColor: 'transparent',
            backgroundClip: 'text'
          }}>
            AdultConnect
          </Link>
          <div style={{ 
            display: 'none', 
            marginLeft: '2rem',
            gap: '2rem'
          }}>
            <Link to="/" style={{
              color: '#374151',
              fontWeight: '500',
              textDecoration: 'none',
              padding: '8px 12px',
              transition: 'color 0.2s ease'
            }}>
              Home
            </Link>
            <Link to="/browse" style={{
              color: '#374151',
              fontWeight: '500',
              textDecoration: 'none',
              padding: '8px 12px',
              transition: 'color 0.2s ease'
            }}>
              Browse Services
            </Link>
          </div>
        </div>
        
        <div style={{ display: 'flex', alignItems: 'center', gap: '1rem' }}>
          {user ? (
            <div style={{ display: 'flex', alignItems: 'center', gap: '1rem' }}>
              <span style={{ color: '#374151', fontWeight: '500' }}>
                Welcome, {user.name}
              </span>
              <button
                onClick={handleLogout}
                style={{
                  background: 'white',
                  color: '#374151',
                  fontWeight: '600',
                  padding: '12px 24px',
                  borderRadius: '12px',
                  border: '1px solid #e5e7eb',
                  cursor: 'pointer',
                  transition: 'all 0.3s ease'
                }}
              >
                Logout
              </button>
            </div>
          ) : (
            <div style={{ display: 'flex', alignItems: 'center', gap: '1rem' }}>
              <Link to="/login" style={{
                color: '#374151',
                fontWeight: '500',
                textDecoration: 'none',
                padding: '8px 12px',
                transition: 'color 0.2s ease'
              }}>
                Login
              </Link>
              <Link to="/register" style={{
                background: 'linear-gradient(135deg, #ec4899 0%, #8b5cf6 100%)',
                color: 'white',
                fontWeight: '600',
                padding: '12px 24px',
                borderRadius: '12px',
                textDecoration: 'none',
                transition: 'all 0.3s ease'
              }}>
                Join Now
              </Link>
            </div>
          )}
        </div>
      </div>
    </nav>
  );
};

export default Navbar; 