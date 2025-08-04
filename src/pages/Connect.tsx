import { useState } from 'react';
import { Link } from 'react-router-dom';
import { FaHeart, FaMapMarkerAlt, FaUserPlus, FaBookmark } from 'react-icons/fa';
import { IoHeartOutline } from 'react-icons/io5';

const Connect = () => {
  const [activeTab, setActiveTab] = useState('romance');
  const [likedProfiles, setLikedProfiles] = useState<string[]>([]);
  const [savedProfiles, setSavedProfiles] = useState<string[]>([]);

  const datingProfiles = [
    {
      id: '1',
      name: 'Emma',
      age: 25,
      location: 'Downtown',
      bio: 'Looking for meaningful connections and casual dating. Love outdoor activities and good conversation.',
      photo: 'https://images.unsplash.com/photo-1539571696357-5a69c17a67c6?w=300&h=400&fit=crop&crop=face',
      interests: ['Travel', 'Music', 'Cooking'],
      orientation: 'straight',
      distance: '2 miles away'
    },
    {
      id: '2',
      name: 'Sophia',
      age: 28,
      location: 'Uptown',
      bio: 'Professional woman seeking genuine connections. Enjoy art, wine, and intellectual conversations.',
      photo: 'https://images.unsplash.com/photo-1494790108755-2616b612b786?w=300&h=400&fit=crop&crop=face',
      interests: ['Art', 'Wine', 'Reading'],
      orientation: 'bisexual',
      distance: '5 miles away'
    },
    {
      id: '3',
      name: 'Isabella',
      age: 23,
      location: 'Midtown',
      bio: 'Young and energetic, looking for fun and adventure. Love trying new things and meeting new people.',
      photo: 'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?w=300&h=400&fit=crop&crop=face',
      interests: ['Adventure', 'Sports', 'Dancing'],
      orientation: 'lesbian',
      distance: '1 mile away'
    },
    {
      id: '4',
      name: 'Ava',
      age: 26,
      location: 'Westside',
      bio: 'Creative soul who loves photography and coffee. Looking for someone to share life\'s beautiful moments with.',
      photo: 'https://images.unsplash.com/photo-1544005313-94ddf0286df2?w=300&h=400&fit=crop&crop=face',
      interests: ['Photography', 'Coffee', 'Travel'],
      orientation: 'straight',
      distance: '3 miles away'
    },
    {
      id: '5',
      name: 'Mia',
      age: 29,
      location: 'Eastside',
      bio: 'Fitness enthusiast and foodie. Looking for someone who shares my passion for healthy living and great food.',
      photo: 'https://images.unsplash.com/photo-1534528741775-53994a69daeb?w=300&h=400&fit=crop&crop=face',
      interests: ['Fitness', 'Cooking', 'Yoga'],
      orientation: 'bisexual',
      distance: '4 miles away'
    }
  ];

  const socialEvents = [
    {
      id: '1',
      title: 'Speed Dating Night',
      date: 'Friday, Dec 15',
      time: '7:00 PM',
      location: 'Downtown Lounge',
      description: 'Meet new people in a fun, casual environment',
      attendees: 24,
      image: 'https://images.unsplash.com/photo-1511795409834-ef04bbd61622?w=300&h=200&fit=crop'
    },
    {
      id: '2',
      title: 'Wine & Social',
      date: 'Saturday, Dec 16',
      time: '6:00 PM',
      location: 'Uptown Wine Bar',
      description: 'Relaxed evening with wine tasting and socializing',
      attendees: 18,
      image: 'https://images.unsplash.com/photo-1510812431401-41d2bd2722f3?w=300&h=200&fit=crop'
    },
    {
      id: '3',
      title: 'Adventure Meetup',
      date: 'Sunday, Dec 17',
      time: '10:00 AM',
      location: 'Central Park',
      description: 'Outdoor activities and group adventures',
      attendees: 32,
      image: 'https://images.unsplash.com/photo-1506905925346-21bda4d32df4?w=300&h=200&fit=crop'
    },
  ];

  const handleLike = (profileId: string) => {
    setLikedProfiles(prev => 
      prev.includes(profileId) 
        ? prev.filter(id => id !== profileId)
        : [...prev, profileId]
    );
  };

  const handleConnect = (profileId: string) => {
    // Handle connect logic here
    console.log('Connecting with profile:', profileId);
  };

  const handleSave = (profileId: string) => {
    setSavedProfiles(prev => 
      prev.includes(profileId) 
        ? prev.filter(id => id !== profileId)
        : [...prev, profileId]
    );
  };

  return (
    <div style={{ padding: '16px', paddingBottom: '100px' }}>
      {/* Header */}
      <div style={{ marginBottom: '24px' }}>
        <h1 style={{
          fontSize: '1.75rem',
          fontWeight: '700',
          color: '#111827',
          marginBottom: '8px'
        }}>
          Connect
        </h1>
        <p style={{
          color: '#6b7280',
          fontSize: '0.875rem'
        }}>
          Find meaningful connections and social events
        </p>
      </div>

      {/* Tab Navigation */}
      <div style={{
        display: 'flex',
        background: 'rgba(255, 255, 255, 0.8)',
        borderRadius: '12px',
        padding: '4px',
        marginBottom: '20px',
        border: '1px solid rgba(255, 255, 255, 0.2)'
      }}>
        <button
          onClick={() => setActiveTab('romance')}
          style={{
            flex: 1,
            padding: '12px 16px',
            borderRadius: '8px',
            border: 'none',
            background: activeTab === 'romance' ? 'linear-gradient(135deg, #ec4899 0%, #be185d 100%)' : 'transparent',
            color: activeTab === 'romance' ? 'white' : '#6b7280',
            fontWeight: activeTab === 'romance' ? '600' : '500',
            cursor: 'pointer',
            transition: 'all 0.2s ease'
          }}
        >
          Romance
        </button>
        <button
          onClick={() => setActiveTab('events')}
          style={{
            flex: 1,
            padding: '12px 16px',
            borderRadius: '8px',
            border: 'none',
            background: activeTab === 'events' ? 'linear-gradient(135deg, #3b82f6 0%, #1d4ed8 100%)' : 'transparent',
            color: activeTab === 'events' ? 'white' : '#6b7280',
            fontWeight: activeTab === 'events' ? '600' : '500',
            cursor: 'pointer',
            transition: 'all 0.2s ease'
          }}
        >
          Events
        </button>
      </div>

      {/* Romance Profiles - Custom Style */}
      {activeTab === 'romance' && (
        <div style={{
          display: 'flex',
          flexDirection: 'column',
          gap: '20px'
        }}>
          {datingProfiles.map(profile => {
            const isLiked = likedProfiles.includes(profile.id);
            const isSaved = savedProfiles.includes(profile.id);
            
            return (
              <div key={profile.id} style={{
                background: 'rgba(255, 255, 255, 0.95)',
                backdropFilter: 'blur(10px)',
                borderRadius: '20px',
                overflow: 'hidden',
                border: '1px solid rgba(255, 255, 255, 0.2)',
                boxShadow: '0 8px 32px rgba(0, 0, 0, 0.1)',
                transition: 'all 0.3s ease'
              }}>
                {/* Profile Image */}
                <div style={{ position: 'relative' }}>
                  <img
                    src={profile.photo}
                    alt={profile.name}
                    style={{
                      width: '100%',
                      height: '350px',
                      objectFit: 'cover'
                    }}
                  />
                </div>
                
                {/* Profile Content */}
                <div style={{ padding: '20px' }}>
                  <div style={{
                    display: 'flex',
                    justifyContent: 'space-between',
                    alignItems: 'flex-start',
                    marginBottom: '16px'
                  }}>
                    <div>
                      <h3 style={{
                        fontSize: '1.5rem',
                        fontWeight: '700',
                        color: '#111827',
                        marginBottom: '6px'
                      }}>
                        {profile.name}, {profile.age}
                      </h3>
                      <div style={{
                        display: 'flex',
                        alignItems: 'center',
                        fontSize: '0.875rem',
                        color: '#6b7280'
                      }}>
                        <FaMapMarkerAlt style={{ marginRight: '6px' }} />
                        {profile.distance}
                      </div>
                    </div>
                    <span style={{
                      background: '#f3e8ff',
                      color: '#7c3aed',
                      padding: '6px 12px',
                      borderRadius: '16px',
                      fontSize: '0.75rem',
                      fontWeight: '600'
                    }}>
                      {profile.orientation}
                    </span>
                  </div>
                  
                  <p style={{
                    color: '#6b7280',
                    fontSize: '0.875rem',
                    lineHeight: '1.6',
                    marginBottom: '16px'
                  }}>
                    {profile.bio}
                  </p>
                  
                  <div style={{
                    display: 'flex',
                    flexWrap: 'wrap',
                    gap: '8px',
                    marginBottom: '20px'
                  }}>
                    {profile.interests.map(interest => (
                      <span key={interest} style={{
                        background: '#f3f4f6',
                        color: '#374151',
                        fontSize: '0.75rem',
                        padding: '6px 12px',
                        borderRadius: '12px',
                        fontWeight: '500'
                      }}>
                        {interest}
                      </span>
                    ))}
                  </div>
                  
                  {/* Custom Action Buttons */}
                  <div style={{
                    display: 'flex',
                    justifyContent: 'space-between',
                    alignItems: 'center',
                    padding: '0 8px'
                  }}>
                    <button
                      onClick={() => handleLike(profile.id)}
                      style={{
                        background: 'none',
                        border: 'none',
                        cursor: 'pointer',
                        display: 'flex',
                        alignItems: 'center',
                        justifyContent: 'center',
                        padding: '8px',
                        transition: 'all 0.2s ease'
                      }}
                    >
                      {isLiked ? <FaHeart size={24} color="#ec4899" /> : <IoHeartOutline size={24} color="#6b7280" />}
                    </button>

                    <button
                      onClick={() => handleConnect(profile.id)}
                      style={{
                        background: 'none',
                        border: 'none',
                        cursor: 'pointer',
                        display: 'flex',
                        alignItems: 'center',
                        justifyContent: 'center',
                        padding: '8px',
                        transition: 'all 0.2s ease'
                      }}
                    >
                      <FaUserPlus size={24} color="#3b82f6" />
                    </button>

                    <button
                      onClick={() => handleSave(profile.id)}
                      style={{
                        background: 'none',
                        border: 'none',
                        cursor: 'pointer',
                        display: 'flex',
                        alignItems: 'center',
                        justifyContent: 'center',
                        padding: '8px',
                        transition: 'all 0.2s ease'
                      }}
                    >
                      <FaBookmark size={24} color={isSaved ? "#10b981" : "#6b7280"} />
                    </button>
                  </div>
                </div>
              </div>
            );
          })}
        </div>
      )}

      {/* Social Events */}
      {activeTab === 'events' && (
        <div style={{
          display: 'grid',
          gridTemplateColumns: 'repeat(auto-fill, minmax(280px, 1fr))',
          gap: '16px'
        }}>
          {socialEvents.map(event => (
            <div key={event.id} style={{
              background: 'rgba(255, 255, 255, 0.9)',
              backdropFilter: 'blur(10px)',
              borderRadius: '16px',
              overflow: 'hidden',
              border: '1px solid rgba(255, 255, 255, 0.2)',
              transition: 'all 0.3s ease'
            }}>
              <div style={{ position: 'relative' }}>
                <img
                  src={event.image}
                  alt={event.title}
                  style={{
                    width: '100%',
                    height: '150px',
                    objectFit: 'cover'
                  }}
                />
              </div>
              
              <div style={{ padding: '16px' }}>
                <h3 style={{
                  fontSize: '1.125rem',
                  fontWeight: '700',
                  color: '#111827',
                  marginBottom: '8px'
                }}>
                  {event.title}
                </h3>
                
                <div style={{
                  display: 'flex',
                  alignItems: 'center',
                  marginBottom: '8px',
                  color: '#6b7280',
                  fontSize: '0.875rem'
                }}>
                  <span style={{ marginRight: '16px' }}>📅 {event.date}</span>
                  <span>🕒 {event.time}</span>
                </div>
                
                <p style={{
                  color: '#6b7280',
                  fontSize: '0.875rem',
                  marginBottom: '8px'
                }}>
                  📍 {event.location}
                </p>
                
                <p style={{
                  color: '#374151',
                  fontSize: '0.875rem',
                  lineHeight: '1.5',
                  marginBottom: '12px'
                }}>
                  {event.description}
                </p>
                
                <div style={{
                  display: 'flex',
                  justifyContent: 'space-between',
                  alignItems: 'center'
                }}>
                  <span style={{
                    color: '#6b7280',
                    fontSize: '0.875rem'
                  }}>
                    👥 {event.attendees} attending
                  </span>
                  
                  <button style={{
                    background: 'linear-gradient(135deg, #3b82f6 0%, #1d4ed8 100%)',
                    color: 'white',
                    fontWeight: '600',
                    padding: '8px 16px',
                    borderRadius: '8px',
                    border: 'none',
                    fontSize: '0.875rem',
                    cursor: 'pointer',
                    transition: 'all 0.3s ease'
                  }}>
                    Join Event
                  </button>
                </div>
              </div>
            </div>
          ))}
        </div>
      )}
    </div>
  );
};

export default Connect; 