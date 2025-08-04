import { useState } from 'react';
import { IoLocationOutline, IoCalendarOutline, IoLinkOutline, IoHeartOutline, IoBookmarkOutline, IoChatbubbleOutline, IoEllipsisVertical } from 'react-icons/io5';
import { MdVerified } from 'react-icons/md';
import { FaRegHeart, FaRegBookmark, FaRegComment } from 'react-icons/fa';

interface ProfileProps {
  user: any;
}

const Profile = ({ user }: ProfileProps) => {
  const [activeTab, setActiveTab] = useState('posts');

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
            <button style={{
              padding: '12px 24px',
              background: 'linear-gradient(135deg, #3b82f6 0%, #1d4ed8 100%)',
              color: 'white',
              border: 'none',
              borderRadius: '20px',
              fontSize: '14px',
              fontWeight: '600',
              cursor: 'pointer'
            }}>
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
            onClick={() => setActiveTab('reviews')}
            style={{
              flex: 1,
              padding: '16px',
              background: activeTab === 'reviews' ? '#f3f4f6' : 'white',
              border: 'none',
              fontSize: '16px',
              fontWeight: '600',
              color: activeTab === 'reviews' ? '#1a1a1a' : '#6b7280',
              cursor: 'pointer'
            }}
          >
            Reviews
          </button>
        </div>

        {/* Tab Content */}
        <div style={{ padding: '20px' }}>
          {activeTab === 'posts' && (
            <div>
              {posts.map((post) => (
                <div key={post.id} style={{
                  borderBottom: '1px solid #e5e7eb',
                  paddingBottom: '16px',
                  marginBottom: '16px'
                }}>
                  <div style={{ display: 'flex', alignItems: 'center', marginBottom: '12px' }}>
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
                  <p style={{ marginBottom: '12px', lineHeight: '1.5' }}>
                    {post.content}
                  </p>
                  {post.image && (
                    <img 
                      src={post.image} 
                      alt="Post"
                      style={{
                        width: '100%',
                        borderRadius: '12px',
                        marginBottom: '12px'
                      }}
                    />
                  )}
                  <div style={{
                    display: 'flex',
                    gap: '24px',
                    color: '#6b7280',
                    fontSize: '14px'
                  }}>
                    <div style={{ display: 'flex', alignItems: 'center', gap: '6px' }}>
                      <FaRegHeart size={16} />
                      {post.likes}
                    </div>
                    <div style={{ display: 'flex', alignItems: 'center', gap: '6px' }}>
                      <FaRegComment size={16} />
                      {post.comments}
                    </div>
                    <div style={{ display: 'flex', alignItems: 'center', gap: '6px' }}>
                      <FaRegBookmark size={16} />
                    </div>
                  </div>
                </div>
              ))}
            </div>
          )}

          {activeTab === 'services' && (
            <div style={{ textAlign: 'center', padding: '40px 20px' }}>
              <div style={{ fontSize: '18px', color: '#6b7280', marginBottom: '8px' }}>
                No services yet
              </div>
              <div style={{ fontSize: '14px', color: '#9ca3af' }}>
                Start offering services to earn money
              </div>
            </div>
          )}

          {activeTab === 'reviews' && (
            <div style={{ textAlign: 'center', padding: '40px 20px' }}>
              <div style={{ fontSize: '18px', color: '#6b7280', marginBottom: '8px' }}>
                No reviews yet
              </div>
              <div style={{ fontSize: '14px', color: '#9ca3af' }}>
                Reviews will appear here
              </div>
            </div>
          )}
        </div>
      </div>
    </div>
  );
};

export default Profile; 