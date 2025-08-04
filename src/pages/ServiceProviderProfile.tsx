import { useState } from 'react';
import { useParams } from 'react-router-dom';
import { 
  IoLocationOutline, 
  IoCalendarOutline, 
  IoLinkOutline, 
  IoEllipsisHorizontal,
  IoHeartOutline, 
  IoHeart
} from 'react-icons/io5';
import { MdVerified } from 'react-icons/md';
import { FaRegHeart, FaRegBookmark, FaRegComment } from 'react-icons/fa';

const ServiceProviderProfile = () => {
  const { id } = useParams();
  const [isFavorite, setIsFavorite] = useState(false);
  const [isLiked, setIsLiked] = useState(false);

  // Mock data - in real app this would come from API
  const provider = {
    id: '1',
    name: 'Sophia Chen',
    age: 25,
    location: 'New York, NY',
    verified: true,
    rating: 4.8,
    reviewCount: 45,
    experience: 3,
    description: 'Professional service provider with 3 years experience. Discreet, professional, and committed to complete satisfaction. Verified and trusted by the community.',
    avatar: 'https://images.unsplash.com/photo-1534528741775-53994a69daeb?auto=format&fit=crop&q=80&w=1964&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    banner: 'https://images.unsplash.com/photo-1517841905240-472988babdf9?w=1200&h=400&fit=crop',
    services: [
      'Premium Massage',
      'Therapeutic Sessions',
      'Couples Services',
      'Aromatherapy',
      'Deep Tissue'
    ],
    orientation: 'bisexual',
    serves: ['Straight', 'Lesbian', 'Bisexual'],
    pricing: {
      hourly: 300,
      overnight: 1500,
      videoCall: 150
    },
    availability: {
      location: 'New York, NY',
      travelRadius: '20 miles',
      serviceType: 'Incall & Outcall',
      days: ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday']
    },
    reviews: [
      {
        id: 1,
        service: 'Traditional',
        rating: 5,
        comment: 'Amazing experience! Very professional and discreet.',
        date: '2024-01-15',
        anonymous: true
      },
      {
        id: 2,
        service: 'Massage',
        rating: 4,
        comment: 'Great service, would recommend.',
        date: '2024-01-10',
        anonymous: true
      }
    ],
    stats: {
      followers: '2.4K',
      following: 156,
      posts: '1.2K',
      reviews: 45
    }
  };

  const handleBook = () => {
    console.log('Book now clicked');
    // Navigate to booking page
  };

  const handleMessage = () => {
    console.log('Send message clicked');
    // Navigate to messages
  };

  const toggleFavorite = () => {
    setIsFavorite(!isFavorite);
  };

  const toggleLike = () => {
    setIsLiked(!isLiked);
  };

  return (
    <div style={{ backgroundColor: '#f8f9fa', minHeight: '100vh' }}>
      {/* Header Banner */}
      <div style={{
        height: '200px',
        background: `linear-gradient(rgba(0,0,0,0.3), rgba(0,0,0,0.3)), url(${provider.banner})`,
        backgroundSize: 'cover',
        backgroundPosition: 'center',
        position: 'relative'
      }}>
        <div style={{
          position: 'absolute',
          top: '16px',
          right: '16px',
          background: 'rgba(0,0,0,0.3)',
          border: 'none',
          borderRadius: '50%',
          width: '40px',
          height: '40px',
          display: 'flex',
          alignItems: 'center',
          justifyContent: 'center',
          cursor: 'pointer',
          color: 'white'
        }}>
          <IoEllipsisHorizontal size={20} />
        </div>
      </div>

      {/* Profile Section */}
      <div style={{ padding: '0 16px' }}>
        {/* Profile Picture */}
        <div style={{
          marginTop: '-80px',
          marginBottom: '16px',
          position: 'relative'
        }}>
          <div style={{
            width: '160px',
            height: '160px',
            borderRadius: '50%',
            border: '4px solid white',
            overflow: 'hidden',
            boxShadow: '0 4px 12px rgba(0,0,0,0.15)',
            position: 'relative'
        }}>
          <img
            src={provider.avatar}
            alt={provider.name}
            style={{
                width: '100%',
                height: '100%',
                objectFit: 'cover'
              }}
            />
            {provider.verified && (
              <div style={{
                position: 'absolute',
                bottom: '8px',
                right: '8px',
                background: '#1da1f2',
                borderRadius: '50%',
                width: '32px',
                height: '32px',
                display: 'flex',
                alignItems: 'center',
                justifyContent: 'center'
              }}>
                <MdVerified size={18} color="white" />
              </div>
            )}
          </div>
        </div>

        {/* Profile Info */}
        <div style={{ marginBottom: '24px' }}>
          <div style={{
            display: 'flex',
            alignItems: 'center',
            gap: '8px',
            marginBottom: '8px'
          }}>
            <h1 style={{
              fontSize: '24px',
              fontWeight: '700',
              color: '#1a1a1a',
              margin: 0
            }}>
              {provider.name}
            </h1>
            {provider.verified && (
              <MdVerified size={20} color="#1da1f2" />
            )}
          </div>
          
          <div style={{
            fontSize: '16px',
            color: '#536471',
            marginBottom: '12px'
          }}>
            @{provider.name.toLowerCase().replace(/\s+/g, '')}
          </div>

          <div style={{
            fontSize: '16px',
            color: '#1a1a1a',
            lineHeight: '24px',
            marginBottom: '16px'
          }}>
            {provider.description}
          </div>

          {/* Profile Details */}
          <div style={{ marginBottom: '16px' }}>
            <div style={{
              display: 'flex',
              alignItems: 'center',
              gap: '16px',
              fontSize: '14px',
              color: '#536471'
            }}>
              <div style={{ display: 'flex', alignItems: 'center', gap: '6px' }}>
                <IoLocationOutline size={16} />
                {provider.location}
              </div>
              <div style={{ display: 'flex', alignItems: 'center', gap: '6px' }}>
                <IoCalendarOutline size={16} />
                Joined 2024
              </div>
              <div style={{ display: 'flex', alignItems: 'center', gap: '6px' }}>
                <IoLinkOutline size={16} />
                <span style={{ color: '#1da1f2' }}>Verified Provider</span>
                </div>
            </div>
          </div>

          {/* Stats */}
            <div style={{
              display: 'flex',
            gap: '24px',
            fontSize: '14px',
            color: '#536471'
            }}>
              <div style={{ display: 'flex', alignItems: 'center', gap: '4px' }}>
              <span style={{ color: '#1a1a1a', fontWeight: '600' }}>
                {provider.stats.following}
              </span>
              <span>Following</span>
            </div>
            <div style={{ display: 'flex', alignItems: 'center', gap: '4px' }}>
              <span style={{ color: '#1a1a1a', fontWeight: '600' }}>
                {provider.stats.followers}
              </span>
              <span>Followers</span>
            </div>
            <div style={{ display: 'flex', alignItems: 'center', gap: '4px' }}>
              <span style={{ color: '#1a1a1a', fontWeight: '600' }}>
                {provider.stats.posts}
                </span>
              <span>Posts</span>
              </div>
            <div style={{ display: 'flex', alignItems: 'center', gap: '4px' }}>
              <span style={{ color: '#1a1a1a', fontWeight: '600' }}>
                {provider.rating}★
              </span>
              <span>({provider.reviewCount} reviews)</span>
            </div>
          </div>
        </div>

        {/* Action Buttons */}
        <div style={{
          display: 'flex',
          gap: '12px',
          marginBottom: '24px'
        }}>
          <button
            onClick={handleBook}
            style={{
              background: '#1da1f2',
              color: 'white',
              border: 'none',
              borderRadius: '24px',
              padding: '12px 24px',
              fontSize: '15px',
              fontWeight: '600',
              cursor: 'pointer',
              flex: 1
            }}
          >
            Book Now
          </button>
          <button 
            onClick={handleMessage}
            style={{
              background: 'white',
              color: '#1da1f2',
              border: '1px solid #1da1f2',
              borderRadius: '24px',
              padding: '12px 24px',
              fontSize: '15px',
              fontWeight: '600',
              cursor: 'pointer'
            }}
          >
            Send Message
          </button>
          <button 
            onClick={toggleFavorite}
            style={{
              background: 'white',
              color: isFavorite ? '#ff4757' : '#536471',
              border: '1px solid #e1e8ed',
              borderRadius: '50%',
              width: '48px',
              height: '48px',
              display: 'flex',
              alignItems: 'center',
              justifyContent: 'center',
              cursor: 'pointer'
            }}
          >
            {isFavorite ? <IoHeart size={20} color="#ff4757" /> : <IoHeartOutline size={20} />}
          </button>
        </div>
        
        {/* Tabs */}
        <div style={{
          display: 'flex',
          borderBottom: '1px solid #e1e8ed',
          marginBottom: '16px'
        }}>
          <button style={{
            background: 'none',
            border: 'none',
            padding: '16px 24px',
            fontSize: '15px',
            fontWeight: '600',
            color: '#1da1f2',
            borderBottom: '2px solid #1da1f2',
            cursor: 'pointer'
          }}>
            Posts
          </button>
          <button style={{
            background: 'none',
            border: 'none',
            padding: '16px 24px',
            fontSize: '15px',
            fontWeight: '600',
            color: '#536471',
            cursor: 'pointer'
          }}>
            Services
          </button>
          <button style={{
            background: 'none',
            border: 'none',
            padding: '16px 24px',
            fontSize: '15px',
            fontWeight: '600',
            color: '#536471',
            cursor: 'pointer'
          }}>
            Reviews
          </button>
        </div>

        {/* Content Area */}
        <div style={{
          backgroundColor: 'white',
          borderRadius: '16px',
          padding: '24px',
          marginBottom: '24px',
          boxShadow: '0 2px 8px rgba(0,0,0,0.1)'
        }}>
          <div style={{
            display: 'flex',
            alignItems: 'center',
            gap: '12px',
            marginBottom: '16px'
          }}>
            <img
              src={provider.avatar}
              alt={provider.name}
              style={{
                width: '48px',
                height: '48px',
                borderRadius: '50%',
                objectFit: 'cover'
              }}
            />
            <div>
              <div style={{
                display: 'flex',
                alignItems: 'center',
                gap: '8px',
                marginBottom: '4px'
              }}>
                <span style={{
                  fontSize: '16px',
                  fontWeight: '600',
                  color: '#1a1a1a'
                }}>
                  {provider.name}
                </span>
                {provider.verified && (
                  <MdVerified size={16} color="#1da1f2" />
                )}
                  <span style={{
                  fontSize: '14px',
                  color: '#536471'
                }}>
                  @{provider.name.toLowerCase().replace(/\s+/g, '')}
                  </span>
              </div>
              <span style={{
                fontSize: '14px',
                color: '#536471'
              }}>
                2h
              </span>
            </div>
        </div>
          
          <div style={{
            fontSize: '16px',
            color: '#1a1a1a',
            lineHeight: '24px',
            marginBottom: '16px'
          }}>
            Just completed an amazing session! 💫 The connection was incredible and the experience was beyond expectations. Thank you for trusting me with your time. #PremiumService #VerifiedProvider
      </div>

      <div style={{
            display: 'flex',
            justifyContent: 'space-between',
            alignItems: 'center',
            maxWidth: '400px'
      }}>
        <button style={{
              background: 'none',
          border: 'none',
          display: 'flex',
          alignItems: 'center',
          gap: '8px',
              color: '#536471',
          cursor: 'pointer',
              padding: '8px',
              borderRadius: '8px',
              transition: 'background-color 0.2s'
            }}>
              <FaRegComment size={16} />
              <span style={{ fontSize: '14px' }}>24</span>
        </button>
        <button
              onClick={toggleLike}
          style={{
                background: 'none',
                border: 'none',
            display: 'flex',
            alignItems: 'center',
            gap: '8px',
                color: isLiked ? '#ff4757' : '#536471',
                cursor: 'pointer',
                padding: '8px',
                borderRadius: '8px',
                transition: 'background-color 0.2s'
              }}
            >
              {isLiked ? <IoHeart size={16} color="#ff4757" /> : <FaRegHeart size={16} />}
              <span style={{ fontSize: '14px' }}>156</span>
            </button>
            <button style={{
              background: 'none',
              border: 'none',
              display: 'flex',
              alignItems: 'center',
              gap: '8px',
              color: '#536471',
              cursor: 'pointer',
              padding: '8px',
              borderRadius: '8px',
              transition: 'background-color 0.2s'
            }}>
              <FaRegBookmark size={16} />
        </button>
          </div>
        </div>
      </div>
    </div>
  );
};

export default ServiceProviderProfile;
