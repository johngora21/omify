import { useState, useEffect } from 'react';
import { IoHeart, IoHeartOutline, IoChatbubbleOutline, IoShareOutline, IoMusicalNote, IoEllipsisVertical } from 'react-icons/io5';
import { FaBookmark, FaRegBookmark } from 'react-icons/fa';
import { BiPlay, BiPause } from 'react-icons/bi';

const Reels = () => {
  const [likedVideos, setLikedVideos] = useState<Set<string>>(new Set());
  const [savedVideos, setSavedVideos] = useState<Set<string>>(new Set());
  const [currentVideoIndex, setCurrentVideoIndex] = useState<number>(0);
  const [isPlaying, setIsPlaying] = useState<boolean>(true);

  const reels = [
    {
      id: '1',
      username: 'sophia_grace',
      displayName: 'Sophia Grace',
      avatar: 'https://images.unsplash.com/photo-1494790108755-2616b612b786?w=100&h=100&fit=crop&crop=face',
      video: 'https://images.unsplash.com/photo-1519735997400-2f7bbcd69b1a?w=600&h=800&fit=crop',
      caption: '✨ Creating meaningful connections and unforgettable experiences. Let\'s make memories together! #Connections #Memories #Lifestyle',
      likes: 2340,
      comments: 145,
      shares: 89,
      music: 'Chill Vibes - Sophia Grace',
      isVideo: true,
      duration: '0:15',
      verified: true
    },
    {
      id: '2',
      username: 'emma_wellness',
      displayName: 'Emma Wellness',
      avatar: 'https://images.unsplash.com/photo-1517841905240-472988babdf9?w=100&h=100&fit=crop&crop=face',
      video: 'https://images.unsplash.com/photo-1544161515-4ab6ce6db874?w=600&h=800&fit=crop',
      caption: '🌸 Wellness and relaxation sessions available. Swedish, deep tissue, and hot stone massages. Your journey to tranquility starts here! #Wellness #Relaxation #SelfCare',
      likes: 1856,
      comments: 223,
      shares: 156,
      music: 'Peaceful Melodies - Emma',
      isVideo: true,
      duration: '0:22',
      verified: false
    },
    {
      id: '3',
      username: 'luna_premium',
      displayName: 'Luna Premium',
      avatar: 'https://images.unsplash.com/photo-1539571696357-5a69c17a67c6?w=100&h=100&fit=crop&crop=face',
      video: 'https://images.unsplash.com/photo-1571019613454-1cb2f99b2d8b?w=600&h=800&fit=crop',
      caption: '💫 Premium lifestyle experiences and exclusive events. Creating moments that matter. #PremiumLifestyle #Exclusive #Experiences',
      likes: 3298,
      comments: 267,
      shares: 234,
      music: 'Luxury Beats - Luna',
      isVideo: true,
      duration: '0:18',
      verified: true
    },
    {
      id: '4',
      username: 'maya_creative',
      displayName: 'Maya Creative',
      avatar: 'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?w=100&h=100&fit=crop&crop=face',
      video: 'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=600&h=800&fit=crop',
      caption: '🎨 Expressing creativity through art and connection. Every moment is a canvas for beautiful experiences. #Creativity #Art #Connection',
      likes: 2156,
      comments: 189,
      shares: 134,
      music: 'Creative Flow - Maya',
      isVideo: true,
      duration: '0:25',
      verified: false
    }
  ];

  const currentReel = reels[currentVideoIndex];

  const toggleLike = (videoId: string) => {
    const newLikedVideos = new Set(likedVideos);
    if (newLikedVideos.has(videoId)) {
      newLikedVideos.delete(videoId);
    } else {
      newLikedVideos.add(videoId);
    }
    setLikedVideos(newLikedVideos);
  };

  const toggleSave = (videoId: string) => {
    const newSavedVideos = new Set(savedVideos);
    if (newSavedVideos.has(videoId)) {
      newSavedVideos.delete(videoId);
    } else {
      newSavedVideos.add(videoId);
    }
    setSavedVideos(newSavedVideos);
  };

  const handleComment = (videoId: string) => {
    console.log('Comment on video:', videoId);
  };

  const handleShare = (videoId: string) => {
    console.log('Share video:', videoId);
  };

  const handleSwipe = (direction: 'up' | 'down') => {
    if (direction === 'up' && currentVideoIndex < reels.length - 1) {
      setCurrentVideoIndex(currentVideoIndex + 1);
    } else if (direction === 'down' && currentVideoIndex > 0) {
      setCurrentVideoIndex(currentVideoIndex - 1);
    }
  };

  const formatNumber = (num: number) => {
    if (num >= 1000000) {
      return (num / 1000000).toFixed(1) + 'M';
    } else if (num >= 1000) {
      return (num / 1000).toFixed(1) + 'K';
    }
    return num.toString();
  };

  return (
    <div style={{
      backgroundColor: '#000',
      height: '100vh',
      position: 'relative',
      overflow: 'hidden'
    }}>
      {/* Video Container */}
      <div style={{
        position: 'relative',
        height: '100%',
        display: 'flex',
        alignItems: 'center',
        justifyContent: 'center'
      }}>
        {/* Video Background */}
        <div style={{
          position: 'absolute',
          top: 0,
          left: 0,
          right: 0,
          bottom: 0,
          background: `linear-gradient(rgba(0,0,0,0.3), rgba(0,0,0,0.3)), url(${currentReel?.video})`,
          backgroundSize: 'cover',
          backgroundPosition: 'center',
          filter: 'blur(2px)'
        }} />
        
        {/* Video Content */}
        <div style={{
          position: 'relative',
          width: '100%',
          height: '100%',
          display: 'flex',
          alignItems: 'center',
          justifyContent: 'center'
        }}>
          <img
            src={currentReel?.video}
            alt="Video content"
            style={{
              maxWidth: '100%',
              maxHeight: '100%',
              objectFit: 'contain'
            }}
          />
          
          {/* Play/Pause Overlay */}
          <button
            onClick={() => setIsPlaying(!isPlaying)}
            style={{
              position: 'absolute',
              top: '50%',
              left: '50%',
              transform: 'translate(-50%, -50%)',
              background: 'rgba(0,0,0,0.5)',
              border: 'none',
              borderRadius: '50%',
              width: '60px',
              height: '60px',
              display: 'flex',
              alignItems: 'center',
              justifyContent: 'center',
              cursor: 'pointer',
              color: 'white'
            }}
          >
            {isPlaying ? <BiPause size={24} /> : <BiPlay size={24} />}
          </button>
        </div>

        {/* Right Side Actions */}
        <div style={{
          position: 'absolute',
          right: '16px',
          bottom: '120px',
          display: 'flex',
          flexDirection: 'column',
          gap: '20px',
          alignItems: 'center'
        }}>
          {/* Profile Button */}
          <button
            style={{
              background: 'none',
              border: 'none',
              cursor: 'pointer',
              display: 'flex',
              flexDirection: 'column',
              alignItems: 'center',
              gap: '4px',
              color: 'white'
            }}
          >
            <img
              src={currentReel?.avatar}
              alt={currentReel?.username}
              style={{
                width: '48px',
                height: '48px',
                borderRadius: '50%',
                objectFit: 'cover',
                border: '2px solid white'
              }}
            />
            <div style={{
              width: '24px',
              height: '24px',
              borderRadius: '50%',
              background: '#3b82f6',
              display: 'flex',
              alignItems: 'center',
              justifyContent: 'center',
              marginTop: '-12px'
            }}>
              <span style={{ fontSize: '12px', fontWeight: '600', color: 'white' }}>+</span>
            </div>
          </button>

          {/* Like Button */}
          <button
            onClick={() => toggleLike(currentReel.id)}
            style={{
              background: 'none',
              border: 'none',
              cursor: 'pointer',
              display: 'flex',
              flexDirection: 'column',
              alignItems: 'center',
              gap: '4px',
              color: 'white'
            }}
          >
            {likedVideos.has(currentReel.id) ? (
              <IoHeart size={28} color="#ff4757" />
            ) : (
              <IoHeartOutline size={28} />
            )}
            <span style={{ fontSize: '12px', fontWeight: '600' }}>
              {formatNumber(currentReel.likes + (likedVideos.has(currentReel.id) ? 1 : 0))}
            </span>
          </button>

          {/* Comment Button */}
          <button
            onClick={() => handleComment(currentReel.id)}
            style={{
              background: 'none',
              border: 'none',
              cursor: 'pointer',
              display: 'flex',
              flexDirection: 'column',
              alignItems: 'center',
              gap: '4px',
              color: 'white'
            }}
          >
            <IoChatbubbleOutline size={28} />
            <span style={{ fontSize: '12px', fontWeight: '600' }}>
              {formatNumber(currentReel.comments)}
            </span>
          </button>

          {/* Share Button */}
          <button
            onClick={() => handleShare(currentReel.id)}
            style={{
              background: 'none',
              border: 'none',
              cursor: 'pointer',
              display: 'flex',
              flexDirection: 'column',
              alignItems: 'center',
              gap: '4px',
              color: 'white'
            }}
          >
            <IoShareOutline size={28} />
            <span style={{ fontSize: '12px', fontWeight: '600' }}>
              {formatNumber(currentReel.shares)}
            </span>
          </button>

          {/* Save Button */}
          <button
            onClick={() => toggleSave(currentReel.id)}
            style={{
              background: 'none',
              border: 'none',
              cursor: 'pointer',
              display: 'flex',
              flexDirection: 'column',
              alignItems: 'center',
              gap: '4px',
              color: 'white'
            }}
          >
            {savedVideos.has(currentReel.id) ? (
              <FaBookmark size={24} color="#ffa502" />
            ) : (
              <FaRegBookmark size={24} />
            )}
          </button>

          {/* More Options */}
          <button
            style={{
              background: 'none',
              border: 'none',
              cursor: 'pointer',
              display: 'flex',
              flexDirection: 'column',
              alignItems: 'center',
              gap: '4px',
              color: 'white'
            }}
          >
            <IoEllipsisVertical size={24} />
          </button>
        </div>

        {/* Bottom Content */}
        <div style={{
          position: 'absolute',
          bottom: '120px',
          left: '16px',
          right: '80px',
          color: 'white'
        }}>
          {/* Username and Caption */}
          <div style={{ marginBottom: '12px' }}>
            <div style={{
              display: 'flex',
              alignItems: 'center',
              gap: '8px',
              marginBottom: '8px'
            }}>
              <span style={{
                fontSize: '16px',
                fontWeight: '600'
              }}>
                @{currentReel.username}
              </span>
              {currentReel.verified && (
                <span style={{
                  fontSize: '14px',
                  color: '#3b82f6'
                }}>
                  ✓
                </span>
              )}
            </div>
            <p style={{
              fontSize: '14px',
              lineHeight: '18px',
              margin: '0 0 12px 0'
            }}>
              {currentReel.caption}
            </p>
          </div>

          {/* Music Info */}
          <div style={{
            display: 'flex',
            alignItems: 'center',
            gap: '8px',
            marginBottom: '8px'
          }}>
            <IoMusicalNote size={16} />
            <span style={{
              fontSize: '14px',
              fontWeight: '500'
            }}>
              {currentReel.music}
            </span>
          </div>

          {/* Duration */}
          <div style={{
            fontSize: '12px',
            opacity: 0.8
          }}>
            {currentReel.duration}
          </div>
        </div>

        {/* Top Navigation */}
        <div style={{
          position: 'absolute',
          top: '20px',
          left: '16px',
          right: '16px',
          display: 'flex',
          justifyContent: 'space-between',
          alignItems: 'center'
        }}>
          <h1 style={{
            fontSize: '20px',
            fontWeight: '700',
            color: 'white',
            margin: 0
          }}>
            Reels
          </h1>
          <button style={{
            background: 'rgba(255,255,255,0.2)',
            border: 'none',
            borderRadius: '20px',
            padding: '8px 16px',
            color: 'white',
            fontSize: '14px',
            fontWeight: '600',
            cursor: 'pointer'
          }}>
            Upload
          </button>
        </div>
      </div>

      {/* Video Navigation Dots */}
      <div style={{
        position: 'absolute',
        bottom: '100px',
        left: '50%',
        transform: 'translateX(-50%)',
        display: 'flex',
        gap: '8px'
      }}>
        {reels.map((reel, index) => (
          <div
            key={reel.id}
            onClick={() => setCurrentVideoIndex(index)}
            style={{
              width: '8px',
              height: '8px',
              borderRadius: '50%',
              backgroundColor: currentVideoIndex === index ? 'white' : 'rgba(255,255,255,0.5)',
              cursor: 'pointer',
              transition: 'all 0.2s ease'
            }}
          />
        ))}
      </div>

      {/* Swipe Instructions */}
      <div style={{
        position: 'absolute',
        top: '50%',
        left: '50%',
        transform: 'translate(-50%, -50%)',
        color: 'white',
        fontSize: '14px',
        opacity: 0.7,
        pointerEvents: 'none',
        textAlign: 'center'
      }}>
        <div>Swipe up for next</div>
        <div>Swipe down for previous</div>
      </div>
    </div>
  );
};

export default Reels; 