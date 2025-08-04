import { useState } from 'react';
import { IoHeart, IoHeartOutline, IoChatbubbleOutline, IoEllipsisHorizontal } from 'react-icons/io5';
import { FaBookmark } from 'react-icons/fa';

const Home = () => {
  const [likedPosts, setLikedPosts] = useState<Set<string>>(new Set());
  const [savedPosts, setSavedPosts] = useState<Set<string>>(new Set());

  const stories = [
    { id: '1', username: 'sophia_escorts', avatar: 'https://images.unsplash.com/photo-1494790108755-2616b612b786?w=150&h=150&fit=crop&crop=face', hasStory: true },
    { id: '2', username: 'emma_massage', avatar: 'https://images.unsplash.com/photo-1517841905240-472988babdf9?w=150&h=150&fit=crop&crop=face', hasStory: true },
    { id: '3', username: 'luna_premium', avatar: 'https://images.unsplash.com/photo-1539571696357-5a69c17a67c6?w=150&h=150&fit=crop&crop=face', hasStory: true },
    { id: '4', username: 'ava_luxury', avatar: 'https://images.unsplash.com/photo-1487412720507-e7ab37603c6f?w=150&h=150&fit=crop&crop=face', hasStory: true },
    { id: '5', username: 'mia_therapy', avatar: 'https://images.unsplash.com/photo-1524504388940-b1c1722653e1?w=150&h=150&fit=crop&crop=face', hasStory: true },
  ];

  const posts = [
    {
      id: '1',
      username: 'sophia_grace',
      avatar: 'https://images.unsplash.com/photo-1494790108755-2616b612b786?w=100&h=100&fit=crop&crop=face',
      location: 'Downtown, City',
      image: 'https://images.unsplash.com/photo-1519735997400-2f7bbcd69b1a?w=600&h=800&fit=crop',
      caption: '✨ Looking for meaningful connections and genuine conversations. Love art, travel, and deep talks over coffee. Let\'s explore life together! #Connection #Romance #Meaningful',
      likes: 234,
      timeAgo: '2h',
      isVideo: false,
      category: 'Romance'
    },
    {
      id: '2',
      username: 'emma_wellness',
      avatar: 'https://images.unsplash.com/photo-1517841905240-472988babdf9?w=100&h=100&fit=crop&crop=face',
      location: 'Uptown Wellness',
      image: 'https://images.unsplash.com/photo-1544161515-4ab6ce6db874?w=600&h=800&fit=crop',
      caption: '🌸 Certified wellness coach and meditation guide. Helping people find inner peace and balance. Let\'s journey together towards mindfulness and self-discovery! #Wellness #Mindfulness #Growth',
      likes: 156,
      timeAgo: '4h',
      isVideo: false,
      category: 'Wellness'
    },
    {
      id: '3',
      username: 'luna_connection',
      avatar: 'https://images.unsplash.com/photo-1539571696357-5a69c17a67c6?w=100&h=100&fit=crop&crop=face',
      location: 'Cultural District',
      image: 'https://images.unsplash.com/photo-1571019613454-1cb2f99b2d8b?w=600&h=800&fit=crop',
      caption: '💫 Passionate about cultural exchange and intellectual conversations. Love exploring museums, trying new cuisines, and sharing life experiences. #Culture #Intellectual #Connection',
      likes: 298,
      timeAgo: '6h',
      isVideo: true,
      category: 'Cultural'
    },
    {
      id: '4',
      username: 'ava_romance',
      avatar: 'https://images.unsplash.com/photo-1487412720507-e7ab37603c6f?w=100&h=100&fit=crop&crop=face',
      location: 'Central Park Area',
      image: 'https://images.unsplash.com/photo-1515886657613-9f3515b0c78f?w=600&h=800&fit=crop',
      caption: '👗 Seeking genuine romance and emotional connection. Love long walks, meaningful conversations, and building something beautiful together. #Romance #Emotional #Connection',
      likes: 187,
      timeAgo: '8h',
      isVideo: false,
      category: 'Romance'
    },
    {
      id: '5',
      username: 'mia_healing',
      avatar: 'https://images.unsplash.com/photo-1524504388940-b1c1722653e1?w=100&h=100&fit=crop&crop=face',
      location: 'Healing Center',
      image: 'https://images.unsplash.com/photo-1571019613454-1cb2f99b2d8b?w=600&h=800&fit=crop',
      caption: '💆‍♀️ Holistic healing practitioner specializing in emotional wellness and relationship guidance. Let\'s heal together and create meaningful bonds! #Healing #Emotional #Wellness',
      likes: 142,
      timeAgo: '12h',
      isVideo: false,
      category: 'Healing'
    }
  ];

  const toggleLike = (postId: string) => {
    const newLikedPosts = new Set(likedPosts);
    if (newLikedPosts.has(postId)) {
      newLikedPosts.delete(postId);
    } else {
      newLikedPosts.add(postId);
    }
    setLikedPosts(newLikedPosts);
  };

  const toggleSave = (postId: string) => {
    const newSavedPosts = new Set(savedPosts);
    if (newSavedPosts.has(postId)) {
      newSavedPosts.delete(postId);
    } else {
      newSavedPosts.add(postId);
    }
    setSavedPosts(newSavedPosts);
  };

  const handleMessage = (postId: string) => {
    // Handle message functionality
    console.log('Message clicked for post:', postId);
  };

  return (
    <div style={{ 
      backgroundColor: '#f8f9fa',
      minHeight: '100vh',
      paddingBottom: '80px',
      maxWidth: '100vw',
      overflowX: 'hidden'
    }}>
      {/* Featured Stories Section */}
      <div style={{
        backgroundColor: 'white',
        margin: '16px',
        borderRadius: '16px',
        padding: '20px',
        boxShadow: '0 2px 12px rgba(0,0,0,0.08)',
        maxWidth: '100%'
      }}>

        <div style={{
          display: 'flex',
          gap: '16px',
          overflowX: 'auto',
          scrollbarWidth: 'none',
          msOverflowStyle: 'none'
        }}>
          {stories.map((story) => (
            <div key={story.id} style={{
              display: 'flex',
              flexDirection: 'column',
              alignItems: 'center',
              minWidth: '80px',
              gap: '8px'
            }}>
              <div style={{
                width: '70px',
                height: '70px',
                background: 'linear-gradient(135deg, #667eea 0%, #764ba2 100%)',
                borderRadius: '50%',
                padding: '3px',
                cursor: 'pointer',
                boxShadow: '0 4px 12px rgba(102, 126, 234, 0.3)'
              }}>
                <img
                  src={story.avatar}
                  alt={story.username}
                  style={{
                    width: '64px',
                    height: '64px',
                    borderRadius: '50%',
                    objectFit: 'cover'
                  }}
                />
              </div>
              <span style={{
                fontSize: '11px',
                color: '#666',
                maxWidth: '80px',
                textAlign: 'center',
                overflow: 'hidden',
                textOverflow: 'ellipsis',
                whiteSpace: 'nowrap'
              }}>
                {story.username}
              </span>
            </div>
          ))}
        </div>
      </div>

      {/* Posts Feed */}
      <div style={{ 
        padding: '0 16px',
        maxWidth: '100%',
        overflowX: 'hidden'
      }}>
        {posts.map((post) => (
          <div key={post.id} style={{
            backgroundColor: 'white',
            marginBottom: '24px',
            borderRadius: '20px',
            overflow: 'hidden',
            boxShadow: '0 8px 32px rgba(0,0,0,0.12)',
            border: '1px solid rgba(255,255,255,0.2)'
          }}>
            {/* Post Header */}
            <div style={{
              display: 'flex',
              alignItems: 'center',
              justifyContent: 'space-between',
              padding: '20px 20px 16px'
            }}>
              <div style={{ display: 'flex', alignItems: 'center', gap: '12px' }}>
                <div style={{
                  width: '48px',
                  height: '48px',
                  borderRadius: '50%',
                  overflow: 'hidden',
                  boxShadow: '0 2px 8px rgba(0,0,0,0.1)'
                }}>
                  <img
                    src={post.avatar}
                    alt={post.username}
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
                    color: '#1a1a1a'
                  }}>
                    {post.username}
                  </div>
                  <div style={{
                    fontSize: '13px',
                    color: '#888',
                    display: 'flex',
                    alignItems: 'center',
                    gap: '8px'
                  }}>
                    <span>{post.location}</span>
                    <span>•</span>
                    <span style={{
                      backgroundColor: '#f0f0f0',
                      padding: '2px 8px',
                      borderRadius: '12px',
                      fontSize: '11px',
                      color: '#666'
                    }}>
                      {post.category}
                    </span>
                  </div>
                </div>
              </div>
              <IoEllipsisHorizontal size={20} color="#666" style={{ cursor: 'pointer' }} />
            </div>

            {/* Post Image/Video */}
            <div style={{ position: 'relative' }}>
              <img
                src={post.image}
                alt="Post content"
                style={{
                  width: '100%',
                  height: '350px',
                  objectFit: 'cover',
                  display: 'block'
                }}
              />
              {post.isVideo && (
                <div style={{
                  position: 'absolute',
                  top: '16px',
                  right: '16px',
                  background: 'rgba(0, 0, 0, 0.7)',
                  color: 'white',
                  padding: '6px 12px',
                  borderRadius: '20px',
                  fontSize: '12px',
                  fontWeight: '500',
                  backdropFilter: 'blur(10px)'
                }}>
                  ▶ VIDEO
                </div>
              )}
            </div>

            {/* Post Actions */}
            <div style={{
              display: 'flex',
              justifyContent: 'space-between',
              alignItems: 'center',
              padding: '16px 20px'
            }}>
              <div style={{ display: 'flex', gap: '20px' }}>
                <button
                  onClick={() => toggleLike(post.id)}
                  style={{
                    background: 'none',
                    border: 'none',
                    cursor: 'pointer',
                    padding: '8px',
                    borderRadius: '8px',
                    transition: 'background-color 0.2s'
                  }}
                >
                  {likedPosts.has(post.id) ? (
                    <IoHeart size={26} color="#ff4757" />
                  ) : (
                    <IoHeartOutline size={26} color="#666" />
                  )}
                </button>
                <button
                  onClick={() => handleMessage(post.id)}
                  style={{
                    background: 'none',
                    border: 'none',
                    cursor: 'pointer',
                    padding: '8px',
                    borderRadius: '8px',
                    transition: 'background-color 0.2s'
                  }}
                >
                  <IoChatbubbleOutline size={26} color="#666" />
                </button>
              </div>
              <button
                onClick={() => toggleSave(post.id)}
                style={{
                  background: 'none',
                  border: 'none',
                  cursor: 'pointer',
                  padding: '8px',
                  borderRadius: '8px',
                  transition: 'background-color 0.2s'
                }}
              >
                {savedPosts.has(post.id) ? (
                  <FaBookmark size={24} color="#ffa502" />
                ) : (
                  <FaBookmark size={24} color="#666" />
                )}
              </button>
            </div>

            {/* Post Info */}
            <div style={{ padding: '0 20px 20px' }}>
              <div style={{
                fontSize: '15px',
                fontWeight: '600',
                color: '#1a1a1a',
                marginBottom: '12px'
              }}>
                {post.likes + (likedPosts.has(post.id) ? 1 : 0)} connections
              </div>
              <div style={{
                fontSize: '15px',
                color: '#333',
                lineHeight: '22px',
                marginBottom: '12px'
              }}>
                <span style={{ fontWeight: '600', marginRight: '8px' }}>
                  {post.username}
                </span>
                {post.caption}
              </div>
              <div style={{
                fontSize: '13px',
                color: '#999',
                display: 'flex',
                alignItems: 'center',
                gap: '8px'
              }}>
                <span>{post.timeAgo} ago</span>
                <span>•</span>
                <span style={{
                  backgroundColor: '#f8f9fa',
                  padding: '4px 8px',
                  borderRadius: '8px',
                  fontSize: '11px'
                }}>
                  {post.category}
                </span>
              </div>
            </div>
          </div>
        ))}
      </div>
    </div>
  );
};

export default Home;
