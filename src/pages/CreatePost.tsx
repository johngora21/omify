import { useState, useRef } from 'react';
import { useNavigate } from 'react-router-dom';
import { IoClose, IoCamera, IoVideocam, IoMic, IoMusicalNotes, IoColorPalette, IoSparkles, IoRadio, IoImage, IoText } from 'react-icons/io5';
import { BiSpa } from 'react-icons/bi';
import { MdVideoLibrary } from 'react-icons/md';

const CreatePost = () => {
  const navigate = useNavigate();
  const [activeTab, setActiveTab] = useState('video');
  const [isRecording, setIsRecording] = useState(false);
  const [selectedMusic, setSelectedMusic] = useState('');
  const [selectedFilter, setSelectedFilter] = useState('normal');
  const [caption, setCaption] = useState('');
  const [isLive, setIsLive] = useState(false);
  const videoRef = useRef<HTMLVideoElement>(null);

  const tabs = [
    { id: 'video', label: 'Video', icon: IoVideocam },
    { id: 'photo', label: 'Photo', icon: IoCamera },
    { id: 'live', label: 'Live', icon: IoRadio },
    { id: 'story', label: 'Story', icon: IoSparkles }
  ];

  const musicOptions = [
    { id: '1', title: 'Trending Beat', artist: 'Popular Artist', duration: '0:30' },
    { id: '2', title: 'Chill Vibes', artist: 'Chill Artist', duration: '0:45' },
    { id: '3', title: 'Upbeat Energy', artist: 'Energy Artist', duration: '0:60' },
    { id: '4', title: 'Romantic Mood', artist: 'Romance Artist', duration: '0:30' }
  ];

  const filters = [
    { id: 'normal', name: 'Normal' },
    { id: 'warm', name: 'Warm' },
    { id: 'cool', name: 'Cool' },
    { id: 'vintage', name: 'Vintage' },
    { id: 'dramatic', name: 'Dramatic' },
    { id: 'bright', name: 'Bright' }
  ];

  const handleStartRecording = () => {
    setIsRecording(true);
    // Simulate recording
    setTimeout(() => {
      setIsRecording(false);
    }, 5000);
  };

  const handlePost = () => {
    // Handle post creation
    console.log('Posting:', { activeTab, caption, selectedMusic, selectedFilter });
    navigate('/'); // Navigate back to home after posting
  };

  const handleClose = () => {
    navigate('/'); // Navigate back to home when close is clicked
  };

  return (
    <div style={{
      position: 'fixed',
      top: 0,
      left: 0,
      right: 0,
      bottom: 0,
      background: '#000',
      zIndex: 2000,
      display: 'flex',
      flexDirection: 'column'
    }}>
      {/* Header */}
      <div style={{
        display: 'flex',
        justifyContent: 'space-between',
        alignItems: 'center',
        padding: '20px',
        background: 'rgba(0, 0, 0, 0.8)',
        backdropFilter: 'blur(10px)'
      }}>
        <button
          onClick={handleClose}
          style={{
            background: 'none',
            border: 'none',
            color: 'white',
            fontSize: '24px',
            cursor: 'pointer'
          }}
        >
          <IoClose />
        </button>
        <h2 style={{ color: 'white', margin: 0, fontSize: '18px', fontWeight: '600' }}>
          Create Content
        </h2>
        <button
          onClick={handlePost}
          style={{
            background: '#3b82f6',
            color: 'white',
            border: 'none',
            padding: '8px 16px',
            borderRadius: '20px',
            fontSize: '14px',
            fontWeight: '600',
            cursor: 'pointer'
          }}
        >
          Post
        </button>
      </div>

      {/* Main Content Area */}
      <div style={{ flex: 1, display: 'flex', flexDirection: 'column' }}>
        {/* Camera/Video Preview */}
        <div style={{
          flex: 1,
          background: 'linear-gradient(135deg, #667eea 0%, #764ba2 100%)',
          display: 'flex',
          alignItems: 'center',
          justifyContent: 'center',
          position: 'relative'
        }}>
          <video
            ref={videoRef}
            style={{
              width: '100%',
              height: '100%',
              objectFit: 'cover'
            }}
            autoPlay
            muted
            playsInline
          />
          
          {/* Recording Indicator */}
          {isRecording && (
            <div style={{
              position: 'absolute',
              top: '20px',
              left: '50%',
              transform: 'translateX(-50%)',
              background: 'rgba(255, 0, 0, 0.8)',
              color: 'white',
              padding: '8px 16px',
              borderRadius: '20px',
              fontSize: '14px',
              fontWeight: '600'
            }}>
              REC
            </div>
          )}

          {/* Camera Controls */}
          <div style={{
            position: 'absolute',
            bottom: '20px',
            left: '50%',
            transform: 'translateX(-50%)',
            display: 'flex',
            gap: '20px',
            alignItems: 'center'
          }}>
            <button
              style={{
                width: '60px',
                height: '60px',
                borderRadius: '50%',
                background: isRecording ? '#ef4444' : '#3b82f6',
                border: '4px solid white',
                cursor: 'pointer',
                display: 'flex',
                alignItems: 'center',
                justifyContent: 'center'
              }}
              onClick={handleStartRecording}
            >
              {isRecording ? (
                <div style={{ width: '20px', height: '20px', background: 'white', borderRadius: '4px' }} />
              ) : (
                <IoVideocam size={24} color="white" />
              )}
            </button>
          </div>
        </div>

        {/* Bottom Controls */}
        <div style={{
          background: 'rgba(0, 0, 0, 0.9)',
          padding: '20px',
          backdropFilter: 'blur(10px)'
        }}>
          {/* Tabs */}
          <div style={{
            display: 'flex',
            justifyContent: 'space-around',
            marginBottom: '20px'
          }}>
            {tabs.map((tab) => {
              const IconComponent = tab.icon;
              const isActive = activeTab === tab.id;
              
              return (
                <button
                  key={tab.id}
                  onClick={() => setActiveTab(tab.id)}
                  style={{
                    display: 'flex',
                    flexDirection: 'column',
                    alignItems: 'center',
                    gap: '4px',
                    background: 'none',
                    border: 'none',
                    color: isActive ? '#3b82f6' : '#9ca3af',
                    cursor: 'pointer',
                    padding: '8px'
                  }}
                >
                  <IconComponent size={24} />
                  <span style={{ fontSize: '12px', fontWeight: isActive ? '600' : '500' }}>
                    {tab.label}
                  </span>
                </button>
              );
            })}
          </div>

          {/* Content Options */}
          <div style={{ display: 'flex', gap: '15px', marginBottom: '20px' }}>
            {/* Music */}
            <button
              style={{
                display: 'flex',
                alignItems: 'center',
                gap: '8px',
                background: 'rgba(255, 255, 255, 0.1)',
                border: '1px solid rgba(255, 255, 255, 0.2)',
                borderRadius: '20px',
                padding: '8px 16px',
                color: 'white',
                cursor: 'pointer'
              }}
            >
              <IoMusicalNotes size={16} />
              <span style={{ fontSize: '14px' }}>Music</span>
            </button>

            {/* Filters */}
            <button
              style={{
                display: 'flex',
                alignItems: 'center',
                gap: '8px',
                background: 'rgba(255, 255, 255, 0.1)',
                border: '1px solid rgba(255, 255, 255, 0.2)',
                borderRadius: '20px',
                padding: '8px 16px',
                color: 'white',
                cursor: 'pointer'
              }}
            >
              <IoColorPalette size={16} />
              <span style={{ fontSize: '14px' }}>Filters</span>
            </button>

            {/* Effects */}
            <button
              style={{
                display: 'flex',
                alignItems: 'center',
                gap: '8px',
                background: 'rgba(255, 255, 255, 0.1)',
                border: '1px solid rgba(255, 255, 255, 0.2)',
                borderRadius: '20px',
                padding: '8px 16px',
                color: 'white',
                cursor: 'pointer'
              }}
            >
              <IoSparkles size={16} />
              <span style={{ fontSize: '14px' }}>Effects</span>
            </button>
          </div>

          {/* Caption Input */}
          <div style={{
            background: 'rgba(255, 255, 255, 0.1)',
            borderRadius: '12px',
            padding: '12px',
            marginBottom: '20px'
          }}>
            <textarea
              value={caption}
              onChange={(e) => setCaption(e.target.value)}
              placeholder="Write a caption..."
              style={{
                width: '100%',
                background: 'none',
                border: 'none',
                color: 'white',
                fontSize: '14px',
                resize: 'none',
                outline: 'none',
                minHeight: '60px'
              }}
            />
          </div>

          {/* Music Selection (Hidden by default, can be toggled) */}
          {selectedMusic && (
            <div style={{
              background: 'rgba(255, 255, 255, 0.1)',
              borderRadius: '12px',
              padding: '12px',
              marginBottom: '20px'
            }}>
              <h4 style={{ color: 'white', margin: '0 0 8px 0', fontSize: '14px' }}>Selected Music</h4>
              <div style={{ color: '#9ca3af', fontSize: '12px' }}>
                {musicOptions.find(m => m.id === selectedMusic)?.title} - {musicOptions.find(m => m.id === selectedMusic)?.artist}
              </div>
            </div>
          )}
        </div>
      </div>
    </div>
  );
};

export default CreatePost; 