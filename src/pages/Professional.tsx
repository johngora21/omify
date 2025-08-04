import { useState } from 'react';
import { useNavigate } from 'react-router-dom';
import { IoArrowBack, IoStar, IoPeople, IoTrendingUp, IoWallet, IoAnalytics, IoStorefront, IoRestaurant, IoCar, IoHome, IoHeart, IoBook, IoSchool, IoBriefcase, IoFitness, IoCut, IoCarSport, IoMedical, IoShirt, IoConstruct, IoAdd, IoImage, IoPricetag, IoLocation, IoPlay } from 'react-icons/io5';
import { MdVerified } from 'react-icons/md';

const Professional = ({ onMenuClick }: { onMenuClick?: () => void }) => {
  const navigate = useNavigate();
  const [selectedCategory, setSelectedCategory] = useState('');

  const professionalCategories = [
    {
      id: 'influencer',
      title: 'Social Media Influencer',
      icon: <IoPeople size={32} />,
      description: 'Monetize your social media presence and influence',
      examples: ['Content creation', 'Brand partnerships', 'Sponsored posts']
    },
    {
      id: 'celebrity',
      title: 'Celebrity & Public Figure',
      icon: <MdVerified size={32} />,
      description: 'Leverage your fame and public recognition',
      examples: ['Endorsements', 'Appearances', 'Exclusive content']
    },
    {
      id: 'content-creator',
      title: 'Content Creator',
      icon: <IoImage size={32} />,
      description: 'Create engaging content and build your audience',
      examples: ['Videos', 'Photos', 'Blogs', 'Live streams']
    },
    {
      id: 'podcaster',
      title: 'Podcaster',
      icon: <IoPlay size={32} />,
      description: 'Monetize your podcast and audio content',
      examples: ['Podcast episodes', 'Interviews', 'Exclusive audio']
    },
    {
      id: 'streamer',
      title: 'Live Streamer',
      icon: <IoPlay size={32} />,
      description: 'Build your audience through live streaming',
      examples: ['Gaming streams', 'Live events', 'Interactive content']
    },
    {
      id: 'blogger',
      title: 'Blogger & Writer',
      icon: <IoBook size={32} />,
      description: 'Share your expertise through written content',
      examples: ['Blog posts', 'Articles', 'E-books', 'Newsletters']
    },
    {
      id: 'photographer',
      title: 'Photographer & Videographer',
      icon: <IoImage size={32} />,
      description: 'Showcase your visual content and skills',
      examples: ['Photo shoots', 'Video content', 'Visual storytelling']
    },
    {
      id: 'model',
      title: 'Model & Fashion',
      icon: <IoShirt size={32} />,
      description: 'Monetize your modeling and fashion content',
      examples: ['Fashion shoots', 'Style content', 'Brand collaborations']
    },
    {
      id: 'musician',
      title: 'Musician & Artist',
      icon: <IoPlay size={32} />,
      description: 'Share your music and artistic talents',
      examples: ['Music releases', 'Performances', 'Exclusive content']
    },
    {
      id: 'comedian',
      title: 'Comedian & Entertainer',
      icon: <IoPeople size={32} />,
      description: 'Entertain and engage your audience',
      examples: ['Comedy content', 'Performances', 'Entertainment']
    },
    {
      id: 'fitness-influencer',
      title: 'Fitness Influencer',
      icon: <IoFitness size={32} />,
      description: 'Inspire and motivate through fitness content',
      examples: ['Workout videos', 'Fitness tips', 'Wellness content']
    },
    {
      id: 'business-expert',
      title: 'Business Expert',
      icon: <IoBriefcase size={32} />,
      description: 'Share your business knowledge and insights',
      examples: ['Business advice', 'Consulting', 'Educational content']
    }
  ];

  const handleCategorySelect = (categoryId: string) => {
    setSelectedCategory(categoryId);
  };

  const handleJoinAsCreator = () => {
    if (selectedCategory) {
      navigate(`/join-creator/${selectedCategory}`);
    }
  };

  return (
    <div style={{
      minHeight: '100vh',
      background: 'white',
      paddingBottom: '80px'
    }}>
      {/* Header */}
      <div style={{
        background: 'linear-gradient(135deg, #667eea 0%, #764ba2 100%)',
        padding: '20px 16px',
        position: 'relative'
      }}>
        {/* Back Arrow */}
        <button
          onClick={() => onMenuClick ? onMenuClick() : navigate(-1)}
          style={{
            position: 'absolute',
            top: '50%',
            left: '16px',
            transform: 'translateY(-50%)',
            background: 'rgba(255, 255, 255, 0.2)',
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
          <IoArrowBack size={20} color="white" />
        </button>
        
        {/* Title */}
        <div style={{
          textAlign: 'center',
          color: 'white'
        }}>
          <h1 style={{
            fontSize: '24px',
            fontWeight: '700',
            margin: '0 0 8px 0'
          }}>
            Professional Creator
          </h1>
          <p style={{
            fontSize: '16px',
            margin: 0,
            opacity: 0.9
          }}>
            Monetize your influence and get paid for bringing traffic
          </p>
        </div>
      </div>

      {/* Stats Section */}
      <div style={{
        padding: '20px 16px',
        background: 'white'
      }}>
        <div style={{
          display: 'grid',
          gridTemplateColumns: 'repeat(3, 1fr)',
          gap: '16px',
          marginBottom: '24px'
        }}>
          <div style={{
            textAlign: 'center',
            padding: '16px',
            background: '#f8f9fa',
            borderRadius: '12px'
          }}>
            <IoPeople size={24} color="#3b82f6" style={{ marginBottom: '8px' }} />
            <div style={{ fontSize: '20px', fontWeight: '700', color: '#1a1a1a' }}>10K+</div>
            <div style={{ fontSize: '12px', color: '#6b7280' }}>Active Creators</div>
          </div>
          <div style={{
            textAlign: 'center',
            padding: '16px',
            background: '#f8f9fa',
            borderRadius: '12px'
          }}>
            <IoWallet size={24} color="#10b981" style={{ marginBottom: '8px' }} />
            <div style={{ fontSize: '20px', fontWeight: '700', color: '#1a1a1a' }}>$2M+</div>
            <div style={{ fontSize: '12px', color: '#6b7280' }}>Paid to Creators</div>
          </div>
          <div style={{
            textAlign: 'center',
            padding: '16px',
            background: '#f8f9fa',
            borderRadius: '12px'
          }}>
            <IoTrendingUp size={24} color="#f59e0b" style={{ marginBottom: '8px' }} />
            <div style={{ fontSize: '20px', fontWeight: '700', color: '#1a1a1a' }}>500K+</div>
            <div style={{ fontSize: '12px', color: '#6b7280' }}>Traffic Generated</div>
          </div>
        </div>
      </div>

      {/* Benefits Section */}
      <div style={{
        padding: '0 16px 24px 16px',
        background: 'white'
      }}>
        <h2 style={{
          fontSize: '20px',
          fontWeight: '600',
          color: '#1a1a1a',
          marginBottom: '16px'
        }}>
          Why Join as a Professional Creator?
        </h2>
        <div style={{
          display: 'grid',
          gridTemplateColumns: 'repeat(2, 1fr)',
          gap: '12px'
        }}>
          <div style={{
            display: 'flex',
            alignItems: 'center',
            gap: '12px',
            padding: '12px',
            background: '#f0f9ff',
            borderRadius: '8px'
          }}>
            <IoWallet size={20} color="#3b82f6" />
            <div>
              <div style={{ fontSize: '14px', fontWeight: '600', color: '#1a1a1a' }}>Get Paid</div>
              <div style={{ fontSize: '12px', color: '#6b7280' }}>Earn money for bringing traffic</div>
            </div>
          </div>
          <div style={{
            display: 'flex',
            alignItems: 'center',
            gap: '12px',
            padding: '12px',
            background: '#f0fdf4',
            borderRadius: '8px'
          }}>
            <IoAnalytics size={20} color="#10b981" />
            <div>
              <div style={{ fontSize: '14px', fontWeight: '600', color: '#1a1a1a' }}>Track Earnings</div>
              <div style={{ fontSize: '12px', color: '#6b7280' }}>Monitor your revenue and growth</div>
            </div>
          </div>
          <div style={{
            display: 'flex',
            alignItems: 'center',
            gap: '12px',
            padding: '12px',
            background: '#fef3c7',
            borderRadius: '8px'
          }}>
            <IoTrendingUp size={20} color="#f59e0b" />
            <div>
              <div style={{ fontSize: '14px', fontWeight: '600', color: '#1a1a1a' }}>Grow Audience</div>
              <div style={{ fontSize: '12px', color: '#6b7280' }}>Build your following and influence</div>
            </div>
          </div>
          <div style={{
            display: 'flex',
            alignItems: 'center',
            gap: '12px',
            padding: '12px',
            background: '#f3e8ff',
            borderRadius: '8px'
          }}>
            <MdVerified size={20} color="#8b5cf6" />
            <div>
              <div style={{ fontSize: '14px', fontWeight: '600', color: '#1a1a1a' }}>Verified Creator</div>
              <div style={{ fontSize: '12px', color: '#6b7280' }}>Build credibility and trust</div>
            </div>
          </div>
        </div>
      </div>

      {/* Categories Section */}
      <div style={{
        padding: '0 16px 24px 16px',
        background: 'white'
      }}>
        <h2 style={{
          fontSize: '20px',
          fontWeight: '600',
          color: '#1a1a1a',
          marginBottom: '16px'
        }}>
          Select Your Professional Category
        </h2>
        <div style={{
          display: 'grid',
          gridTemplateColumns: 'repeat(2, 1fr)',
          gap: '12px'
        }}>
          {professionalCategories.map((category) => (
            <div
              key={category.id}
              onClick={() => handleCategorySelect(category.id)}
              style={{
                padding: '16px',
                border: selectedCategory === category.id ? '2px solid #3b82f6' : '2px solid #e5e7eb',
                borderRadius: '12px',
                cursor: 'pointer',
                background: selectedCategory === category.id ? '#eff6ff' : 'white',
                transition: 'all 0.2s ease'
              }}
            >
              <div style={{
                display: 'flex',
                alignItems: 'center',
                gap: '12px',
                marginBottom: '8px'
              }}>
                <div style={{ color: '#3b82f6' }}>
                  {category.icon}
                </div>
                <div style={{
                  fontSize: '14px',
                  fontWeight: '600',
                  color: '#1a1a1a'
                }}>
                  {category.title}
                </div>
              </div>
              <div style={{
                fontSize: '12px',
                color: '#6b7280',
                marginBottom: '8px',
                lineHeight: '1.4'
              }}>
                {category.description}
              </div>
              <div style={{
                fontSize: '11px',
                color: '#10b981',
                marginBottom: '6px'
              }}>
                Examples: {category.examples[0]}
              </div>
              <div style={{
                fontSize: '10px',
                color: '#9ca3af'
              }}>
                {category.examples.length} examples
              </div>
            </div>
          ))}
        </div>
      </div>

      {/* Post Item Button */}
      {selectedCategory && (
        <div style={{
          padding: '20px 16px',
          background: 'white',
          borderTop: '1px solid #e5e7eb'
        }}>
          <button
            onClick={handleJoinAsCreator}
            style={{
              width: '100%',
              padding: '16px',
              background: 'linear-gradient(135deg, #3b82f6, #1d4ed8)',
              color: 'white',
              border: 'none',
              borderRadius: '12px',
              fontSize: '16px',
              fontWeight: '600',
              cursor: 'pointer',
              transition: 'all 0.2s ease',
              display: 'flex',
              alignItems: 'center',
              justifyContent: 'center',
              gap: '8px'
            }}
            onMouseEnter={(e) => e.currentTarget.style.transform = 'scale(1.02)'}
            onMouseLeave={(e) => e.currentTarget.style.transform = 'scale(1)'}
          >
            <IoAdd size={20} />
            Join as {professionalCategories.find(c => c.id === selectedCategory)?.title}
          </button>
        </div>
      )}
    </div>
  );
};

export default Professional; 