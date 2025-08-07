import { useState } from 'react';
import { useNavigate } from 'react-router-dom';
import { IoStar, IoCheckmarkCircle, IoDiamond, IoRocket, IoArrowBack, IoPlayCircle, IoHeart, IoDownload, IoEye, IoShieldCheckmark, IoPerson, IoChatbubbles, IoVideocam, IoLocation, IoBed, IoCar, IoBriefcaseOutline, IoBookmarkOutline, IoNotifications } from 'react-icons/io5';
import { FaCrown, FaRegHeart, FaRegBookmark, FaUsers, FaMapMarkedAlt, FaHotel, FaCar, FaMountain } from 'react-icons/fa';
import { MdSportsSoccer, MdMovie, MdLiveTv, MdVerified, MdFavorite, MdBusiness, MdExplore, MdTravelExplore } from 'react-icons/md';

const Premium = ({ onMenuClick }: { onMenuClick?: () => void }) => {
  const navigate = useNavigate();
  const [selectedPlan, setSelectedPlan] = useState('monthly');

  const plans = [
    {
      id: 'basic',
      name: 'Basic',
      price: selectedPlan === 'monthly' ? 4.99 : 49.99,
      period: selectedPlan === 'monthly' ? 'month' : 'year',
      features: [
        'Unlimited social networking',
        'Basic dating features',
        'Standard messaging',
        'Entertainment content',
        'Basic professional features',
        'Limited travel bookings',
        'Standard support'
      ],
      popular: false,
      icon: <IoStar size={24} color="#6b7280" />
    },
    {
      id: 'premium',
      name: 'Premium',
      price: selectedPlan === 'monthly' ? 9.99 : 99.99,
      period: selectedPlan === 'monthly' ? 'month' : 'year',
      features: [
        'Everything in Basic',
        'Advanced dating features',
        'Priority messaging',
        'Verified badge',
        'Professional dashboard',
        'Unlimited travel bookings',
        'Premium entertainment',
        'Advanced filters',
        'Multiple devices (4)',
        'Priority support'
      ],
      popular: true,
      icon: <IoDiamond size={24} color="#f59e0b" />
    },
    {
      id: 'vip',
      name: 'VIP',
      price: selectedPlan === 'monthly' ? 19.99 : 199.99,
      period: selectedPlan === 'monthly' ? 'month' : 'year',
      features: [
        'Everything in Premium',
        'VIP early access',
        'Exclusive content',
        'Personalized recommendations',
        'Unlimited devices',
        'VIP dating features',
        'Premium travel services',
        'Concierge support',
        'Priority customer support',
        'Exclusive events access'
      ],
      popular: false,
      icon: <FaCrown size={24} color="#8b5cf6" />
    }
  ];

  const appFeatures = [
    {
      icon: <MdFavorite size={32} color="#ec4899" />,
      title: 'Social & Dating',
      description: 'Advanced matching, unlimited messaging, stories, reels, and social networking'
    },
    {
      icon: <MdBusiness size={32} color="#3b82f6" />,
      title: 'Professional Services',
      description: 'Professional creator accounts, wellness, massage, escort services, and business tools'
    },
    {
      icon: <MdMovie size={32} color="#10b981" />,
      title: 'Entertainment',
      description: 'Movies, TV shows, live sports, music, and exclusive entertainment content'
    },
    {
      icon: <MdTravelExplore size={32} color="#f59e0b" />,
      title: 'Travel & Explore',
      description: 'Hotels, car rentals, adventures, safaris, and travel booking services'
    }
  ];

  const categoryFeatures = [
    {
      title: 'Social Features',
      features: [
        'Unlimited stories and reels',
        'Advanced matching algorithms',
        'Priority messaging',
        'Verified badges',
        'Social networking tools',
        'Live streaming capabilities'
      ],
      icon: <FaUsers size={24} color="#ec4899" />
    },
    {
      title: 'Professional Services',
      features: [
        'Professional creator accounts',
        'Wellness & massage services',
        'Escort service listings',
        'Business analytics dashboard',
        'Service provider profiles',
        'Booking management tools'
      ],
      icon: <MdBusiness size={24} color="#3b82f6" />
    },
    {
      title: 'Entertainment',
      features: [
        'Unlimited movie streaming',
        'Live sports coverage',
        'TV shows and series',
        'Music and podcasts',
        'Exclusive content access',
        'Offline downloads'
      ],
      icon: <MdMovie size={24} color="#10b981" />
    },
    {
      title: 'Travel & Explore',
      features: [
        'Hotel & BnB bookings',
        'Car rental services',
        'Adventure & safari tours',
        'Travel planning tools',
        'Location-based services',
        'Travel insurance options'
      ],
      icon: <MdTravelExplore size={24} color="#f59e0b" />
    }
  ];

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
        marginBottom: '32px',
        position: 'relative'
      }}>
        {/* Back Arrow */}
        <button
          onClick={() => navigate('/')}
          style={{
            position: 'absolute',
            top: '0',
            left: '0',
            background: 'rgba(255, 255, 255, 0.2)',
            border: 'none',
            borderRadius: '50%',
            width: '40px',
            height: '40px',
            display: 'flex',
            alignItems: 'center',
            justifyContent: 'center',
            cursor: 'pointer',
            zIndex: 10,
            transition: 'all 0.2s ease'
          }}
        >
          <IoArrowBack size={20} color="white" />
        </button>
        <div style={{
          display: 'flex',
          alignItems: 'center',
          justifyContent: 'center',
          gap: '12px',
          marginBottom: '16px'
        }}>
          <IoRocket size={32} color="white" />
          <h1 style={{
            fontSize: '32px',
            fontWeight: '700',
            color: 'white',
            margin: 0
          }}>
            Upgrade to Premium
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
          Unlock unlimited social networking, professional services, entertainment, and travel features
        </p>
      </div>

      {/* App Features */}
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
          Premium App Features
        </h2>
        <div style={{
          display: 'grid',
          gridTemplateColumns: 'repeat(auto-fit, minmax(250px, 1fr))',
          gap: '24px'
        }}>
          {appFeatures.map((feature, index) => (
            <div key={index} style={{ textAlign: 'center' }}>
              <div style={{
                width: '64px',
                height: '64px',
                background: 'linear-gradient(135deg, #f3f4f6 0%, #e5e7eb 100%)',
                borderRadius: '50%',
                display: 'flex',
                alignItems: 'center',
                justifyContent: 'center',
                margin: '0 auto 16px'
              }}>
                {feature.icon}
              </div>
              <h3 style={{
                fontSize: '18px',
                fontWeight: '600',
                color: '#1a1a1a',
                marginBottom: '8px'
              }}>
                {feature.title}
              </h3>
              <p style={{
                fontSize: '14px',
                color: '#6b7280',
                lineHeight: '1.5'
              }}>
                {feature.description}
              </p>
            </div>
          ))}
        </div>
      </div>

      {/* Category Features */}
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
          What You'll Get Access To
        </h2>
        <div style={{
          display: 'grid',
          gridTemplateColumns: 'repeat(auto-fit, minmax(280px, 1fr))',
          gap: '24px'
        }}>
          {categoryFeatures.map((category, index) => (
            <div key={index} style={{
              border: '1px solid #e5e7eb',
              borderRadius: '16px',
              padding: '24px',
              background: 'linear-gradient(135deg, #fafafa 0%, #f3f4f6 100%)'
            }}>
              <div style={{
                display: 'flex',
                alignItems: 'center',
                gap: '12px',
                marginBottom: '16px'
              }}>
                {category.icon}
                <h3 style={{
                  fontSize: '18px',
                  fontWeight: '600',
                  color: '#1a1a1a',
                  margin: 0
                }}>
                  {category.title}
                </h3>
              </div>
              <ul style={{
                listStyle: 'none',
                padding: 0,
                margin: 0
              }}>
                {category.features.map((feature, featureIndex) => (
                  <li key={featureIndex} style={{
                    display: 'flex',
                    alignItems: 'center',
                    gap: '8px',
                    marginBottom: '8px',
                    fontSize: '14px',
                    color: '#6b7280'
                  }}>
                    <IoCheckmarkCircle size={16} color="#10b981" />
                    {feature}
                  </li>
                ))}
              </ul>
            </div>
          ))}
        </div>
      </div>

      {/* Billing Toggle */}
      <div style={{
        display: 'flex',
        justifyContent: 'center',
        marginBottom: '32px'
      }}>
        <div style={{
          background: 'rgba(255,255,255,0.2)',
          borderRadius: '12px',
          padding: '4px',
          display: 'flex',
          gap: '4px'
        }}>
          <button
            onClick={() => setSelectedPlan('monthly')}
            style={{
              padding: '12px 24px',
              background: selectedPlan === 'monthly' ? 'white' : 'transparent',
              color: selectedPlan === 'monthly' ? '#1a1a1a' : 'white',
              border: 'none',
              borderRadius: '8px',
              fontSize: '16px',
              fontWeight: '600',
              cursor: 'pointer',
              transition: 'all 0.3s ease'
            }}
          >
            Monthly
          </button>
          <button
            onClick={() => setSelectedPlan('yearly')}
            style={{
              padding: '12px 24px',
              background: selectedPlan === 'yearly' ? 'white' : 'transparent',
              color: selectedPlan === 'yearly' ? '#1a1a1a' : 'white',
              border: 'none',
              borderRadius: '8px',
              fontSize: '16px',
              fontWeight: '600',
              cursor: 'pointer',
              transition: 'all 0.3s ease'
            }}
          >
            Yearly
            <span style={{
              background: '#10b981',
              color: 'white',
              fontSize: '12px',
              padding: '2px 8px',
              borderRadius: '12px',
              marginLeft: '8px'
            }}>
              Save 20%
            </span>
          </button>
        </div>
      </div>

      {/* Plans */}
      <div style={{
        display: 'grid',
        gridTemplateColumns: 'repeat(auto-fit, minmax(280px, 1fr))',
        gap: '24px',
        maxWidth: '100%',
        margin: '0 auto'
      }}>
        {plans.map((plan) => (
          <div key={plan.id} style={{
            background: 'white',
            borderRadius: '20px',
            padding: '32px',
            position: 'relative',
            boxShadow: '0 10px 25px rgba(0,0,0,0.1)',
            border: plan.popular ? '3px solid #f59e0b' : '1px solid #e5e7eb',
            transform: plan.popular ? 'scale(1.05)' : 'scale(1)',
            transition: 'all 0.3s ease'
          }}>
            {plan.popular && (
              <div style={{
                position: 'absolute',
                top: '-12px',
                left: '50%',
                transform: 'translateX(-50%)',
                background: '#f59e0b',
                color: 'white',
                padding: '6px 16px',
                borderRadius: '20px',
                fontSize: '14px',
                fontWeight: '600'
              }}>
                Most Popular
              </div>
            )}

            {/* Plan Header */}
            <div style={{
              textAlign: 'center',
              marginBottom: '24px'
            }}>
              <div style={{
                display: 'flex',
                alignItems: 'center',
                justifyContent: 'center',
                gap: '12px',
                marginBottom: '16px'
              }}>
                {plan.icon}
                <h2 style={{
                  fontSize: '24px',
                  fontWeight: '700',
                  color: '#1a1a1a',
                  margin: 0
                }}>
                  {plan.name}
                </h2>
              </div>
              <div style={{
                fontSize: '48px',
                fontWeight: '700',
                color: '#1a1a1a',
                marginBottom: '8px'
              }}>
                ${plan.price}
              </div>
              <div style={{
                fontSize: '16px',
                color: '#6b7280',
                marginBottom: '24px'
              }}>
                per {plan.period}
              </div>
            </div>

            {/* Features */}
            <div style={{ marginBottom: '32px' }}>
              {plan.features.map((feature, index) => (
                <div key={index} style={{
                  display: 'flex',
                  alignItems: 'center',
                  gap: '12px',
                  marginBottom: '12px'
                }}>
                  <IoCheckmarkCircle size={20} color="#10b981" />
                  <span style={{
                    fontSize: '16px',
                    color: '#374151'
                  }}>
                    {feature}
                  </span>
                </div>
              ))}
            </div>

            {/* CTA Button */}
            <button style={{
              width: '100%',
              padding: '16px',
              background: plan.popular 
                ? 'linear-gradient(135deg, #f59e0b 0%, #d97706 100%)'
                : 'linear-gradient(135deg, #3b82f6 0%, #1d4ed8 100%)',
              color: 'white',
              border: 'none',
              borderRadius: '12px',
              fontSize: '16px',
              fontWeight: '600',
              cursor: 'pointer',
              transition: 'all 0.3s ease'
            }}>
              {plan.popular ? 'Get Premium' : `Choose ${plan.name}`}
            </button>
          </div>
        ))}
      </div>

      {/* What You'll Get */}
      <div style={{
        background: 'white',
        borderRadius: '20px',
        padding: '32px',
        marginTop: '32px',
        maxWidth: '1200px',
        marginLeft: 'auto',
        marginRight: 'auto'
      }}>
        <h2 style={{
          fontSize: '24px',
          fontWeight: '700',
          color: '#1a1a1a',
          textAlign: 'center',
          marginBottom: '32px'
        }}>
          Premium Benefits
        </h2>
        
        <div style={{
          display: 'grid',
          gridTemplateColumns: 'repeat(auto-fit, minmax(250px, 1fr))',
          gap: '24px'
        }}>
          <div style={{ textAlign: 'center' }}>
            <div style={{
              width: '64px',
              height: '64px',
              background: 'linear-gradient(135deg, #ec4899 0%, #be185d 100%)',
              borderRadius: '50%',
              display: 'flex',
              alignItems: 'center',
              justifyContent: 'center',
              margin: '0 auto 16px'
            }}>
              <MdFavorite size={24} color="white" />
            </div>
            <h3 style={{
              fontSize: '18px',
              fontWeight: '600',
              color: '#1a1a1a',
              marginBottom: '8px'
            }}>
              Enhanced Social Features
            </h3>
            <p style={{
              fontSize: '14px',
              color: '#6b7280',
              lineHeight: '1.5'
            }}>
              Unlimited messaging, advanced matching, verified badges, and priority support
            </p>
          </div>

          <div style={{ textAlign: 'center' }}>
            <div style={{
              width: '64px',
              height: '64px',
              background: 'linear-gradient(135deg, #3b82f6 0%, #1d4ed8 100%)',
              borderRadius: '50%',
              display: 'flex',
              alignItems: 'center',
              justifyContent: 'center',
              margin: '0 auto 16px'
            }}>
              <MdBusiness size={24} color="white" />
            </div>
            <h3 style={{
              fontSize: '18px',
              fontWeight: '600',
              color: '#1a1a1a',
              marginBottom: '8px'
            }}>
              Professional Tools
            </h3>
            <p style={{
              fontSize: '14px',
              color: '#6b7280',
              lineHeight: '1.5'
            }}>
              Professional dashboards, analytics, service management, and business tools
            </p>
          </div>

          <div style={{ textAlign: 'center' }}>
            <div style={{
              width: '64px',
              height: '64px',
              background: 'linear-gradient(135deg, #f59e0b 0%, #d97706 100%)',
              borderRadius: '50%',
              display: 'flex',
              alignItems: 'center',
              justifyContent: 'center',
              margin: '0 auto 16px'
            }}>
              <MdTravelExplore size={24} color="white" />
            </div>
            <h3 style={{
              fontSize: '18px',
              fontWeight: '600',
              color: '#1a1a1a',
              marginBottom: '8px'
            }}>
              Travel & Explore
            </h3>
            <p style={{
              fontSize: '14px',
              color: '#6b7280',
              lineHeight: '1.5'
            }}>
              Unlimited travel bookings, premium filters, and exclusive travel services
            </p>
          </div>
        </div>
      </div>

      {/* FAQ */}
      <div style={{
        background: 'white',
        borderRadius: '20px',
        padding: '32px',
        marginTop: '32px',
        maxWidth: '1200px',
        marginLeft: 'auto',
        marginRight: 'auto'
      }}>
        <h2 style={{
          fontSize: '24px',
          fontWeight: '700',
          color: '#1a1a1a',
          textAlign: 'center',
          marginBottom: '32px'
        }}>
          Frequently Asked Questions
        </h2>
        
        <div style={{
          display: 'flex',
          flexDirection: 'column',
          gap: '16px'
        }}>
          <div style={{
            padding: '20px',
            border: '1px solid #e5e7eb',
            borderRadius: '12px'
          }}>
            <h3 style={{
              fontSize: '16px',
              fontWeight: '600',
              color: '#1a1a1a',
              marginBottom: '8px'
            }}>
              What features are included in Premium?
            </h3>
            <p style={{
              fontSize: '14px',
              color: '#6b7280',
              margin: 0
            }}>
              Premium includes unlimited social features, professional tools, entertainment content, travel bookings, advanced filters, verified badges, and priority support across all categories.
            </p>
          </div>

          <div style={{
            padding: '20px',
            border: '1px solid #e5e7eb',
            borderRadius: '12px'
          }}>
            <h3 style={{
              fontSize: '16px',
              fontWeight: '600',
              color: '#1a1a1a',
              marginBottom: '8px'
            }}>
              Can I access all categories with Premium?
            </h3>
            <p style={{
              fontSize: '14px',
              color: '#6b7280',
              margin: 0
            }}>
              Yes, Premium gives you full access to all categories including social networking, professional services, entertainment, and travel features with enhanced capabilities.
            </p>
          </div>

          <div style={{
            padding: '20px',
            border: '1px solid #e5e7eb',
            borderRadius: '12px'
          }}>
            <h3 style={{
              fontSize: '16px',
              fontWeight: '600',
              color: '#1a1a1a',
              marginBottom: '8px'
            }}>
              Is there a free trial available?
            </h3>
            <p style={{
              fontSize: '14px',
              color: '#6b7280',
              margin: 0
            }}>
              Yes, we offer a 7-day free trial for all premium plans. No credit card required to start your trial.
            </p>
          </div>
        </div>
      </div>
    </div>
  );
};

export default Premium; 