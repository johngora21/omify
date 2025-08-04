import { useState } from 'react';
import { IoBriefcaseOutline, IoCheckmarkCircle, IoStar, IoLocationOutline, IoPersonOutline, IoShieldCheckmark, IoRocket } from 'react-icons/io5';
import { MdVerified } from 'react-icons/md';

const Professional = () => {
  const [selectedCategory, setSelectedCategory] = useState('');
  const [isVerified, setIsVerified] = useState(false);

  const categories = [
    {
      id: 'massage',
      name: 'Massage Services',
      icon: '💆‍♀️',
      description: 'Swedish, Deep Tissue, Hot Stone, Nuru Massage',
      requirements: ['Valid ID', 'Background Check', 'Professional Photos']
    },
    {
      id: 'escort',
      name: 'Escort Services',
      icon: '👠',
      description: 'Companionship, Intimate Services, Travel Companion',
      requirements: ['Valid ID', 'Background Check', 'Professional Photos', 'Age Verification']
    },
    {
      id: 'dancer',
      name: 'Dance & Entertainment',
      icon: '💃',
      description: 'Stripper, Pole Dance, Private Shows',
      requirements: ['Valid ID', 'Background Check', 'Professional Photos']
    },
    {
      id: 'photographer',
      name: 'Photography',
      icon: '📸',
      description: 'Professional Photography, Boudoir Shoots',
      requirements: ['Valid ID', 'Portfolio Review', 'Professional Photos']
    }
  ];

  const benefits = [
    {
      title: 'Earn More Money',
      description: 'Set your own rates and earn significantly more than regular jobs',
      icon: <IoStar size={24} color="#f59e0b" />
    },
    {
      title: 'Flexible Schedule',
      description: 'Work when you want, where you want, on your own terms',
      icon: <IoBriefcaseOutline size={24} color="#3b82f6" />
    },
    {
      title: 'Verified Badge',
      description: 'Get a verified badge to build trust with clients',
      icon: <MdVerified size={24} color="#10b981" />
    },
    {
      title: 'Priority Support',
      description: 'Get dedicated support for professional providers',
      icon: <IoShieldCheckmark size={24} color="#8b5cf6" />
    }
  ];

  const handleUpgrade = () => {
    // In a real app, this would handle the upgrade process
    console.log('Upgrading to professional account...');
    alert('Professional upgrade request submitted! We will review your application within 24-48 hours.');
  };

  return (
    <div style={{
      minHeight: '100vh',
      background: 'linear-gradient(135deg, #667eea 0%, #764ba2 100%)',
      padding: '20px',
      paddingBottom: '100px',
      maxWidth: '100vw',
      overflowX: 'hidden'
    }}>
      {/* Header */}
      <div style={{
        textAlign: 'center',
        marginBottom: '32px'
      }}>
        <div style={{
          display: 'flex',
          alignItems: 'center',
          justifyContent: 'center',
          gap: '12px',
          marginBottom: '16px'
        }}>
          <IoBriefcaseOutline size={32} color="white" />
          <h1 style={{
            fontSize: '32px',
            fontWeight: '700',
            color: 'white',
            margin: 0
          }}>
            Become a Professional
          </h1>
        </div>
        <p style={{
          fontSize: '18px',
          color: 'rgba(255,255,255,0.9)',
          margin: 0,
          maxWidth: '600px',
          marginLeft: 'auto',
          marginRight: 'auto'
        }}>
          Start earning money by offering your services to clients. Join thousands of successful professionals.
        </p>
      </div>

      {/* Benefits */}
      <div style={{
        background: 'white',
        borderRadius: '20px',
        padding: '32px',
        marginBottom: '24px',
        boxShadow: '0 8px 24px rgba(0,0,0,0.1)'
      }}>
        <h2 style={{
          fontSize: '24px',
          fontWeight: '700',
          color: '#1a1a1a',
          textAlign: 'center',
          marginBottom: '32px'
        }}>
          Why Become a Professional?
        </h2>
        <div style={{
          display: 'grid',
          gridTemplateColumns: 'repeat(auto-fit, minmax(250px, 1fr))',
          gap: '24px',
          maxWidth: '100%'
        }}>
          {benefits.map((benefit, index) => (
            <div key={index} style={{
              textAlign: 'center',
              padding: '20px',
              borderRadius: '12px',
              background: '#f9fafb',
              border: '1px solid #e5e7eb'
            }}>
              <div style={{ marginBottom: '16px' }}>
                {benefit.icon}
              </div>
              <h3 style={{
                fontSize: '18px',
                fontWeight: '600',
                color: '#1a1a1a',
                marginBottom: '8px'
              }}>
                {benefit.title}
              </h3>
              <p style={{
                fontSize: '14px',
                color: '#6b7280',
                margin: 0
              }}>
                {benefit.description}
              </p>
            </div>
          ))}
        </div>
      </div>

      {/* Service Categories */}
      <div style={{
        background: 'white',
        borderRadius: '20px',
        padding: '32px',
        marginBottom: '24px',
        boxShadow: '0 8px 24px rgba(0,0,0,0.1)'
      }}>
        <h2 style={{
          fontSize: '24px',
          fontWeight: '700',
          color: '#1a1a1a',
          textAlign: 'center',
          marginBottom: '32px'
        }}>
          Choose Your Service Category
        </h2>
        <div style={{
          display: 'grid',
          gridTemplateColumns: 'repeat(auto-fit, minmax(280px, 1fr))',
          gap: '20px',
          maxWidth: '100%'
        }}>
          {categories.map((category) => (
            <div
              key={category.id}
              onClick={() => setSelectedCategory(category.id)}
              style={{
                padding: '24px',
                borderRadius: '16px',
                border: selectedCategory === category.id ? '2px solid #667eea' : '1px solid #e5e7eb',
                background: selectedCategory === category.id ? '#f0f4ff' : 'white',
                cursor: 'pointer',
                transition: 'all 0.3s ease',
                boxShadow: selectedCategory === category.id ? '0 4px 12px rgba(102, 126, 234, 0.2)' : '0 2px 8px rgba(0,0,0,0.08)'
              }}
            >
              <div style={{
                display: 'flex',
                alignItems: 'center',
                gap: '12px',
                marginBottom: '12px'
              }}>
                <span style={{ fontSize: '24px' }}>{category.icon}</span>
                <h3 style={{
                  fontSize: '18px',
                  fontWeight: '600',
                  color: '#1a1a1a',
                  margin: 0
                }}>
                  {category.name}
                </h3>
              </div>
              <p style={{
                fontSize: '14px',
                color: '#6b7280',
                marginBottom: '16px'
              }}>
                {category.description}
              </p>
              <div>
                <h4 style={{
                  fontSize: '14px',
                  fontWeight: '600',
                  color: '#1a1a1a',
                  marginBottom: '8px'
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
                      display: 'flex',
                      alignItems: 'center',
                      gap: '8px',
                      fontSize: '12px',
                      color: '#6b7280',
                      marginBottom: '4px'
                    }}>
                      <IoCheckmarkCircle size={14} color="#10b981" />
                      {req}
                    </li>
                  ))}
                </ul>
              </div>
            </div>
          ))}
        </div>
      </div>

      {/* Verification Status */}
      <div style={{
        background: 'white',
        borderRadius: '20px',
        padding: '32px',
        marginBottom: '24px',
        boxShadow: '0 8px 24px rgba(0,0,0,0.1)'
      }}>
        <h2 style={{
          fontSize: '24px',
          fontWeight: '700',
          color: '#1a1a1a',
          textAlign: 'center',
          marginBottom: '32px'
        }}>
          Verification Status
        </h2>
        <div style={{
          display: 'flex',
          alignItems: 'center',
          justifyContent: 'center',
          gap: '12px',
          marginBottom: '24px'
        }}>
          <div style={{
            width: '60px',
            height: '60px',
            borderRadius: '50%',
            background: isVerified ? '#10b981' : '#f59e0b',
            display: 'flex',
            alignItems: 'center',
            justifyContent: 'center',
            color: 'white',
            fontSize: '24px'
          }}>
            {isVerified ? <IoCheckmarkCircle size={32} /> : <IoPersonOutline size={32} />}
          </div>
          <div>
            <h3 style={{
              fontSize: '18px',
              fontWeight: '600',
              color: '#1a1a1a',
              margin: 0
            }}>
              {isVerified ? 'Verified Account' : 'Pending Verification'}
            </h3>
            <p style={{
              fontSize: '14px',
              color: '#6b7280',
              margin: 0
            }}>
              {isVerified ? 'Your account has been verified' : 'Complete verification to start earning'}
            </p>
          </div>
        </div>
        {!isVerified && (
          <div style={{
            background: '#fef3c7',
            border: '1px solid #f59e0b',
            borderRadius: '12px',
            padding: '16px',
            textAlign: 'center'
          }}>
            <p style={{
              fontSize: '14px',
              color: '#92400e',
              margin: 0
            }}>
              ⚠️ Verification typically takes 24-48 hours. You can still apply for professional status while verification is pending.
            </p>
          </div>
        )}
      </div>

      {/* Upgrade Button */}
      <div style={{
        background: 'white',
        borderRadius: '20px',
        padding: '32px',
        textAlign: 'center',
        boxShadow: '0 8px 24px rgba(0,0,0,0.1)'
      }}>
        <h2 style={{
          fontSize: '24px',
          fontWeight: '700',
          color: '#1a1a1a',
          marginBottom: '16px'
        }}>
          Ready to Start Earning?
        </h2>
        <p style={{
          fontSize: '16px',
          color: '#6b7280',
          marginBottom: '32px',
          maxWidth: '500px',
          marginLeft: 'auto',
          marginRight: 'auto'
        }}>
          Join thousands of successful professionals who are already earning on our platform.
        </p>
        <button
          onClick={handleUpgrade}
          disabled={!selectedCategory}
          style={{
            background: selectedCategory ? 'linear-gradient(135deg, #667eea 0%, #764ba2 100%)' : '#e5e7eb',
            color: selectedCategory ? 'white' : '#9ca3af',
            padding: '16px 32px',
            borderRadius: '12px',
            border: 'none',
            fontSize: '18px',
            fontWeight: '600',
            cursor: selectedCategory ? 'pointer' : 'not-allowed',
            transition: 'all 0.3s ease',
            boxShadow: selectedCategory ? '0 4px 12px rgba(102, 126, 234, 0.3)' : 'none',
            display: 'flex',
            alignItems: 'center',
            gap: '12px',
            margin: '0 auto'
          }}
        >
          <IoRocket size={20} />
          {selectedCategory ? 'Apply for Professional Status' : 'Select a Category First'}
        </button>
        {selectedCategory && (
          <p style={{
            fontSize: '14px',
            color: '#6b7280',
            marginTop: '16px',
            margin: 0
          }}>
            Application fee: $25 (one-time)
          </p>
        )}
      </div>
    </div>
  );
};

export default Professional; 