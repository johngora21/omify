import { useState } from 'react';
import { useNavigate } from 'react-router-dom';
import { IoStar, IoCheckmarkCircle, IoDiamond, IoRocket, IoArrowBack, IoPlayCircle, IoHeart, IoDownload, IoEye, IoShieldCheckmark, IoPerson, IoChatbubbles, IoVideocam, IoLocation } from 'react-icons/io5';
import { FaCrown, FaRegHeart, FaRegBookmark } from 'react-icons/fa';
import { MdSportsSoccer, MdMovie, MdLiveTv, MdVerified, MdFavorite } from 'react-icons/md';

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
        'Unlimited movie streaming',
        'HD quality content',
        'Ad-free experience',
        'Basic dating features',
        'Standard messaging',
        'Download 5 movies/month'
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
        '4K Ultra HD streaming',
        'Live sports coverage',
        'Unlimited downloads',
        'Advanced dating features',
        'Priority messaging',
        'Verified badge',
        'Multiple devices (4)',
        'Exclusive content'
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
        'Exclusive movie premieres',
        'Personalized recommendations',
        'Unlimited devices',
        'Premium sports packages',
        'VIP dating features',
        'Concierge support',
        'Priority customer support'
      ],
      popular: false,
      icon: <FaCrown size={24} color="#8b5cf6" />
    }
  ];

  const appFeatures = [
    {
      icon: <MdMovie size={32} color="#3b82f6" />,
      title: 'Entertainment',
      description: 'Unlimited movies, TV shows, live sports, and exclusive content'
    },
    {
      icon: <MdFavorite size={32} color="#ec4899" />,
      title: 'Dating & Social',
      description: 'Advanced matching, unlimited messaging, and social networking features'
    },
    {
      icon: <IoVideocam size={32} color="#10b981" />,
      title: 'Live Content',
      description: 'Live streaming, video calls, and real-time entertainment'
    },
    {
      icon: <IoLocation size={32} color="#f59e0b" />,
      title: 'Location Services',
      description: 'Find nearby people, events, and entertainment venues'
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
          Unlock unlimited entertainment, dating features, and social networking capabilities
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
          What You'll Get
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
              background: 'linear-gradient(135deg, #3b82f6 0%, #1d4ed8 100%)',
              borderRadius: '50%',
              display: 'flex',
              alignItems: 'center',
              justifyContent: 'center',
              margin: '0 auto 16px'
            }}>
              <IoPlayCircle size={24} color="white" />
            </div>
            <h3 style={{
              fontSize: '18px',
              fontWeight: '600',
              color: '#1a1a1a',
              marginBottom: '8px'
            }}>
              Unlimited Entertainment
            </h3>
            <p style={{
              fontSize: '14px',
              color: '#6b7280',
              lineHeight: '1.5'
            }}>
              Watch unlimited movies, TV shows, and live sports without restrictions
            </p>
          </div>

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
              Advanced Dating
            </h3>
            <p style={{
              fontSize: '14px',
              color: '#6b7280',
              lineHeight: '1.5'
            }}>
              Enhanced matching, unlimited messaging, and premium dating features
            </p>
          </div>

          <div style={{ textAlign: 'center' }}>
            <div style={{
              width: '64px',
              height: '64px',
              background: 'linear-gradient(135deg, #10b981 0%, #059669 100%)',
              borderRadius: '50%',
              display: 'flex',
              alignItems: 'center',
              justifyContent: 'center',
              margin: '0 auto 16px'
            }}>
              <IoDownload size={24} color="white" />
            </div>
            <h3 style={{
              fontSize: '18px',
              fontWeight: '600',
              color: '#1a1a1a',
              marginBottom: '8px'
            }}>
              Offline Access
            </h3>
            <p style={{
              fontSize: '14px',
              color: '#6b7280',
              lineHeight: '1.5'
            }}>
              Download content to watch offline and access premium features anywhere
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
              Can I cancel my subscription anytime?
            </h3>
            <p style={{
              fontSize: '14px',
              color: '#6b7280',
              margin: 0
            }}>
              Yes, you can cancel your subscription at any time. Your premium features will remain active until the end of your billing period.
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
              What dating features are included in Premium?
            </h3>
            <p style={{
              fontSize: '14px',
              color: '#6b7280',
              margin: 0
            }}>
              Premium includes unlimited messaging, advanced matching algorithms, verified badges, priority support, and exclusive dating features.
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