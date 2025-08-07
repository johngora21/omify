import { useState } from 'react';
import { useNavigate } from 'react-router-dom';
import { IoArrowBack, IoCheckmarkCircle, IoPersonOutline, IoShieldCheckmark, IoRocket } from 'react-icons/io5';
import { MdVerified } from 'react-icons/md';

const EroticRegistration = ({ onMenuClick }: { onMenuClick?: () => void }) => {
  const navigate = useNavigate();
  const [selectedCategory, setSelectedCategory] = useState('');
  const [isVerified, setIsVerified] = useState(false);

  const categories = [
    {
      id: 'dating',
      name: 'Dating',
      icon: '💕',
      description: 'Find meaningful connections and relationships',
      requirements: ['Profile Photos', 'Personal Description', 'Interests & Hobbies', 'Relationship Goals']
    },
    {
      id: 'massage',
      name: 'Massage Services',
      icon: '💆‍♀️',
      description: 'Professional massage and wellness services',
      requirements: ['Professional Photos', 'Service Description', 'Pricing Information', 'Certification (Optional)']
    },
    {
      id: 'escort',
      name: 'Companionship',
      icon: '👠',
      description: 'Companionship and escort services',
      requirements: ['Professional Photos', 'Service Description', 'Pricing Information', 'Availability Schedule']
    }
  ];

  const mockAnalytics = {
    profileViews: 1247,
    totalEarnings: 2840,
    bookings: 23,
    rating: 4.8
  };

  const handleRegistration = () => {
    console.log('Registration submitted for:', selectedCategory);
    
    // Navigate to specific registration page based on category
    switch(selectedCategory) {
      case 'dating':
        navigate('/dating-registration');
        break;
      case 'massage':
        navigate('/massage-registration');
        break;
      case 'escort':
        navigate('/escort-registration');
        break;
      default:
        alert('Please select a category first.');
    }
  };

  return (
    <div style={{
      minHeight: '100vh',
      background: 'white',
      padding: '20px',
      paddingBottom: '100px'
    }}>
      {/* Header */}
      <div style={{
        textAlign: 'center',
        marginBottom: '40px',
        position: 'relative'
      }}>
        <button
          onClick={() => navigate('/professional')}
          style={{
            position: 'absolute',
            top: '0',
            left: '0',
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
          fontSize: '28px',
          fontWeight: '700',
          color: '#1a1a1a',
          margin: '0 0 12px 0'
        }}>
          Erotic Services
        </h1>

      </div>

      {/* Category Selection */}
      <div style={{
        marginBottom: '32px'
      }}>
        <h2 style={{
          fontSize: '20px',
          fontWeight: '600',
          color: '#1a1a1a',
          marginBottom: '16px',
          textAlign: 'center'
        }}>
          Choose Your Category
        </h2>
        
        <div style={{
          display: 'grid',
          gridTemplateColumns: 'repeat(auto-fit, minmax(280px, 1fr))',
          gap: '16px',
          marginBottom: '24px'
        }}>
          {categories.map((category) => (
            <div
              key={category.id}
              onClick={() => setSelectedCategory(category.id)}
              style={{
                background: selectedCategory === category.id ? '#f3f4f6' : 'white',
                borderRadius: '16px',
                padding: '20px',
                cursor: 'pointer',
                border: selectedCategory === category.id ? '2px solid #3b82f6' : '2px solid #e5e7eb',
                transition: 'all 0.3s ease',
                boxShadow: '0 2px 8px rgba(0,0,0,0.1)'
              }}
            >
              <div style={{
                display: 'flex',
                alignItems: 'center',
                marginBottom: '12px'
              }}>
                <span style={{
                  fontSize: '32px',
                  marginRight: '12px'
                }}>
                  {category.icon}
                </span>
                <div>
                  <h3 style={{
                    fontSize: '18px',
                    fontWeight: '600',
                    color: '#1a1a1a',
                    margin: '0 0 4px 0'
                  }}>
                    {category.name}
                  </h3>
                  <p style={{
                    fontSize: '14px',
                    color: '#6b7280',
                    margin: 0
                  }}>
                    {category.description}
                  </p>
                </div>
              </div>
              
              <div style={{
                marginTop: '16px'
              }}>
                <h4 style={{
                  fontSize: '14px',
                  fontWeight: '600',
                  color: '#1a1a1a',
                  margin: '0 0 8px 0'
                }}>
                  Requirements:
                </h4>
                <ul style={{
                  listStyle: 'none',
                  padding: 0,
                  margin: 0
                }}>
                  {category.requirements.map((req, index) => (
                    <li key={index} style={{
                      fontSize: '12px',
                      color: '#6b7280',
                      marginBottom: '4px',
                      display: 'flex',
                      alignItems: 'center'
                    }}>
                      <IoCheckmarkCircle 
                        size={12} 
                        color="#10b981" 
                        style={{ marginRight: '8px' }}
                      />
                      {req}
                    </li>
                  ))}
                </ul>
              </div>
            </div>
          ))}
        </div>
      </div>





      {/* Call to Action */}
      <div style={{
        textAlign: 'center'
      }}>
        {selectedCategory ? (
          <button
            onClick={handleRegistration}
            style={{
              background: 'linear-gradient(135deg, #3b82f6, #1d4ed8)',
              color: 'white',
              border: 'none',
              borderRadius: '12px',
              padding: '16px 32px',
              fontSize: '16px',
              fontWeight: '600',
              cursor: 'pointer',
              transition: 'all 0.3s ease',
              boxShadow: '0 4px 12px rgba(16, 185, 129, 0.3)',
              marginBottom: '16px'
            }}
          >
            {selectedCategory === 'dating' ? 'Find Your Match' : 
             selectedCategory === 'massage' ? 'Register as Masseur' : 
             selectedCategory === 'escort' ? 'Register as Escort' : 
             'Register'}
          </button>
        ) : (
          <div style={{
            background: '#f3f4f6',
            borderRadius: '12px',
            padding: '16px',
            color: '#6b7280',
            fontSize: '14px'
          }}>
            Please select a category to continue
          </div>
        )}
      </div>
    </div>
  );
};

export default EroticRegistration; 