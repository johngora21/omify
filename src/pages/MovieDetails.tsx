import { useState, useEffect } from 'react';
import { useNavigate, useParams } from 'react-router-dom';
import { IoPlay, IoDownload, IoShareOutline, IoArrowBack, IoStar, IoTime, IoCalendar } from 'react-icons/io5';
import { FaBookmark, FaRegBookmark, FaStar, FaPlay, FaDownload, FaShare } from 'react-icons/fa';

const MovieDetails = () => {
  const navigate = useNavigate();
  const { id } = useParams();
  const [movie, setMovie] = useState<any>(null);
  const [isSaved, setIsSaved] = useState(false);
  const [activeTab, setActiveTab] = useState('overview');
  const [selectedQuality, setSelectedQuality] = useState('1080p');
  const [showTrailer, setShowTrailer] = useState(false);

  // Mock movie data - in real app this would come from API
  const mockMovie = {
    id: id || '1',
    title: 'The Dark Knight',
    originalTitle: 'The Dark Knight',
    year: 2008,
    rating: 4.9,
    duration: '2h 32m',
    genre: 'Action',
    genres: ['Action', 'Crime', 'Drama', 'Thriller'],
    director: 'Christopher Nolan',
    cast: ['Christian Bale', 'Heath Ledger', 'Aaron Eckhart', 'Maggie Gyllenhaal', 'Gary Oldman'],
    poster: 'https://images.unsplash.com/photo-1531259683007-016a7b628fc3?w=800&h=1200&fit=crop',
    backdrop: 'https://images.unsplash.com/photo-1518709268805-4e9042af2176?w=1920&h=1080&fit=crop',
    description: 'When the menace known as the Joker wreaks havoc and chaos on the people of Gotham, Batman must accept one of the greatest psychological and physical tests of his ability to fight injustice.',
    longDescription: 'When the menace known as the Joker wreaks havoc and chaos on the people of Gotham, Batman must accept one of the greatest psychological and physical tests of his ability to fight injustice. As Batman and Lieutenant Jim Gordon continue to work together to clean up the streets of Gotham, a new criminal mastermind known as the Joker emerges from the shadows, creating chaos and testing the limits of Batman\'s moral code.',
    trailer: 'https://www.youtube.com/embed/EXeTwQWrcwY',
    rating: 4.9,
    userRating: 4.8,
    votes: 2500000,
    awards: ['Academy Award for Best Supporting Actor', 'Academy Award for Best Sound Editing'],
    budget: '$185 million',
    boxOffice: '$1.005 billion',
    country: 'United States',
    language: 'English',
    releaseDate: 'July 18, 2008',
    production: 'Warner Bros. Pictures',
    isNew: false,
    isTrending: true,
    isPopular: true,
    ageRating: 'PG-13',
    contentWarnings: ['Violence', 'Intense Action', 'Some Disturbing Images'],
    availableQualities: ['480p', '720p', '1080p', '4K'],
    downloadSizes: {
      '480p': '800MB',
      '720p': '1.5GB',
      '1080p': '3.2GB',
      '4K': '8.5GB'
    },
    subtitles: ['English', 'Spanish', 'French', 'German', 'Italian'],
    audioTracks: ['English (Dolby Digital 5.1)', 'Spanish (Dolby Digital 5.1)', 'French (Dolby Digital 5.1)'],
    relatedMovies: [
      {
        id: '2',
        title: 'Inception',
        poster: 'https://images.unsplash.com/photo-1440404653325-ab127d49abc1?w=300&h=450&fit=crop',
        rating: 4.8
      },
      {
        id: '3',
        title: 'The Matrix',
        poster: 'https://images.unsplash.com/photo-1518709268805-4e9042af2176?w=300&h=450&fit=crop',
        rating: 4.7
      },
      {
        id: '4',
        title: 'The Shawshank Redemption',
        poster: 'https://images.unsplash.com/photo-1518709268805-4e9042af2176?w=300&h=450&fit=crop',
        rating: 4.9
      }
    ]
  };

  useEffect(() => {
    // Simulate API call
    setMovie(mockMovie);
  }, [id]);

  const handlePlay = () => {
    console.log('Playing movie:', movie?.title);
    // Navigate to player or open video player
  };

  const handleDownload = () => {
    console.log('Downloading movie:', movie?.title, 'Quality:', selectedQuality);
    // Handle download logic
  };

  const handleShare = () => {
    if (navigator.share) {
      navigator.share({
        title: movie?.title,
        text: `Check out ${movie?.title} on our platform!`,
        url: window.location.href
      });
    } else {
      // Fallback for browsers that don't support Web Share API
      navigator.clipboard.writeText(window.location.href);
      alert('Link copied to clipboard!');
    }
  };

  const toggleSave = () => {
    setIsSaved(!isSaved);
  };

  if (!movie) {
    return (
      <div style={{
        display: 'flex',
        justifyContent: 'center',
        alignItems: 'center',
        height: '100vh',
        backgroundImage: 'linear-gradient(135deg, #667eea 0%, #764ba2 100%)',
        backgroundSize: 'cover',
        color: 'white'
      }}>
        <div style={{
          display: 'flex',
          flexDirection: 'column',
          alignItems: 'center',
          gap: '20px'
        }}>
          <div style={{
            width: '50px',
            height: '50px',
            border: '3px solid #ffffff',
            borderTop: '3px solid transparent',
            borderRadius: '50%',
            animation: 'spin 1s linear infinite'
          }} />
          <span style={{ fontSize: '18px', fontWeight: '500' }}>Loading movie details...</span>
        </div>
        <style>{`
          @keyframes spin {
            0% { transform: rotate(0deg); }
            100% { transform: rotate(360deg); }
          }
        `}</style>
      </div>
    );
  }

  return (
    <div style={{
      minHeight: '100vh',
      color: 'white',
      backgroundColor: '#0f0f0f'
    }}>
      {/* Full Screen Background Image with Overlaid Content */}
      <div style={{
        position: 'relative',
        height: '70vh',
        overflow: 'hidden'
      }}>
        {/* Background Image */}
        <div style={{
          position: 'absolute',
          top: 0,
          left: 0,
          width: '100%',
          height: '100%',
          backgroundImage: `url(${movie.backdrop})`,
          backgroundSize: 'cover',
          backgroundPosition: 'center',
          zIndex: 0
        }} />
        
        {/* Gradient Overlay */}
        <div style={{
          position: 'absolute',
          top: 0,
          left: 0,
          right: 0,
          bottom: 0,
          background: 'linear-gradient(to bottom, rgba(0,0,0,0.3), rgba(0,0,0,0.8))',
          zIndex: 1
        }} />
        
        {/* Back Button */}
        <button
          onClick={() => navigate(-1)}
          style={{
            position: 'absolute',
            top: '20px',
            left: '20px',
            background: 'rgba(0,0,0,0.7)',
            border: 'none',
            borderRadius: '50%',
            width: '48px',
            height: '48px',
            display: 'flex',
            alignItems: 'center',
            justifyContent: 'center',
            color: 'white',
            cursor: 'pointer',
            backdropFilter: 'blur(10px)',
            zIndex: 10,
            transition: 'all 0.2s ease',
            boxShadow: '0 4px 12px rgba(0,0,0,0.3)'
          }}
          onMouseEnter={(e) => {
            e.currentTarget.style.background = 'rgba(0,0,0,0.9)';
            e.currentTarget.style.transform = 'scale(1.1)';
          }}
          onMouseLeave={(e) => {
            e.currentTarget.style.background = 'rgba(0,0,0,0.7)';
            e.currentTarget.style.transform = 'scale(1)';
          }}
        >
          <IoArrowBack size={24} />
        </button>

        {/* Movie Content Overlay */}
        <div style={{
          position: 'absolute',
          bottom: 0,
          left: 0,
          right: 0,
          padding: window.innerWidth < 768 ? '20px 16px' : '40px 20px',
          zIndex: 2
        }}>
          <div style={{
            maxWidth: window.innerWidth < 768 ? '100%' : '800px',
            margin: '0 auto'
          }}>
            <div style={{
              display: 'grid',
              gridTemplateColumns: window.innerWidth < 768 ? '1fr' : '250px 1fr',
              gap: window.innerWidth < 768 ? '20px' : '40px',
              alignItems: window.innerWidth < 768 ? 'center' : 'end'
            }}>
              {/* Poster */}
              <div style={{
                position: 'relative',
                borderRadius: '12px',
                overflow: 'hidden',
                boxShadow: '0 20px 40px rgba(0,0,0,0.5)',
                maxWidth: window.innerWidth < 768 ? '200px' : '250px',
                margin: window.innerWidth < 768 ? '0 auto' : '0'
              }}>
                <img
                  src={movie.poster}
                  alt={movie.title}
                  style={{
                    width: '100%',
                    height: window.innerWidth < 768 ? '250px' : '375px',
                    objectFit: 'cover'
                  }}
                />
                {/* Play Button Overlay */}
                <div style={{
                  position: 'absolute',
                  top: 0,
                  left: 0,
                  right: 0,
                  bottom: 0,
                  background: 'rgba(0,0,0,0.3)',
                  display: 'flex',
                  alignItems: 'center',
                  justifyContent: 'center',
                  opacity: 0,
                  transition: 'opacity 0.3s ease',
                  cursor: 'pointer'
                }}
                onMouseEnter={(e) => e.currentTarget.style.opacity = '1'}
                onMouseLeave={(e) => e.currentTarget.style.opacity = '0'}
                onClick={handlePlay}
                >
                  <div style={{
                    background: 'rgba(59, 130, 246, 0.9)',
                    borderRadius: '50%',
                    width: '80px',
                    height: '80px',
                    display: 'flex',
                    alignItems: 'center',
                    justifyContent: 'center',
                    backdropFilter: 'blur(10px)'
                  }}>
                    <FaPlay size={30} />
                  </div>
                </div>
              </div>

              {/* Movie Details */}
              <div>
                {/* Title and Basic Info */}
                <div style={{ marginBottom: window.innerWidth < 768 ? '15px' : '20px' }}>
                  <h1 style={{
                    fontSize: window.innerWidth < 768 ? '24px' : '48px',
                    fontWeight: '700',
                    margin: '0 0 10px 0',
                    lineHeight: '1.1',
                    textAlign: window.innerWidth < 768 ? 'center' : 'left'
                  }}>
                    {movie.title}
                  </h1>
                  <div style={{
                    display: 'flex',
                    alignItems: 'center',
                    gap: window.innerWidth < 768 ? '8px' : '20px',
                    fontSize: window.innerWidth < 768 ? '12px' : '16px',
                    color: '#cccccc',
                    marginBottom: '15px',
                    flexWrap: 'wrap',
                    justifyContent: window.innerWidth < 768 ? 'center' : 'flex-start'
                  }}>
                    <span>{movie.year}</span>
                    <span>•</span>
                    <span>{movie.duration}</span>
                    <span>•</span>
                    <span style={{
                      display: 'flex',
                      alignItems: 'center',
                      gap: '4px'
                    }}>
                      <FaStar size={window.innerWidth < 768 ? 12 : 14} color="#fbbf24" />
                      {movie.rating}
                    </span>
                  </div>
                  <div style={{
                    display: 'flex',
                    flexWrap: 'wrap',
                    gap: window.innerWidth < 768 ? '6px' : '8px',
                    marginBottom: '20px',
                    justifyContent: window.innerWidth < 768 ? 'center' : 'flex-start'
                  }}>
                    {movie.genres.map((genre: string) => (
                      <span key={genre} style={{
                        backgroundColor: 'rgba(255,255,255,0.1)',
                        padding: window.innerWidth < 768 ? '3px 8px' : '4px 12px',
                        borderRadius: '20px',
                        fontSize: window.innerWidth < 768 ? '10px' : '14px'
                      }}>
                        {genre}
                      </span>
                    ))}
                  </div>
                </div>

                {/* Description */}
                <p style={{
                  fontSize: window.innerWidth < 768 ? '14px' : '18px',
                  lineHeight: '1.6',
                  color: '#cccccc',
                  marginBottom: window.innerWidth < 768 ? '20px' : '30px',
                  maxWidth: window.innerWidth < 768 ? '100%' : '400px',
                  textAlign: window.innerWidth < 768 ? 'center' : 'left'
                }}>
                  {movie.description}
                </p>

                {/* Action Buttons */}
                <div style={{
                  display: 'flex',
                  gap: window.innerWidth < 768 ? '8px' : '15px',
                  marginBottom: window.innerWidth < 768 ? '20px' : '30px',
                  flexWrap: window.innerWidth < 768 ? 'wrap' : 'nowrap',
                  justifyContent: window.innerWidth < 768 ? 'center' : 'flex-start'
                }}>
                  <button
                    onClick={handlePlay}
                    style={{
                      background: 'linear-gradient(135deg, #3b82f6, #1d4ed8)',
                      color: 'white',
                      border: 'none',
                      borderRadius: '8px',
                      padding: '15px 30px',
                      fontSize: '16px',
                      fontWeight: '600',
                      cursor: 'pointer',
                      display: 'flex',
                      alignItems: 'center',
                      gap: '8px',
                      transition: 'all 0.2s ease'
                    }}
                    onMouseEnter={(e) => e.currentTarget.style.transform = 'scale(1.02)'}
                    onMouseLeave={(e) => e.currentTarget.style.transform = 'scale(1)'}
                  >
                    <FaPlay size={16} />
                    Watch Now
                  </button>
                  <button
                    onClick={handleDownload}
                    style={{
                      background: 'rgba(255,255,255,0.1)',
                      color: 'white',
                      border: '1px solid rgba(255,255,255,0.3)',
                      borderRadius: '8px',
                      padding: '15px',
                      cursor: 'pointer',
                      display: 'flex',
                      alignItems: 'center',
                      gap: '8px',
                      transition: 'all 0.2s ease'
                    }}
                    onMouseEnter={(e) => e.currentTarget.style.background = 'rgba(255,255,255,0.2)'}
                    onMouseLeave={(e) => e.currentTarget.style.background = 'rgba(255,255,255,0.1)'}
                  >
                    <FaDownload size={16} />
                    Download
                  </button>
                  <button
                    onClick={toggleSave}
                    style={{
                      background: 'rgba(255,255,255,0.1)',
                      color: isSaved ? '#ffa502' : 'white',
                      border: '1px solid rgba(255,255,255,0.3)',
                      borderRadius: '8px',
                      padding: '15px',
                      cursor: 'pointer',
                      transition: 'all 0.2s ease'
                    }}
                    onMouseEnter={(e) => e.currentTarget.style.background = 'rgba(255,255,255,0.2)'}
                    onMouseLeave={(e) => e.currentTarget.style.background = 'rgba(255,255,255,0.1)'}
                  >
                    <FaBookmark size={16} />
                  </button>
                  <button
                    onClick={handleShare}
                    style={{
                      background: 'rgba(255,255,255,0.1)',
                      color: 'white',
                      border: '1px solid rgba(255,255,255,0.3)',
                      borderRadius: '8px',
                      padding: '15px',
                      cursor: 'pointer',
                      transition: 'all 0.2s ease'
                    }}
                    onMouseEnter={(e) => e.currentTarget.style.background = 'rgba(255,255,255,0.2)'}
                    onMouseLeave={(e) => e.currentTarget.style.background = 'rgba(255,255,255,0.1)'}
                  >
                    <FaShare size={16} />
                  </button>
                </div>

                {/* Cast */}
                <div style={{ 
                  marginBottom: window.innerWidth < 768 ? '15px' : '20px',
                  textAlign: window.innerWidth < 768 ? 'center' : 'left'
                }}>
                  <span style={{ color: '#cccccc', fontSize: window.innerWidth < 768 ? '12px' : '14px' }}>Cast: </span>
                  <span style={{ color: 'white', fontSize: window.innerWidth < 768 ? '12px' : '14px' }}>
                    {movie.cast.slice(0, 4).join(', ')}
                    {movie.cast.length > 4 && '...'}
                  </span>
                </div>

                {/* Director */}
                <div style={{
                  textAlign: window.innerWidth < 768 ? 'center' : 'left'
                }}>
                  <span style={{ color: '#cccccc', fontSize: window.innerWidth < 768 ? '12px' : '14px' }}>Director: </span>
                  <span style={{ color: 'white', fontSize: window.innerWidth < 768 ? '12px' : '14px' }}>{movie.director}</span>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>

      {/* Content Tabs */}
      <div style={{
        maxWidth: '1200px',
        margin: '0 auto',
        padding: window.innerWidth < 768 ? '20px 16px' : '40px 20px'
      }}>
        {/* Tab Navigation */}
        <div style={{
          display: 'flex',
          borderBottom: '1px solid #333',
          marginBottom: '30px',
          overflowX: 'auto',
          flexWrap: window.innerWidth < 768 ? 'wrap' : 'nowrap'
        }}>
          {[
            { id: 'overview', label: 'Overview' },
            { id: 'details', label: 'Details' },
            { id: 'download', label: 'Download' },
            { id: 'related', label: 'More Like This' }
          ].map((tab) => (
            <button
              key={tab.id}
              onClick={() => setActiveTab(tab.id)}
              style={{
                background: 'none',
                border: 'none',
                color: activeTab === tab.id ? 'white' : '#cccccc',
                padding: window.innerWidth < 768 ? '10px 15px' : '15px 30px',
                fontSize: window.innerWidth < 768 ? '14px' : '16px',
                fontWeight: '500',
                cursor: 'pointer',
                borderBottom: activeTab === tab.id ? '2px solid #3b82f6' : 'none',
                transition: 'all 0.2s ease',
                whiteSpace: 'nowrap'
              }}
            >
              {tab.label}
            </button>
          ))}
        </div>

        {/* Tab Content */}
        <div>
          {activeTab === 'overview' && (
            <div>
              <h3 style={{ fontSize: '24px', marginBottom: '20px' }}>Synopsis</h3>
              <p style={{
                fontSize: '16px',
                lineHeight: '1.6',
                color: '#cccccc',
                marginBottom: '30px'
              }}>
                {movie.longDescription}
              </p>

              {/* Awards */}
              {movie.awards.length > 0 && (
                <div style={{ marginBottom: '30px' }}>
                  <h4 style={{ fontSize: '18px', marginBottom: '10px' }}>Awards</h4>
                  <ul style={{ color: '#cccccc', paddingLeft: '20px' }}>
                    {movie.awards.map((award: string) => (
                      <li key={award} style={{ marginBottom: '5px' }}>{award}</li>
                    ))}
                  </ul>
                </div>
              )}

              {/* Content Warnings */}
              {movie.contentWarnings.length > 0 && (
                <div>
                  <h4 style={{ fontSize: '18px', marginBottom: '10px' }}>Content Warnings</h4>
                  <div style={{ display: 'flex', gap: '10px', flexWrap: 'wrap' }}>
                    {movie.contentWarnings.map((warning: string) => (
                      <span key={warning} style={{
                        backgroundColor: 'rgba(239, 68, 68, 0.2)',
                        color: '#ef4444',
                        padding: '4px 12px',
                        borderRadius: '20px',
                        fontSize: '14px'
                      }}>
                        {warning}
                      </span>
                    ))}
                  </div>
                </div>
              )}
            </div>
          )}

          {activeTab === 'details' && (
            <div style={{
              display: 'grid',
              gridTemplateColumns: 'repeat(auto-fit, minmax(300px, 1fr))',
              gap: '30px'
            }}>
              <div>
                <h4 style={{ fontSize: '18px', marginBottom: '15px' }}>Production Details</h4>
                <div style={{ color: '#cccccc' }}>
                  <div style={{ marginBottom: '10px' }}>
                    <span style={{ color: '#999' }}>Production: </span>
                    {movie.production}
                  </div>
                  <div style={{ marginBottom: '10px' }}>
                    <span style={{ color: '#999' }}>Budget: </span>
                    {movie.budget}
                  </div>
                  <div style={{ marginBottom: '10px' }}>
                    <span style={{ color: '#999' }}>Box Office: </span>
                    {movie.boxOffice}
                  </div>
                  <div style={{ marginBottom: '10px' }}>
                    <span style={{ color: '#999' }}>Country: </span>
                    {movie.country}
                  </div>
                  <div style={{ marginBottom: '10px' }}>
                    <span style={{ color: '#999' }}>Language: </span>
                    {movie.language}
                  </div>
                  <div style={{ marginBottom: '10px' }}>
                    <span style={{ color: '#999' }}>Release Date: </span>
                    {movie.releaseDate}
                  </div>
                </div>
              </div>

              <div>
                <h4 style={{ fontSize: '18px', marginBottom: '15px' }}>Audio & Subtitles</h4>
                <div style={{ color: '#cccccc' }}>
                  <div style={{ marginBottom: '15px' }}>
                    <div style={{ color: '#999', marginBottom: '5px' }}>Audio Tracks:</div>
                    {movie.audioTracks.map((track: string) => (
                      <div key={track} style={{ fontSize: '14px', marginBottom: '3px' }}>{track}</div>
                    ))}
                  </div>
                  <div>
                    <div style={{ color: '#999', marginBottom: '5px' }}>Subtitles:</div>
                    <div style={{ display: 'flex', flexWrap: 'wrap', gap: '5px' }}>
                      {movie.subtitles.map((subtitle: string) => (
                        <span key={subtitle} style={{
                          backgroundColor: 'rgba(255,255,255,0.1)',
                          padding: '2px 8px',
                          borderRadius: '4px',
                          fontSize: '12px'
                        }}>
                          {subtitle}
                        </span>
                      ))}
                    </div>
                  </div>
                </div>
              </div>
            </div>
          )}

          {activeTab === 'download' && (
            <div>
              <h3 style={{ fontSize: '24px', marginBottom: '20px' }}>Download Options</h3>
              <div style={{
                display: 'grid',
                gridTemplateColumns: window.innerWidth < 768 ? '1fr' : 'repeat(4, 1fr)',
                gap: window.innerWidth < 768 ? '15px' : '20px',
                maxWidth: window.innerWidth < 768 ? '100%' : '900px',
                margin: '0 auto'
              }}>
                {movie.availableQualities.map((quality: string) => (
                  <div key={quality} style={{
                    border: selectedQuality === quality ? '2px solid #3b82f6' : '1px solid #333',
                    borderRadius: '12px',
                    padding: window.innerWidth < 768 ? '15px' : '16px',
                    cursor: 'pointer',
                    transition: 'all 0.2s ease',
                    maxWidth: window.innerWidth < 768 ? '100%' : 'none',
                    width: window.innerWidth < 768 ? '100%' : 'auto'
                  }}
                  onClick={() => setSelectedQuality(quality)}
                  >
                    <div style={{
                      display: 'flex',
                      justifyContent: 'space-between',
                      alignItems: 'center',
                      marginBottom: window.innerWidth < 768 ? '10px' : '8px'
                    }}>
                      <h4 style={{ fontSize: window.innerWidth < 768 ? '16px' : '16px', margin: 0 }}>{quality}</h4>
                      <span style={{
                        backgroundColor: selectedQuality === quality ? '#3b82f6' : '#333',
                        color: 'white',
                        padding: '4px 8px',
                        borderRadius: '4px',
                        fontSize: window.innerWidth < 768 ? '10px' : '11px'
                      }}>
                        {movie.downloadSizes[quality]}
                      </span>
                    </div>
                    <p style={{ 
                      color: '#cccccc', 
                      fontSize: window.innerWidth < 768 ? '12px' : '12px', 
                      margin: window.innerWidth < 768 ? '0 0 15px 0' : '0 0 12px 0',
                      lineHeight: '1.3'
                    }}>
                      High quality download with all audio tracks and subtitles
                    </p>
                    <button
                      onClick={handleDownload}
                      style={{
                        background: selectedQuality === quality ? '#3b82f6' : '#333',
                        color: 'white',
                        border: 'none',
                        borderRadius: '6px',
                        padding: window.innerWidth < 768 ? '10px 20px' : '8px 16px',
                        fontSize: window.innerWidth < 768 ? '14px' : '13px',
                        cursor: 'pointer',
                        width: '100%',
                        transition: 'all 0.2s ease'
                      }}
                    >
                      <FaDownload size={window.innerWidth < 768 ? 14 : 12} style={{ marginRight: '8px' }} />
                      Download {quality}
                    </button>
                  </div>
                ))}
              </div>
            </div>
          )}

          {activeTab === 'related' && (
            <div>
              <h3 style={{ fontSize: '24px', marginBottom: '20px' }}>More Like This</h3>
              <div style={{
                display: 'grid',
                gridTemplateColumns: 'repeat(auto-fill, minmax(200px, 1fr))',
                gap: '20px'
              }}>
                {movie.relatedMovies.map((related: any) => (
                  <div key={related.id} style={{
                    cursor: 'pointer',
                    transition: 'transform 0.2s ease'
                  }}
                  onMouseEnter={(e) => e.currentTarget.style.transform = 'scale(1.05)'}
                  onMouseLeave={(e) => e.currentTarget.style.transform = 'scale(1)'}
                  onClick={() => navigate(`/movie/${related.id}`)}
                  >
                    <img
                      src={related.poster}
                      alt={related.title}
                      style={{
                        width: '100%',
                        height: '300px',
                        objectFit: 'cover',
                        borderRadius: '8px',
                        marginBottom: '10px'
                      }}
                    />
                    <h4 style={{ fontSize: '16px', margin: '0 0 5px 0' }}>{related.title}</h4>
                    <div style={{ display: 'flex', alignItems: 'center', gap: '4px' }}>
                      <FaStar color="#fbbf24" size={14} />
                      <span style={{ fontSize: '14px', color: '#cccccc' }}>{related.rating}</span>
                    </div>
                  </div>
                ))}
              </div>
            </div>
          )}
        </div>
      </div>
    </div>
  );
};

export default MovieDetails; 