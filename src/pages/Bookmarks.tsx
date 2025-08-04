import { useState } from 'react';
import { IoHeart, IoHeartOutline, IoBookmark, IoBookmarkOutline, IoLocationOutline, IoStar, IoEllipsisVertical } from 'react-icons/io5';
import { FaRegHeart, FaRegBookmark } from 'react-icons/fa';

const Bookmarks = () => {
  const [activeTab, setActiveTab] = useState('providers');
  const [likedProviders, setLikedProviders] = useState(new Set(['1', '3']));
  const [savedProviders, setSavedProviders] = useState(new Set(['2', '4']));

  const bookmarkedProviders = [
    {
      id: '1',
      name: 'Emma Thompson',
      avatar: 'https://images.unsplash.com/photo-1494790108755-2616b612b786?w=150&h=150&fit=crop&crop=face',
      image: 'https://images.unsplash.com/photo-1544161512-4f8b5d0c0c0c?w=400&h=300&fit=crop',
      location: 'Downtown Spa',
      distance: '0.5km',
      rating: 4.8,
      reviews: 127,
      price: '$120',
      service: 'Swedish Massage',
      online: true,
      orientation: 'Straight',
      age: 28,
      height: '5\'6"',
      services: ['Swedish Massage', 'Deep Tissue', 'Hot Stone', 'Nuru Massage'],
      languages: ['English', 'Spanish'],
      availability: 'Mon-Sun 9AM-9PM',
      incall: true,
      outcall: true
    },
    {
      id: '2',
      name: 'Mia Rodriguez',
      avatar: 'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?w=150&h=150&fit=crop&crop=face',
      image: 'https://images.unsplash.com/photo-1544161512-4f8b5d0c0c0c?w=400&h=300&fit=crop',
      location: 'Luxury Escorts',
      distance: '1.2km',
      rating: 4.9,
      reviews: 89,
      price: '$300',
      service: 'Escort Services',
      online: false,
      orientation: 'Bisexual',
      age: 25,
      height: '5\'4"',
      services: ['Traditional Intimate', 'Oral Services', 'Video Calls', 'Roleplay'],
      languages: ['English', 'French'],
      availability: 'Mon-Sat 10AM-2AM',
      incall: true,
      outcall: true
    },
    {
      id: '3',
      name: 'Sophia Chen',
      avatar: 'https://images.unsplash.com/photo-1534528741775-53994a69daeb?w=150&h=150&fit=crop&crop=face',
      image: 'https://images.unsplash.com/photo-1544161512-4f8b5d0c0c0c?w=400&h=300&fit=crop',
      location: 'Asian Massage',
      distance: '2.1km',
      rating: 4.7,
      reviews: 203,
      price: '$150',
      service: 'Thai Massage',
      online: true,
      orientation: 'Straight',
      age: 26,
      height: '5\'2"',
      services: ['Thai Massage', 'Foot Massage', 'Aromatherapy', 'Couples Massage'],
      languages: ['English', 'Mandarin'],
      availability: 'Daily 8AM-10PM',
      incall: true,
      outcall: false
    },
    {
      id: '4',
      name: 'Isabella Martinez',
      avatar: 'https://images.unsplash.com/photo-1524504388940-b1c1722653e1?w=150&h=150&fit=crop&crop=face',
      image: 'https://images.unsplash.com/photo-1544161512-4f8b5d0c0c0c?w=400&h=300&fit=crop',
      location: 'Elite Companions',
      distance: '3.5km',
      rating: 4.9,
      reviews: 156,
      price: '$400',
      service: 'Premium Escort',
      online: true,
      orientation: 'Bisexual',
      age: 27,
      height: '5\'8"',
      services: ['Premium Intimate', 'GFE Experience', 'Travel Companion', 'Event Escort'],
      languages: ['English', 'Spanish', 'Italian'],
      availability: 'By Appointment',
      incall: true,
      outcall: true
    }
  ];

  const toggleLike = (providerId: string) => {
    const newLiked = new Set(likedProviders);
    if (newLiked.has(providerId)) {
      newLiked.delete(providerId);
    } else {
      newLiked.add(providerId);
    }
    setLikedProviders(newLiked);
  };

  const toggleSave = (providerId: string) => {
    const newSaved = new Set(savedProviders);
    if (newSaved.has(providerId)) {
      newSaved.delete(providerId);
    } else {
      newSaved.add(providerId);
    }
    setSavedProviders(newSaved);
  };

  const handleProfileClick = (providerId: string) => {
    window.location.href = `/provider/${providerId}`;
  };

  return (
    <div style={{
      minHeight: '100vh',
      background: '#f8f9fa',
      paddingBottom: '80px'
    }}>
      {/* Header */}
      <div style={{
        background: 'white',
        padding: '20px 16px',
        borderBottom: '1px solid #e5e7eb'
      }}>
        <h1 style={{
          fontSize: '24px',
          fontWeight: '700',
          color: '#1a1a1a',
          margin: 0,
          textAlign: 'center'
        }}>
          Bookmarks
        </h1>
        <p style={{
          fontSize: '16px',
          color: '#6b7280',
          margin: '8px 0 0 0',
          textAlign: 'center'
        }}>
          Your saved providers and favorites
        </p>
      </div>

      {/* Tabs */}
      <div style={{
        background: 'white',
        borderBottom: '1px solid #e5e7eb'
      }}>
        <div style={{
          display: 'flex',
          maxWidth: '600px',
          margin: '0 auto'
        }}>
          <button
            onClick={() => setActiveTab('providers')}
            style={{
              flex: 1,
              padding: '16px',
              background: activeTab === 'providers' ? '#f3f4f6' : 'white',
              border: 'none',
              fontSize: '16px',
              fontWeight: '600',
              color: activeTab === 'providers' ? '#1a1a1a' : '#6b7280',
              cursor: 'pointer',
              borderBottom: activeTab === 'providers' ? '2px solid #3b82f6' : 'none'
            }}
          >
            Saved Providers
          </button>
          <button
            onClick={() => setActiveTab('posts')}
            style={{
              flex: 1,
              padding: '16px',
              background: activeTab === 'posts' ? '#f3f4f6' : 'white',
              border: 'none',
              fontSize: '16px',
              fontWeight: '600',
              color: activeTab === 'posts' ? '#1a1a1a' : '#6b7280',
              cursor: 'pointer',
              borderBottom: activeTab === 'posts' ? '2px solid #3b82f6' : 'none'
            }}
          >
            Liked Posts
          </button>
        </div>
      </div>

      {/* Content */}
      <div style={{ padding: '16px' }}>
        {activeTab === 'providers' && (
          <div>
            {bookmarkedProviders.length > 0 ? (
              <div style={{
                display: 'grid',
                gap: '16px',
                maxWidth: '600px',
                margin: '0 auto'
              }}>
                {bookmarkedProviders.map((provider) => (
                  <div key={provider.id} style={{
                    background: 'white',
                    borderRadius: '16px',
                    overflow: 'hidden',
                    boxShadow: '0 2px 8px rgba(0,0,0,0.1)'
                  }}>
                    {/* Provider Info */}
                    <div style={{ 
                      padding: '20px 20px 16px',
                      background: 'white',
                      borderBottom: '1px solid #e5e7eb'
                    }}>
                      <div style={{ display: 'flex', alignItems: 'center', justifyContent: 'space-between' }}>
                        <div style={{ display: 'flex', alignItems: 'center', gap: '12px' }}>
                          <div 
                            onClick={() => handleProfileClick(provider.id)}
                            style={{
                              width: '48px',
                              height: '48px',
                              borderRadius: '50%',
                              overflow: 'hidden',
                              boxShadow: '0 2px 8px rgba(0,0,0,0.1)',
                              border: '2px solid #e5e7eb',
                              cursor: 'pointer',
                              transition: 'transform 0.2s ease'
                            }}
                            onMouseEnter={(e) => {
                              e.currentTarget.style.transform = 'scale(1.05)';
                            }}
                            onMouseLeave={(e) => {
                              e.currentTarget.style.transform = 'scale(1)';
                            }}
                          >
                            <img
                              src={provider.avatar}
                              alt={provider.name}
                              style={{
                                width: '100%',
                                height: '100%',
                                objectFit: 'cover'
                              }}
                            />
                          </div>
                          <div>
                            <div style={{
                              fontSize: '16px',
                              fontWeight: '600',
                              color: '#1a1a1a',
                              marginBottom: '4px'
                            }}>
                              {provider.name}
                            </div>
                            <div style={{
                              fontSize: '14px',
                              color: '#6b7280',
                              fontWeight: '500',
                              display: 'flex',
                              alignItems: 'center',
                              gap: '6px'
                            }}>
                              <IoLocationOutline size={16} color="#6b7280" />
                              {provider.location} • {provider.distance}
                            </div>
                          </div>
                        </div>
                        <IoEllipsisVertical size={20} color="#666" style={{ cursor: 'pointer' }} />
                      </div>
                    </div>

                    {/* Main Image */}
                    <div style={{ position: 'relative', width: '100%', height: '350px' }}>
                      <img
                        src={provider.image}
                        alt={provider.name}
                        style={{
                          width: '100%',
                          height: '100%',
                          objectFit: 'cover'
                        }}
                      />
                      
                      {/* Online Status */}
                      {provider.online && (
                        <div style={{
                          position: 'absolute',
                          top: '16px',
                          right: '16px',
                          background: '#10b981',
                          color: 'white',
                          padding: '6px 12px',
                          borderRadius: '16px',
                          fontSize: '12px',
                          fontWeight: '600',
                          display: 'flex',
                          alignItems: 'center',
                          gap: '6px'
                        }}>
                          <div style={{ width: '8px', height: '8px', borderRadius: '50%', backgroundColor: 'white' }} />
                          ONLINE
                        </div>
                      )}
                    </div>

                    {/* Action Buttons */}
                    <div style={{ 
                      display: 'flex', 
                      alignItems: 'center', 
                      justifyContent: 'space-between', 
                      padding: '16px 20px',
                      background: 'white'
                    }}>
                      <div style={{ display: 'flex', gap: '16px' }}>
                        <button
                          onClick={() => toggleLike(provider.id)}
                          style={{
                            background: 'none',
                            border: 'none',
                            cursor: 'pointer',
                            display: 'flex',
                            alignItems: 'center',
                            gap: '6px',
                            color: likedProviders.has(provider.id) ? '#ef4444' : '#6b7280',
                            fontSize: '14px'
                          }}
                        >
                          {likedProviders.has(provider.id) ? (
                            <IoHeart size={20} color="#ef4444" />
                          ) : (
                            <IoHeartOutline size={20} />
                          )}
                          Like
                        </button>
                        <button
                          onClick={() => toggleSave(provider.id)}
                          style={{
                            background: 'none',
                            border: 'none',
                            cursor: 'pointer',
                            display: 'flex',
                            alignItems: 'center',
                            gap: '6px',
                            color: savedProviders.has(provider.id) ? '#f59e0b' : '#6b7280',
                            fontSize: '14px'
                          }}
                        >
                          {savedProviders.has(provider.id) ? (
                            <IoBookmark size={20} color="#f59e0b" />
                          ) : (
                            <IoBookmarkOutline size={20} />
                          )}
                          Save
                        </button>
                      </div>
                      
                      <div style={{
                        display: 'flex',
                        alignItems: 'center',
                        gap: '8px',
                        fontSize: '14px',
                        color: '#6b7280'
                      }}>
                        <IoStar size={16} color="#f59e0b" />
                        {provider.rating} ({provider.reviews})
                      </div>
                    </div>
                  </div>
                ))}
              </div>
            ) : (
              <div style={{
                textAlign: 'center',
                padding: '60px 20px',
                background: 'white',
                borderRadius: '16px',
                margin: '16px'
              }}>
                <IoBookmarkOutline size={48} color="#9ca3af" style={{ marginBottom: '16px' }} />
                <h3 style={{
                  fontSize: '18px',
                  color: '#6b7280',
                  marginBottom: '8px'
                }}>
                  No saved providers yet
                </h3>
                <p style={{
                  fontSize: '14px',
                  color: '#9ca3af'
                }}>
                  Start saving providers you like to see them here
                </p>
              </div>
            )}
          </div>
        )}

        {activeTab === 'posts' && (
          <div style={{
            textAlign: 'center',
            padding: '60px 20px',
            background: 'white',
            borderRadius: '16px',
            margin: '16px'
          }}>
            <FaRegHeart size={48} color="#9ca3af" style={{ marginBottom: '16px' }} />
            <h3 style={{
              fontSize: '18px',
              color: '#6b7280',
              marginBottom: '8px'
            }}>
              No liked posts yet
            </h3>
            <p style={{
              fontSize: '14px',
              color: '#9ca3af'
            }}>
              Posts you like will appear here
            </p>
          </div>
        )}
      </div>
    </div>
  );
};

export default Bookmarks; 