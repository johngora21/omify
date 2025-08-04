import { useState } from 'react';
import { useNavigate } from 'react-router-dom';
import { IoArrowBack, IoBookmark, IoBookmarkOutline, IoDownload, IoDownloadOutline, IoStar, IoPlay } from 'react-icons/io5';
import { FaStar, FaRegBookmark, FaBookmark } from 'react-icons/fa';

const Movies = ({ onMenuClick }: { onMenuClick?: () => void }) => {
  const navigate = useNavigate();
  const [activeTab, setActiveTab] = useState('saved');

  // Mock data for saved movies
  const savedMovies = [
    {
      id: '1',
      title: 'Inception',
      poster: 'https://images.unsplash.com/photo-1489599839927-2df91e0c6d4b?w=300&h=450&fit=crop',
      rating: 8.8,
      year: 2010,
      duration: '2h 28m',
      genre: 'Sci-Fi',
      director: 'Christopher Nolan',
      cast: ['Leonardo DiCaprio', 'Joseph Gordon-Levitt', 'Ellen Page'],
      description: 'A thief who steals corporate secrets through the use of dream-sharing technology is given the inverse task of planting an idea into the mind of a C.E.O.',
      isTrending: true
    },
    {
      id: '2',
      title: 'The Dark Knight',
      poster: 'https://images.unsplash.com/photo-1531259683001-31fb755c6c07?w=300&h=450&fit=crop',
      rating: 9.0,
      year: 2008,
      duration: '2h 32m',
      genre: 'Action',
      director: 'Christopher Nolan',
      cast: ['Christian Bale', 'Heath Ledger', 'Aaron Eckhart'],
      description: 'When the menace known as the Joker wreaks havoc and chaos on the people of Gotham, Batman must accept one of the greatest psychological and physical tests of his ability to fight injustice.',
      isTrending: true
    },
    {
      id: '3',
      title: 'Interstellar',
      poster: 'https://images.unsplash.com/photo-1446776877081-d282a0f896e2?w=300&h=450&fit=crop',
      rating: 8.6,
      year: 2014,
      duration: '2h 49m',
      genre: 'Sci-Fi',
      director: 'Christopher Nolan',
      cast: ['Matthew McConaughey', 'Anne Hathaway', 'Jessica Chastain'],
      description: 'A team of explorers travel through a wormhole in space in an attempt to ensure humanity\'s survival.',
      isTrending: false
    }
  ];

  // Mock data for downloaded movies
  const downloadedMovies = [
    {
      id: '4',
      title: 'Avatar',
      poster: 'https://images.unsplash.com/photo-1506905925346-21bda4d6df45?w=300&h=450&fit=crop',
      rating: 7.8,
      year: 2009,
      duration: '2h 42m',
      genre: 'Sci-Fi',
      director: 'James Cameron',
      cast: ['Sam Worthington', 'Zoe Saldana', 'Sigourney Weaver'],
      description: 'A paraplegic marine dispatched to the moon Pandora on a unique mission becomes torn between following his orders and protecting the world he feels is his home.',
      downloadDate: '2024-01-15',
      isTrending: false
    },
    {
      id: '5',
      title: 'The Matrix',
      poster: 'https://images.unsplash.com/photo-1518709268805-4e9042af2176?w=300&h=450&fit=crop',
      rating: 8.7,
      year: 1999,
      duration: '2h 16m',
      genre: 'Sci-Fi',
      director: 'Lana Wachowski',
      cast: ['Keanu Reeves', 'Laurence Fishburne', 'Carrie-Anne Moss'],
      description: 'A computer programmer discovers that reality as he knows it is a simulation created by machines, and joins a rebellion to break free.',
      downloadDate: '2024-01-10',
      isTrending: true
    }
  ];

  const handleMovieClick = (movieId: string) => {
    navigate(`/movie/${movieId}`);
  };

  const handlePlay = (movieId: string) => {
    console.log('Play movie:', movieId);
  };

  const toggleSave = (movieId: string) => {
    console.log('Toggle save for movie:', movieId);
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
        borderBottom: '1px solid #e5e7eb',
        position: 'relative'
      }}>
        {/* Back Arrow */}
        <button
          onClick={() => onMenuClick ? onMenuClick() : navigate('/')}
          style={{
            position: 'absolute',
            top: '50%',
            left: '16px',
            transform: 'translateY(-50%)',
            background: 'rgba(0, 0, 0, 0.1)',
            border: 'none',
            borderRadius: '50%',
            width: '40px',
            height: '40px',
            display: 'flex',
            alignItems: 'center',
            justifyContent: 'center',
            cursor: 'pointer',
            zIndex: 10
          }}
        >
          <IoArrowBack size={20} color="#1a1a1a" />
        </button>
        
        {/* Title */}
        <div style={{
          textAlign: 'center',
          fontSize: '20px',
          fontWeight: '600',
          color: '#1a1a1a'
        }}>
          Movies
        </div>
      </div>

      {/* Tab Navigation */}
      <div style={{
        background: 'white',
        padding: '16px',
        borderBottom: '1px solid #e5e7eb'
      }}>
        <div style={{
          display: 'flex',
          gap: '8px',
          maxWidth: '400px',
          margin: '0 auto'
        }}>
          <button
            onClick={() => setActiveTab('saved')}
            style={{
              flex: 1,
              padding: '12px 16px',
              background: activeTab === 'saved' ? '#3b82f6' : '#f3f4f6',
              color: activeTab === 'saved' ? 'white' : '#6b7280',
              border: 'none',
              borderRadius: '8px',
              fontSize: '14px',
              fontWeight: '500',
              cursor: 'pointer',
              transition: 'all 0.2s ease'
            }}
          >
            Saved ({savedMovies.length})
          </button>
          <button
            onClick={() => setActiveTab('downloaded')}
            style={{
              flex: 1,
              padding: '12px 16px',
              background: activeTab === 'downloaded' ? '#3b82f6' : '#f3f4f6',
              color: activeTab === 'downloaded' ? 'white' : '#6b7280',
              border: 'none',
              borderRadius: '8px',
              fontSize: '14px',
              fontWeight: '500',
              cursor: 'pointer',
              transition: 'all 0.2s ease'
            }}
          >
            Downloaded ({downloadedMovies.length})
          </button>
        </div>
      </div>

      {/* Content */}
      <div style={{ padding: '16px' }}>
        {activeTab === 'saved' && (
          <div>
            {savedMovies.length > 0 ? (
              <div style={{
                display: 'grid',
                gridTemplateColumns: 'repeat(2, 1fr)',
                gap: '16px',
                maxWidth: '800px',
                margin: '0 auto'
              }}>
                {savedMovies.map((movie) => (
                  <div key={movie.id} style={{
                    backgroundColor: 'white',
                    borderRadius: '12px',
                    overflow: 'hidden',
                    boxShadow: '0 2px 8px rgba(0,0,0,0.1)',
                    transition: 'all 0.3s ease',
                    cursor: 'pointer',
                    border: '1px solid #f1f5f9'
                  }}
                  onClick={() => handleMovieClick(movie.id)}
                  onMouseEnter={(e) => {
                    e.currentTarget.style.transform = 'translateY(-2px)';
                    e.currentTarget.style.boxShadow = '0 8px 25px rgba(0,0,0,0.15)';
                  }}
                  onMouseLeave={(e) => {
                    e.currentTarget.style.transform = 'translateY(0)';
                    e.currentTarget.style.boxShadow = '0 2px 8px rgba(0,0,0,0.1)';
                  }}
                  >
                    {/* Poster */}
                    <div style={{ position: 'relative' }}>
                      <img
                        src={movie.poster}
                        alt={movie.title}
                        style={{
                          width: '100%',
                          height: '280px',
                          objectFit: 'cover'
                        }}
                      />
                      {/* Overlay with play button */}
                      <div style={{
                        position: 'absolute',
                        top: 0,
                        left: 0,
                        right: 0,
                        bottom: 0,
                        background: 'linear-gradient(to bottom, rgba(0,0,0,0.1), rgba(0,0,0,0.6))',
                        display: 'flex',
                        alignItems: 'center',
                        justifyContent: 'center',
                        opacity: 0,
                        transition: 'opacity 0.3s ease'
                      }}
                      className="hover:opacity-100"
                      >
                        <button
                          onClick={(e) => {
                            e.stopPropagation();
                            handlePlay(movie.id);
                          }}
                          style={{
                            background: 'rgba(59, 130, 246, 0.9)',
                            color: 'white',
                            border: 'none',
                            borderRadius: '50%',
                            width: '56px',
                            height: '56px',
                            display: 'flex',
                            alignItems: 'center',
                            justifyContent: 'center',
                            cursor: 'pointer',
                            transition: 'all 0.2s ease',
                            backdropFilter: 'blur(10px)'
                          }}
                        >
                          <IoPlay size={24} />
                        </button>
                      </div>
                      
                      {/* Badges */}
                      <div style={{
                        position: 'absolute',
                        top: '12px',
                        left: '12px',
                        display: 'flex',
                        flexDirection: 'column',
                        gap: '6px'
                      }}>
                        {movie.isTrending && (
                          <div style={{
                            background: '#3b82f6',
                            color: 'white',
                            padding: '4px 8px',
                            borderRadius: '6px',
                            fontSize: '10px',
                            fontWeight: '600',
                            textTransform: 'uppercase'
                          }}>
                            🔥 Trending
                          </div>
                        )}
                      </div>

                      {/* Rating */}
                      <div style={{
                        position: 'absolute',
                        bottom: '12px',
                        right: '12px',
                        background: 'rgba(0,0,0,0.8)',
                        color: 'white',
                        padding: '4px 8px',
                        borderRadius: '6px',
                        fontSize: '12px',
                        fontWeight: '600',
                        display: 'flex',
                        alignItems: 'center',
                        gap: '4px'
                      }}>
                        <FaStar size={12} color="#fbbf24" />
                        {movie.rating}
                      </div>
                    </div>

                    {/* Content Info */}
                    <div style={{ padding: '16px' }}>
                      {/* Title and Year */}
                      <div style={{ marginBottom: '8px' }}>
                        <h3 style={{
                          fontSize: '16px',
                          fontWeight: '700',
                          color: '#1a1a1a',
                          margin: 0,
                          marginBottom: '4px',
                          lineHeight: '1.2'
                        }}>
                          {movie.title}
                        </h3>
                        <div style={{
                          display: 'flex',
                          alignItems: 'center',
                          gap: '8px',
                          fontSize: '13px',
                          color: '#6b7280'
                        }}>
                          <span>{movie.year}</span>
                          <span>•</span>
                          <span>{movie.duration}</span>
                          <span>•</span>
                          <span style={{
                            backgroundColor: '#f3f4f6',
                            color: '#374151',
                            padding: '2px 6px',
                            borderRadius: '4px',
                            fontSize: '11px',
                            fontWeight: '500'
                          }}>
                            {movie.genre}
                          </span>
                        </div>
                      </div>

                      {/* Description */}
                      <p style={{
                        fontSize: '13px',
                        color: '#6b7280',
                        lineHeight: '1.4',
                        marginBottom: '12px',
                        display: '-webkit-box',
                        WebkitLineClamp: 2,
                        WebkitBoxOrient: 'vertical',
                        overflow: 'hidden',
                        height: '36px'
                      }}>
                        {movie.description}
                      </p>

                      {/* Cast */}
                      <div style={{
                        fontSize: '12px',
                        color: '#9ca3af',
                        marginBottom: '12px',
                        display: '-webkit-box',
                        WebkitLineClamp: 1,
                        WebkitBoxOrient: 'vertical',
                        overflow: 'hidden'
                      }}>
                        <span style={{ fontWeight: '500', color: '#6b7280' }}>Cast: </span>
                        {movie.cast.slice(0, 3).join(', ')}
                        {movie.cast.length > 3 && '...'}
                      </div>

                      {/* Action Buttons */}
                      <div style={{ display: 'flex', alignItems: 'center', gap: '8px' }}>
                        <button
                          onClick={(e) => {
                            e.stopPropagation();
                            handlePlay(movie.id);
                          }}
                          style={{
                            flex: 1,
                            background: 'linear-gradient(135deg, #3b82f6, #1d4ed8)',
                            color: 'white',
                            border: 'none',
                            borderRadius: '8px',
                            padding: '10px 16px',
                            fontSize: '14px',
                            fontWeight: '600',
                            cursor: 'pointer',
                            display: 'flex',
                            alignItems: 'center',
                            justifyContent: 'center',
                            gap: '6px',
                            transition: 'all 0.2s ease'
                          }}
                          onMouseEnter={(e) => e.currentTarget.style.transform = 'scale(1.02)'}
                          onMouseLeave={(e) => e.currentTarget.style.transform = 'scale(1)'}
                        >
                          <IoPlay size={16} />
                          Watch Now
                        </button>
                        <button
                          onClick={(e) => {
                            e.stopPropagation();
                            toggleSave(movie.id);
                          }}
                          style={{
                            background: 'none',
                            border: '1px solid #e5e7eb',
                            borderRadius: '8px',
                            padding: '10px',
                            cursor: 'pointer',
                            color: '#ffa502',
                            transition: 'all 0.2s ease'
                          }}
                          onMouseEnter={(e) => e.currentTarget.style.borderColor = '#ffa502'}
                          onMouseLeave={(e) => e.currentTarget.style.borderColor = '#e5e7eb'}
                        >
                          <FaBookmark size={16} />
                        </button>
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
                  No saved movies yet
                </h3>
                <p style={{
                  fontSize: '14px',
                  color: '#9ca3af'
                }}>
                  Start saving movies you like to see them here
                </p>
              </div>
            )}
          </div>
        )}

        {activeTab === 'downloaded' && (
          <div>
            {downloadedMovies.length > 0 ? (
              <div style={{
                display: 'grid',
                gridTemplateColumns: 'repeat(2, 1fr)',
                gap: '16px',
                maxWidth: '800px',
                margin: '0 auto'
              }}>
                {downloadedMovies.map((movie) => (
                  <div key={movie.id} style={{
                    backgroundColor: 'white',
                    borderRadius: '12px',
                    overflow: 'hidden',
                    boxShadow: '0 2px 8px rgba(0,0,0,0.1)',
                    transition: 'all 0.3s ease',
                    cursor: 'pointer',
                    border: '1px solid #f1f5f9'
                  }}
                  onClick={() => handleMovieClick(movie.id)}
                  onMouseEnter={(e) => {
                    e.currentTarget.style.transform = 'translateY(-2px)';
                    e.currentTarget.style.boxShadow = '0 8px 25px rgba(0,0,0,0.15)';
                  }}
                  onMouseLeave={(e) => {
                    e.currentTarget.style.transform = 'translateY(0)';
                    e.currentTarget.style.boxShadow = '0 2px 8px rgba(0,0,0,0.1)';
                  }}
                  >
                    {/* Poster */}
                    <div style={{ position: 'relative' }}>
                      <img
                        src={movie.poster}
                        alt={movie.title}
                        style={{
                          width: '100%',
                          height: '280px',
                          objectFit: 'cover'
                        }}
                      />
                      {/* Overlay with play button */}
                      <div style={{
                        position: 'absolute',
                        top: 0,
                        left: 0,
                        right: 0,
                        bottom: 0,
                        background: 'linear-gradient(to bottom, rgba(0,0,0,0.1), rgba(0,0,0,0.6))',
                        display: 'flex',
                        alignItems: 'center',
                        justifyContent: 'center',
                        opacity: 0,
                        transition: 'opacity 0.3s ease'
                      }}
                      className="hover:opacity-100"
                      >
                        <button
                          onClick={(e) => {
                            e.stopPropagation();
                            handlePlay(movie.id);
                          }}
                          style={{
                            background: 'rgba(59, 130, 246, 0.9)',
                            color: 'white',
                            border: 'none',
                            borderRadius: '50%',
                            width: '56px',
                            height: '56px',
                            display: 'flex',
                            alignItems: 'center',
                            justifyContent: 'center',
                            cursor: 'pointer',
                            transition: 'all 0.2s ease',
                            backdropFilter: 'blur(10px)'
                          }}
                        >
                          <IoPlay size={24} />
                        </button>
                      </div>
                      
                      {/* Download Badge */}
                      <div style={{
                        position: 'absolute',
                        top: '12px',
                        left: '12px',
                        background: '#10b981',
                        color: 'white',
                        padding: '4px 8px',
                        borderRadius: '6px',
                        fontSize: '10px',
                        fontWeight: '600',
                        textTransform: 'uppercase',
                        display: 'flex',
                        alignItems: 'center',
                        gap: '4px'
                      }}>
                        <IoDownload size={12} />
                        Downloaded
                      </div>

                      {/* Rating */}
                      <div style={{
                        position: 'absolute',
                        bottom: '12px',
                        right: '12px',
                        background: 'rgba(0,0,0,0.8)',
                        color: 'white',
                        padding: '4px 8px',
                        borderRadius: '6px',
                        fontSize: '12px',
                        fontWeight: '600',
                        display: 'flex',
                        alignItems: 'center',
                        gap: '4px'
                      }}>
                        <FaStar size={12} color="#fbbf24" />
                        {movie.rating}
                      </div>
                    </div>

                    {/* Content Info */}
                    <div style={{ padding: '16px' }}>
                      {/* Title and Year */}
                      <div style={{ marginBottom: '8px' }}>
                        <h3 style={{
                          fontSize: '16px',
                          fontWeight: '700',
                          color: '#1a1a1a',
                          margin: 0,
                          marginBottom: '4px',
                          lineHeight: '1.2'
                        }}>
                          {movie.title}
                        </h3>
                        <div style={{
                          display: 'flex',
                          alignItems: 'center',
                          gap: '8px',
                          fontSize: '13px',
                          color: '#6b7280'
                        }}>
                          <span>{movie.year}</span>
                          <span>•</span>
                          <span>{movie.duration}</span>
                          <span>•</span>
                          <span style={{
                            backgroundColor: '#f3f4f6',
                            color: '#374151',
                            padding: '2px 6px',
                            borderRadius: '4px',
                            fontSize: '11px',
                            fontWeight: '500'
                          }}>
                            {movie.genre}
                          </span>
                        </div>
                      </div>

                      {/* Description */}
                      <p style={{
                        fontSize: '13px',
                        color: '#6b7280',
                        lineHeight: '1.4',
                        marginBottom: '12px',
                        display: '-webkit-box',
                        WebkitLineClamp: 2,
                        WebkitBoxOrient: 'vertical',
                        overflow: 'hidden',
                        height: '36px'
                      }}>
                        {movie.description}
                      </p>

                      {/* Cast */}
                      <div style={{
                        fontSize: '12px',
                        color: '#9ca3af',
                        marginBottom: '12px',
                        display: '-webkit-box',
                        WebkitLineClamp: 1,
                        WebkitBoxOrient: 'vertical',
                        overflow: 'hidden'
                      }}>
                        <span style={{ fontWeight: '500', color: '#6b7280' }}>Cast: </span>
                        {movie.cast.slice(0, 3).join(', ')}
                        {movie.cast.length > 3 && '...'}
                      </div>

                      {/* Download Date */}
                      <div style={{
                        fontSize: '12px',
                        color: '#9ca3af',
                        marginBottom: '12px'
                      }}>
                        Downloaded: {movie.downloadDate}
                      </div>

                      {/* Action Buttons */}
                      <div style={{ display: 'flex', alignItems: 'center', gap: '8px' }}>
                        <button
                          onClick={(e) => {
                            e.stopPropagation();
                            handlePlay(movie.id);
                          }}
                          style={{
                            flex: 1,
                            background: 'linear-gradient(135deg, #3b82f6, #1d4ed8)',
                            color: 'white',
                            border: 'none',
                            borderRadius: '8px',
                            padding: '10px 16px',
                            fontSize: '14px',
                            fontWeight: '600',
                            cursor: 'pointer',
                            display: 'flex',
                            alignItems: 'center',
                            justifyContent: 'center',
                            gap: '6px',
                            transition: 'all 0.2s ease'
                          }}
                          onMouseEnter={(e) => e.currentTarget.style.transform = 'scale(1.02)'}
                          onMouseLeave={(e) => e.currentTarget.style.transform = 'scale(1)'}
                        >
                          <IoPlay size={16} />
                          Watch Now
                        </button>
                        <button
                          onClick={(e) => {
                            e.stopPropagation();
                            toggleSave(movie.id);
                          }}
                          style={{
                            background: 'none',
                            border: '1px solid #e5e7eb',
                            borderRadius: '8px',
                            padding: '10px',
                            cursor: 'pointer',
                            color: '#10b981',
                            transition: 'all 0.2s ease'
                          }}
                          onMouseEnter={(e) => e.currentTarget.style.borderColor = '#10b981'}
                          onMouseLeave={(e) => e.currentTarget.style.borderColor = '#e5e7eb'}
                        >
                          <IoDownload size={16} />
                        </button>
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
                <IoDownloadOutline size={48} color="#9ca3af" style={{ marginBottom: '16px' }} />
                <h3 style={{
                  fontSize: '18px',
                  color: '#6b7280',
                  marginBottom: '8px'
                }}>
                  No downloaded movies yet
                </h3>
                <p style={{
                  fontSize: '14px',
                  color: '#9ca3af'
                }}>
                  Movies you download will appear here
                </p>
              </div>
            )}
          </div>
        )}
      </div>
    </div>
  );
};

export default Movies; 