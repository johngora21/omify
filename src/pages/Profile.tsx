import { useState } from 'react';
import { useNavigate } from 'react-router-dom';
import { IoLocationOutline, IoCalendarOutline, IoLinkOutline, IoHeartOutline, IoBookmarkOutline, IoChatbubbleOutline, IoEllipsisVertical, IoArrowBack, IoCloseOutline } from 'react-icons/io5';
import { MdVerified } from 'react-icons/md';
import { FaRegHeart, FaRegBookmark, FaRegComment } from 'react-icons/fa';

interface ProfileProps {
  user: any;
}

const Profile = ({ user, onMenuClick }: ProfileProps & { onMenuClick?: () => void }) => {
  const navigate = useNavigate();
  const [activeTab, setActiveTab] = useState('posts');
  const [selectedPost, setSelectedPost] = useState(null);
  const [currentPostIndex, setCurrentPostIndex] = useState(0);

  const mockPosts = [
    {
      id: '1',
      content: 'Just had an amazing massage session! The therapist was incredibly professional and skilled. Highly recommend!',
      image: 'https://images.unsplash.com/photo-1544161512-4f8b5d0c0c0c?w=400&h=400&fit=crop',
      likes: 23,
      comments: 5,
      timestamp: '2 hours ago'
    },
    {
      id: '2',
      content: 'Exploring the city today. Found this amazing spa with the best reviews. Can\'t wait to try it!',
      image: 'https://images.unsplash.com/photo-1544161512-4f8b5d0c0c0c?w=400&h=400&fit=crop',
      likes: 15,
      comments: 3,
      timestamp: '1 day ago'
    },
    {
      id: '3',
      content: 'Perfect day for relaxation. The hot stone massage was exactly what I needed!',
      image: 'https://images.unsplash.com/photo-1544161512-4f8b5d0c0c0c?w=400&h=400&fit=crop',
      likes: 42,
      comments: 8,
      timestamp: '3 days ago'
    },
    {
      id: '4',
      content: 'New favorite spot for wellness treatments. The atmosphere is so peaceful.',
      image: 'https://images.unsplash.com/photo-1544161512-4f8b5d0c0c0c?w=400&h=400&fit=crop',
      likes: 18,
      comments: 2,
      timestamp: '1 week ago'
    },
    {
      id: '5',
      content: 'Deep tissue massage was incredible. Feeling completely rejuvenated!',
      image: 'https://images.unsplash.com/photo-1544161512-4f8b5d0c0c0c?w=400&h=400&fit=crop',
      likes: 31,
      comments: 6,
      timestamp: '1 week ago'
    },
    {
      id: '6',
      content: 'Swedish massage session today. The therapist had amazing technique!',
      image: 'https://images.unsplash.com/photo-1544161512-4f8b5d0c0c0c?w=400&h=400&fit=crop',
      likes: 27,
      comments: 4,
      timestamp: '2 weeks ago'
    }
  ];

  const mockServices = [
    {
      id: '1',
      title: 'Swedish Massage',
      description: 'Relaxing full-body massage to reduce stress and tension',
      price: '$80/hour',
      duration: '60 min',
      rating: 4.8,
      reviews: 24,
      image: 'https://images.unsplash.com/photo-1544161512-4f8b5d0c0c0c?w=400&h=300&fit=crop',
      status: 'active'
    },
    {
      id: '2',
      title: 'Deep Tissue Massage',
      description: 'Therapeutic massage for chronic muscle tension and pain relief',
      price: '$95/hour',
      duration: '60 min',
      rating: 4.9,
      reviews: 18,
      image: 'https://images.unsplash.com/photo-1544161512-4f8b5d0c0c0c?w=400&h=300&fit=crop',
      status: 'active'
    },
    {
      id: '3',
      title: 'Hot Stone Massage',
      description: 'Heated stones for ultimate relaxation and muscle therapy',
      price: '$120/hour',
      duration: '75 min',
      rating: 4.7,
      reviews: 12,
      image: 'https://images.unsplash.com/photo-1544161512-4f8b5d0c0c0c?w=400&h=300&fit=crop',
      status: 'active'
    }
  ];

  const mockAnalytics = {
    totalEarnings: 2840,
    totalBookings: 47,
    averageRating: 4.8,
    totalReviews: 54,
    monthlyStats: [
      { month: 'Jan', earnings: 1200, bookings: 8 },
      { month: 'Feb', earnings: 980, bookings: 6 },
      { month: 'Mar', earnings: 1450, bookings: 10 },
      { month: 'Apr', earnings: 1320, bookings: 9 },
      { month: 'May', earnings: 1680, bookings: 12 },
      { month: 'Jun', earnings: 1890, bookings: 14 }
    ],
    topServices: [
      { name: 'Swedish Massage', bookings: 24, revenue: 1920 },
      { name: 'Deep Tissue Massage', bookings: 18, revenue: 1710 },
      { name: 'Hot Stone Massage', bookings: 12, revenue: 1440 }
    ]
  };



  const mockUser = {
    id: '1',
    name: 'Alex Johnson',
    username: '@alexjohnson',
    avatar: 'https://images.unsplash.com/photo-1494790108755-2616b612b786?w=150&h=150&fit=crop&crop=face',
    banner: 'https://images.unsplash.com/photo-1506905925346-21bda4d32df4?w=800&h=200&fit=crop',
    bio: 'Digital nomad and adventure seeker. Love exploring new places and meeting interesting people.',
    location: 'San Francisco, CA',
    joined: 'March 2023',
    website: 'alexjohnson.com',
    following: 234,
    followers: 1892,
    posts: 47,
    isVerified: true,
    userType: 'client'
  };

  const posts = [
    {
      id: '1',
      content: 'Just had an amazing massage session! The therapist was incredibly professional and skilled. Highly recommend!',
      image: 'https://images.unsplash.com/photo-1544161512-4f8b5d0c0c0c?w=400&h=300&fit=crop',
      likes: 23,
      comments: 5,
      timestamp: '2 hours ago'
    },
    {
      id: '2',
      content: 'Exploring the city today. Found this amazing spa with the best reviews. Can\'t wait to try it!',
      image: 'https://images.unsplash.com/photo-1544161512-4f8b5d0c0c0c?w=400&h=300&fit=crop',
      likes: 15,
      comments: 3,
      timestamp: '1 day ago'
    }
  ];

  return (
    <div style={{
      minHeight: '100vh',
      background: '#f8f9fa',
      paddingBottom: '80px'
    }}>
      {/* Banner */}
      <div style={{
        height: '200px',
        background: `linear-gradient(135deg, #667eea 0%, #764ba2 100%)`,
        position: 'relative'
      }}>
        {/* Back Arrow */}
        <button
          onClick={() => navigate('/')}
          style={{
            position: 'absolute',
            top: '16px',
            left: '16px',
            background: 'rgba(255, 255, 255, 0.9)',
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
          <IoArrowBack size={20} color="#1a1a1a" />
        </button>
        <img 
          src={mockUser.banner} 
          alt="Banner"
          style={{
            width: '100%',
            height: '100%',
            objectFit: 'cover'
          }}
        />
      </div>

        {/* Profile Info */}
      <div style={{
        padding: '0 16px',
        marginTop: '-60px',
        position: 'relative',
        zIndex: 2
      }}>
        <div style={{
          background: 'white',
          borderRadius: '20px',
          padding: '20px',
          boxShadow: '0 4px 12px rgba(0,0,0,0.1)'
        }}>
          {/* Profile Picture */}
          <div style={{
            width: '120px',
            height: '120px',
            borderRadius: '50%',
            overflow: 'hidden',
            margin: '-80px auto 16px',
            border: '4px solid white',
            boxShadow: '0 4px 12px rgba(0,0,0,0.15)'
          }}>
            <img 
              src={mockUser.avatar} 
              alt={mockUser.name}
              style={{
                width: '100%',
                height: '100%',
                objectFit: 'cover'
              }}
            />
          </div>

          {/* Name and Verification */}
          <div style={{ textAlign: 'center', marginBottom: '16px' }}>
            <div style={{ display: 'flex', alignItems: 'center', justifyContent: 'center', gap: '8px', marginBottom: '4px' }}>
              <h1 style={{
                fontSize: '24px',
                fontWeight: '700',
                color: '#1a1a1a',
                margin: 0
              }}>
                {mockUser.name}
              </h1>
              {mockUser.isVerified && <MdVerified size={20} color="#1da1f2" />}
            </div>
            <p style={{
              fontSize: '16px',
              color: '#6b7280',
              margin: 0
            }}>
              {mockUser.username}
            </p>
          </div>

          {/* Bio */}
          <p style={{
            fontSize: '16px',
            color: '#374151',
            textAlign: 'center',
            marginBottom: '16px',
            lineHeight: '1.5'
          }}>
            {mockUser.bio}
          </p>

          {/* Location and Joined */}
          <div style={{
            display: 'flex',
            alignItems: 'center',
            justifyContent: 'center',
            gap: '16px',
            marginBottom: '20px',
            fontSize: '14px',
            color: '#6b7280'
          }}>
            <div style={{ display: 'flex', alignItems: 'center', gap: '6px' }}>
              <IoLocationOutline size={16} />
              {mockUser.location}
            </div>
            <div style={{ display: 'flex', alignItems: 'center', gap: '6px' }}>
              <IoCalendarOutline size={16} />
              Joined {mockUser.joined}
            </div>
              </div>

          {/* Stats */}
          <div style={{
            display: 'flex',
            justifyContent: 'center',
            gap: '32px',
            marginBottom: '20px',
            padding: '16px 0',
            borderTop: '1px solid #e5e7eb',
            borderBottom: '1px solid #e5e7eb'
          }}>
            <div style={{ textAlign: 'center' }}>
              <div style={{ fontSize: '18px', fontWeight: '700', color: '#1a1a1a' }}>
                {mockUser.following}
              </div>
              <div style={{ fontSize: '14px', color: '#6b7280' }}>
                Following
              </div>
              </div>
            <div style={{ textAlign: 'center' }}>
              <div style={{ fontSize: '18px', fontWeight: '700', color: '#1a1a1a' }}>
                {mockUser.followers}
              </div>
              <div style={{ fontSize: '14px', color: '#6b7280' }}>
                Followers
              </div>
            </div>
            <div style={{ textAlign: 'center' }}>
              <div style={{ fontSize: '18px', fontWeight: '700', color: '#1a1a1a' }}>
                {mockUser.posts}
              </div>
              <div style={{ fontSize: '14px', color: '#6b7280' }}>
                Posts
              </div>
            </div>
          </div>

          {/* Action Buttons */}
          <div style={{
            display: 'flex',
            gap: '12px',
            justifyContent: 'center'
          }}>
            <button 
              onClick={() => navigate('/edit-profile')}
              style={{
                padding: '12px 24px',
                background: 'linear-gradient(135deg, #3b82f6 0%, #1d4ed8 100%)',
                color: 'white',
                border: 'none',
                borderRadius: '20px',
                fontSize: '14px',
                fontWeight: '600',
                cursor: 'pointer'
              }}
            >
              Edit Profile
            </button>
            <button style={{
              padding: '12px 24px',
              background: 'white',
              color: '#3b82f6',
              border: '2px solid #3b82f6',
              borderRadius: '20px',
              fontSize: '14px',
              fontWeight: '600',
              cursor: 'pointer'
            }}>
              View Services
            </button>
          </div>
        </div>
      </div>

      {/* Tabs */}
      <div style={{
        background: 'white',
        margin: '16px',
        borderRadius: '16px',
        overflow: 'hidden',
        boxShadow: '0 2px 8px rgba(0,0,0,0.1)'
      }}>
        <div style={{
          display: 'flex',
          borderBottom: '1px solid #e5e7eb'
        }}>
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
              cursor: 'pointer'
            }}
          >
            Posts
          </button>
          <button
            onClick={() => setActiveTab('services')}
            style={{
              flex: 1,
              padding: '16px',
              background: activeTab === 'services' ? '#f3f4f6' : 'white',
              border: 'none',
              fontSize: '16px',
              fontWeight: '600',
              color: activeTab === 'services' ? '#1a1a1a' : '#6b7280',
              cursor: 'pointer'
            }}
          >
            Services
          </button>

          <button
            onClick={() => setActiveTab('analytics')}
            style={{
              flex: 1,
              padding: '16px',
              background: activeTab === 'analytics' ? '#f3f4f6' : 'white',
              border: 'none',
              fontSize: '16px',
              fontWeight: '600',
              color: activeTab === 'analytics' ? '#1a1a1a' : '#6b7280',
              cursor: 'pointer'
            }}
          >
            Analytics
          </button>
        </div>

        {/* Tab Content */}
        <div style={{ padding: '20px' }}>
          {activeTab === 'posts' && (
            <div>
              <div style={{
                display: 'grid',
                gridTemplateColumns: 'repeat(3, 1fr)',
                gap: '2px',
                padding: '0'
              }}>
                {mockPosts.map((post) => (
                  <div 
                    key={post.id} 
                    onClick={() => {
                      setSelectedPost(post);
                      setCurrentPostIndex(mockPosts.findIndex(p => p.id === post.id));
                    }}
                    style={{
                      position: 'relative',
                      aspectRatio: '1',
                      cursor: 'pointer'
                    }}
                  >
                    <img 
                      src={post.image} 
                      alt="Post"
                      style={{
                        width: '100%',
                        height: '100%',
                        objectFit: 'cover'
                      }}
                    />

                  </div>
                ))}
              </div>
            </div>
          )}

          {activeTab === 'services' && (
            <div>
              {mockServices.map((service) => (
                <div key={service.id} style={{
                  borderBottom: '1px solid #e5e7eb',
                  paddingBottom: '20px',
                  marginBottom: '20px'
                }}>
                  <div style={{
                    display: 'flex',
                    gap: '16px',
                    marginBottom: '12px'
                  }}>
                    <img 
                      src={service.image} 
                      alt={service.title}
                      style={{
                        width: '80px',
                        height: '60px',
                        borderRadius: '8px',
                        objectFit: 'cover'
                      }}
                    />
                    <div style={{ flex: 1 }}>
                      <div style={{
                        display: 'flex',
                        justifyContent: 'space-between',
                        alignItems: 'flex-start',
                        marginBottom: '4px'
                      }}>
                        <h3 style={{
                          fontSize: '16px',
                          fontWeight: '600',
                          color: '#1a1a1a',
                          margin: 0
                        }}>
                          {service.title}
                        </h3>
                        <span style={{
                          padding: '2px 8px',
                          borderRadius: '12px',
                          fontSize: '12px',
                          fontWeight: '600',
                          background: service.status === 'active' ? '#dcfce7' : '#fef3c7',
                          color: service.status === 'active' ? '#166534' : '#92400e'
                        }}>
                          {service.status}
                        </span>
                      </div>
                      <p style={{
                        fontSize: '14px',
                        color: '#6b7280',
                        margin: '4px 0',
                        lineHeight: '1.4'
                      }}>
                        {service.description}
                      </p>
                      <div style={{
                        display: 'flex',
                        alignItems: 'center',
                        gap: '16px',
                        fontSize: '14px',
                        color: '#6b7280'
                      }}>
                        <span style={{ fontWeight: '600', color: '#1a1a1a' }}>
                          {service.price}
                        </span>
                        <span>{service.duration}</span>
                        <div style={{ display: 'flex', alignItems: 'center', gap: '4px' }}>
                          <span style={{ color: '#f59e0b' }}>★</span>
                          <span>{service.rating}</span>
                          <span>({service.reviews})</span>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div style={{
                    display: 'flex',
                    gap: '12px'
                  }}>
                    <button style={{
                      padding: '8px 16px',
                      background: '#3b82f6',
                      color: 'white',
                      border: 'none',
                      borderRadius: '6px',
                      fontSize: '14px',
                      fontWeight: '500',
                      cursor: 'pointer'
                    }}>
                      Edit
                    </button>
                    <button style={{
                      padding: '8px 16px',
                      background: 'white',
                      color: '#6b7280',
                      border: '1px solid #d1d5db',
                      borderRadius: '6px',
                      fontSize: '14px',
                      fontWeight: '500',
                      cursor: 'pointer'
                    }}>
                      View Bookings
                    </button>
                  </div>
                </div>
              ))}
            </div>
          )}



          {activeTab === 'analytics' && (
            <div>
              {/* Overview Stats */}
              <div style={{
                display: 'grid',
                gridTemplateColumns: 'repeat(2, 1fr)',
                gap: '16px',
                marginBottom: '24px'
              }}>
                <div style={{
                  background: '#f8f9fa',
                  padding: '16px',
                  borderRadius: '12px',
                  textAlign: 'center'
                }}>
                  <div style={{ fontSize: '24px', fontWeight: '700', color: '#10b981', marginBottom: '4px' }}>
                    ${mockAnalytics.totalEarnings}
                  </div>
                  <div style={{ fontSize: '14px', color: '#6b7280' }}>
                    Total Earnings
                  </div>
                </div>
                <div style={{
                  background: '#f8f9fa',
                  padding: '16px',
                  borderRadius: '12px',
                  textAlign: 'center'
                }}>
                  <div style={{ fontSize: '24px', fontWeight: '700', color: '#3b82f6', marginBottom: '4px' }}>
                    {mockAnalytics.totalBookings}
                  </div>
                  <div style={{ fontSize: '14px', color: '#6b7280' }}>
                    Total Bookings
                  </div>
                </div>
                <div style={{
                  background: '#f8f9fa',
                  padding: '16px',
                  borderRadius: '12px',
                  textAlign: 'center'
                }}>
                  <div style={{ fontSize: '24px', fontWeight: '700', color: '#f59e0b', marginBottom: '4px' }}>
                    {mockAnalytics.averageRating}
                  </div>
                  <div style={{ fontSize: '14px', color: '#6b7280' }}>
                    Average Rating
                  </div>
                </div>
                <div style={{
                  background: '#f8f9fa',
                  padding: '16px',
                  borderRadius: '12px',
                  textAlign: 'center'
                }}>
                  <div style={{ fontSize: '24px', fontWeight: '700', color: '#8b5cf6', marginBottom: '4px' }}>
                    {mockAnalytics.totalReviews}
                  </div>
                  <div style={{ fontSize: '14px', color: '#6b7280' }}>
                    Total Reviews
                  </div>
                </div>
              </div>

              {/* Monthly Earnings Chart */}
              <div style={{
                background: 'white',
                padding: '20px',
                borderRadius: '12px',
                marginBottom: '20px',
                border: '1px solid #e5e7eb'
              }}>
                <h3 style={{ fontSize: '18px', fontWeight: '600', marginBottom: '16px' }}>
                  Monthly Earnings
                </h3>
                <div style={{
                  display: 'flex',
                  alignItems: 'end',
                  gap: '8px',
                  height: '120px'
                }}>
                  {mockAnalytics.monthlyStats.map((stat, index) => (
                    <div key={index} style={{ flex: 1, textAlign: 'center' }}>
                      <div style={{
                        background: '#3b82f6',
                        height: `${(stat.earnings / 2000) * 100}px`,
                        borderRadius: '4px 4px 0 0',
                        marginBottom: '8px'
                      }}></div>
                      <div style={{ fontSize: '12px', color: '#6b7280' }}>
                        {stat.month}
                      </div>
                      <div style={{ fontSize: '10px', color: '#9ca3af' }}>
                        ${stat.earnings}
                      </div>
                    </div>
                  ))}
                </div>
              </div>

              {/* Top Services */}
              <div style={{
                background: 'white',
                padding: '20px',
                borderRadius: '12px',
                border: '1px solid #e5e7eb'
              }}>
                <h3 style={{ fontSize: '18px', fontWeight: '600', marginBottom: '16px' }}>
                  Top Performing Services
                </h3>
                {mockAnalytics.topServices.map((service, index) => (
                  <div key={index} style={{
                    display: 'flex',
                    justifyContent: 'space-between',
                    alignItems: 'center',
                    padding: '12px 0',
                    borderBottom: index < mockAnalytics.topServices.length - 1 ? '1px solid #e5e7eb' : 'none'
                  }}>
                    <div>
                      <div style={{ fontWeight: '600', color: '#1a1a1a' }}>
                        {service.name}
                      </div>
                      <div style={{ fontSize: '14px', color: '#6b7280' }}>
                        {service.bookings} bookings
                      </div>
                    </div>
                    <div style={{ textAlign: 'right' }}>
                      <div style={{ fontWeight: '600', color: '#10b981' }}>
                        ${service.revenue}
                      </div>
                      <div style={{ fontSize: '14px', color: '#6b7280' }}>
                        Revenue
                      </div>
                    </div>
                  </div>
                ))}
              </div>
            </div>
          )}
        </div>
      </div>

      {/* Full Post View */}
      {selectedPost && (
        <div style={{
          position: 'fixed',
          top: 0,
          left: 0,
          width: '100vw',
          height: '100vh',
          background: 'white',
          zIndex: 1000,
          overflow: 'auto'
        }}>
          {/* Header */}
          <div style={{
            position: 'sticky',
            top: 0,
            background: 'white',
            padding: '16px',
            borderBottom: '1px solid #e5e7eb',
            display: 'flex',
            alignItems: 'center',
            justifyContent: 'space-between',
            zIndex: 10
          }}>
            <button
              onClick={() => {
                setSelectedPost(null);
                setCurrentPostIndex(0);
              }}
              style={{
                background: 'none',
                border: 'none',
                cursor: 'pointer',
                padding: '8px',
                borderRadius: '50%',
                display: 'flex',
                alignItems: 'center',
                justifyContent: 'center'
              }}
            >
              <IoArrowBack size={24} color="#1a1a1a" />
            </button>
            <div style={{ fontWeight: '600', fontSize: '18px' }}>
              Posts
            </div>
            <div style={{ width: '40px' }}></div>
          </div>

          {/* Posts Container */}
          <div style={{ padding: '0 16px' }}>
            {mockPosts.map((post, index) => (
              <div key={post.id} style={{
                padding: '20px 0',
                borderBottom: index < mockPosts.length - 1 ? '1px solid #e5e7eb' : 'none'
              }}>
                {/* User Info */}
                <div style={{ display: 'flex', alignItems: 'center', marginBottom: '16px' }}>
                  <img 
                    src={mockUser.avatar} 
                    alt={mockUser.name}
                    style={{
                      width: '40px',
                      height: '40px',
                      borderRadius: '50%',
                      marginRight: '12px'
                    }}
                  />
                  <div>
                    <div style={{ fontWeight: '600', color: '#1a1a1a' }}>
                      {mockUser.name}
                    </div>
                    <div style={{ fontSize: '14px', color: '#6b7280' }}>
                      {post.timestamp}
                    </div>
                  </div>
                </div>

                {/* Post Text */}
                <p style={{ marginBottom: '16px', lineHeight: '1.5', fontSize: '16px' }}>
                  {post.content}
                </p>

                {/* Post Image */}
                <img 
                  src={post.image} 
                  alt="Post"
                  style={{
                    width: '100%',
                    borderRadius: '12px',
                    marginBottom: '16px'
                  }}
                />

                {/* Post Actions */}
                <div style={{
                  display: 'flex',
                  gap: '24px',
                  color: '#6b7280',
                  fontSize: '14px',
                  borderTop: '1px solid #e5e7eb',
                  paddingTop: '16px'
                }}>
                  <div style={{ display: 'flex', alignItems: 'center', gap: '6px', cursor: 'pointer' }}>
                    <FaRegHeart size={16} />
                    {post.likes}
                  </div>
                  <div style={{ display: 'flex', alignItems: 'center', gap: '6px', cursor: 'pointer' }}>
                    <FaRegComment size={16} />
                    {post.comments}
                  </div>
                  <div style={{ display: 'flex', alignItems: 'center', gap: '6px', cursor: 'pointer' }}>
                    <FaRegBookmark size={16} />
                  </div>
                </div>
              </div>
            ))}
          </div>
        </div>
      )}
    </div>
  );
};

export default Profile; 