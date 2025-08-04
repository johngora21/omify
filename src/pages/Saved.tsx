import { useState, useEffect } from 'react';
import { useNavigate } from 'react-router-dom';
import { IoPlay, IoSearchOutline } from 'react-icons/io5';
import { FaBookmark, FaRegBookmark, FaStar } from 'react-icons/fa';

interface Movie {
  id: string;
  title: string;
  genre: string;
  rating: number;
  year: number;
  duration: string;
  poster: string;
  description: string;
  director: string;
  cast: string[];
  isNew: boolean;
  isTrending: boolean;
}

const Saved = ({ onMenuClick }: { onMenuClick?: () => void }) => {
  const navigate = useNavigate();
  const [savedContent, setSavedContent] = useState<Set<string>>(new Set());
  const [savedMovies, setSavedMovies] = useState<Movie[]>([]);
  const [downloadedMovies, setDownloadedMovies] = useState<Movie[]>([]);
  const [loading, setLoading] = useState(true);
  const [activeTab, setActiveTab] = useState('saved');

  // Mock saved movies data (in real app, this would come from localStorage or API)
  const mockSavedMovies: Movie[] = [
    {
      id: '1',
      title: 'The Dark Knight',
      genre: 'Action',
      rating: 4.9,
      year: 2008,
      duration: '2h 32m',
      poster: 'https://images.unsplash.com/photo-1531259683007-016a7b628fc3?w=300&h=450&fit=crop',
      description: 'When the menace known as the Joker wreaks havoc and chaos on the people of Gotham, Batman must accept one of the greatest psychological and physical tests of his ability to fight injustice.',
      director: 'Christopher Nolan',
      cast: ['Christian Bale', 'Heath Ledger', 'Aaron Eckhart'],
      isNew: false,
      isTrending: true
    },
    {
      id: '2',
      title: 'Inception',
      genre: 'Sci-Fi',
      rating: 4.8,
      year: 2010,
      duration: '2h 28m',
      poster: 'https://images.unsplash.com/photo-1440404653325-ab127d49abc1?w=300&h=450&fit=crop',
      description: 'A thief who steals corporate secrets through the use of dream-sharing technology is given the inverse task of planting an idea into the mind of a C.E.O.',
      director: 'Christopher Nolan',
      cast: ['Leonardo DiCaprio', 'Joseph Gordon-Levitt', 'Ellen Page'],
      isNew: false,
      isTrending: true
    },
    {
      id: '3',
      title: 'The Matrix',
      genre: 'Sci-Fi',
      rating: 4.7,
      year: 1999,
      duration: '2h 16m',
      poster: 'https://images.unsplash.com/photo-1518709268805-4e9042af2176?w=300&h=450&fit=crop',
      description: 'A computer programmer discovers that reality as he knows it is a simulation created by machines, and joins a rebellion to break free.',
      director: 'Lana Wachowski',
      cast: ['Keanu Reeves', 'Laurence Fishburne', 'Carrie-Anne Moss'],
      isNew: false,
      isTrending: false
    }
  ];

  // Mock downloaded movies data
  const mockDownloadedMovies: Movie[] = [
    {
      id: '4',
      title: 'Interstellar',
      genre: 'Sci-Fi',
      rating: 4.8,
      year: 2014,
      duration: '2h 49m',
      poster: 'https://images.unsplash.com/photo-1440404653325-ab127d49abc1?w=300&h=450&fit=crop',
      description: 'A team of explorers travel through a wormhole in space in an attempt to ensure humanity\'s survival.',
      director: 'Christopher Nolan',
      cast: ['Matthew McConaughey', 'Anne Hathaway', 'Jessica Chastain'],
      isNew: false,
      isTrending: false
    },
    {
      id: '5',
      title: 'The Shawshank Redemption',
      genre: 'Drama',
      rating: 4.9,
      year: 1994,
      duration: '2h 22m',
      poster: 'https://images.unsplash.com/photo-1518709268805-4e9042af2176?w=300&h=450&fit=crop',
      description: 'Two imprisoned men bond over a number of years, finding solace and eventual redemption through acts of common decency.',
      director: 'Frank Darabont',
      cast: ['Tim Robbins', 'Morgan Freeman', 'Bob Gunton'],
      isNew: false,
      isTrending: false
    }
  ];

  useEffect(() => {
    // Simulate loading saved and downloaded movies
    setTimeout(() => {
      setSavedMovies(mockSavedMovies);
      setDownloadedMovies(mockDownloadedMovies);
      setLoading(false);
    }, 1000);
  }, []);

  const toggleSave = (contentId: string) => {
    const newSavedContent = new Set(savedContent);
    if (newSavedContent.has(contentId)) {
      newSavedContent.delete(contentId);
      setSavedMovies(prev => prev.filter(movie => movie.id !== contentId));
    } else {
      newSavedContent.add(contentId);
    }
    setSavedContent(newSavedContent);
  };

  const handlePlay = (contentId: string) => {
    console.log('Play content:', contentId);
    navigate(`/movie/${contentId}`);
  };

  const getCurrentMovies = () => {
    switch (activeTab) {
      case 'saved':
        return savedMovies;
      case 'downloaded':
        return downloadedMovies;
      default:
        return savedMovies;
    }
  };

  const filteredMovies = getCurrentMovies();

  return (
    <div style={{
      backgroundColor: '#f8f9fa',
      minHeight: '100vh',
      paddingBottom: '80px'
    }}>
      {/* Header */}
      <div style={{
        backgroundColor: 'white',
        padding: '16px',
        display: 'flex',
        alignItems: 'center',
        position: 'relative'
      }}>
        <button
          onClick={() => onMenuClick ? onMenuClick() : navigate(-1)}
          style={{
            background: 'none',
            border: 'none',
            fontSize: '24px',
            cursor: 'pointer',
            color: '#6b7280',
            position: 'absolute',
            left: '16px',
            zIndex: 1
          }}
        >
          ←
        </button>
        <h1 style={{
          fontSize: '24px',
          fontWeight: '700',
          color: '#1a1a1a',
          margin: 0,
          flex: 1,
          textAlign: 'center'
        }}>
          My Library
        </h1>
      </div>

      {/* Tab Navigation */}
      <div style={{
        backgroundColor: 'white',
        padding: '0 16px'
      }}>
        <div style={{
          display: 'flex',
          gap: '4px',
          overflowX: 'auto',
          padding: '16px 0'
        }}>
          {[
            { id: 'saved', label: 'Saved', count: savedMovies.length },
            { id: 'downloaded', label: 'Downloaded', count: downloadedMovies.length }
          ].map((tab) => (
            <button
              key={tab.id}
              onClick={() => setActiveTab(tab.id)}
              style={{
                background: activeTab === tab.id ? '#3b82f6' : 'transparent',
                color: activeTab === tab.id ? 'white' : '#6b7280',
                border: 'none',
                borderRadius: '20px',
                padding: '8px 16px',
                fontSize: '14px',
                fontWeight: '500',
                cursor: 'pointer',
                transition: 'all 0.2s ease',
                whiteSpace: 'nowrap',
                display: 'flex',
                alignItems: 'center',
                gap: '6px'
              }}
            >
              {tab.label}
              <span style={{
                background: activeTab === tab.id ? 'rgba(255,255,255,0.2)' : '#e5e7eb',
                color: activeTab === tab.id ? 'white' : '#6b7280',
                padding: '2px 6px',
                borderRadius: '10px',
                fontSize: '12px',
                fontWeight: '600'
              }}>
                {tab.count}
              </span>
            </button>
          ))}
        </div>
      </div>



      {/* Content */}
      <div style={{ padding: '16px' }}>
        {/* Loading State */}
        {loading && (
          <div style={{
            display: 'flex',
            justifyContent: 'center',
            alignItems: 'center',
            padding: '40px',
            color: '#6b7280'
          }}>
            <div style={{
              display: 'flex',
              flexDirection: 'column',
              alignItems: 'center',
              gap: '16px'
            }}>
              <div style={{
                width: '40px',
                height: '40px',
                border: '4px solid #e5e7eb',
                borderTop: '4px solid #3b82f6',
                borderRadius: '50%',
                animation: 'spin 1s linear infinite'
              }}></div>
              <span>Loading saved movies...</span>
            </div>
          </div>
        )}

        {/* Empty State */}
        {!loading && filteredMovies.length === 0 && (
          <div style={{
            display: 'flex',
            justifyContent: 'center',
            alignItems: 'center',
            padding: '40px',
            color: '#6b7280',
            textAlign: 'center'
          }}>
            <div style={{
              display: 'flex',
              flexDirection: 'column',
              alignItems: 'center',
              gap: '16px'
            }}>
              <FaBookmark size={48} color="#d1d5db" />
              <div>
                <h3 style={{
                  fontSize: '18px',
                  fontWeight: '600',
                  color: '#374151',
                  margin: '0 0 8px 0'
                }}>
                  No {activeTab === 'saved' ? 'saved' : 'downloaded'} movies yet
                </h3>
                <p style={{
                  fontSize: '14px',
                  color: '#6b7280',
                  margin: 0
                }}>
                  {activeTab === 'saved' ? 'Save movies to watch them later' : 'Download movies to watch offline'}
                </p>
              </div>
            </div>
          </div>
        )}

        {/* Movies Grid */}
        {!loading && filteredMovies.length > 0 && (
          <div style={{
            display: 'grid',
            gridTemplateColumns: 'repeat(2, 1fr)',
            gap: '16px',
            maxWidth: '800px',
            margin: '0 auto'
          }}>
            {filteredMovies.map((content) => (
              <div key={content.id} style={{
                backgroundColor: 'white',
                borderRadius: '12px',
                overflow: 'hidden',
                boxShadow: '0 2px 8px rgba(0,0,0,0.1)',
                transition: 'all 0.3s ease',
                cursor: 'pointer',
                border: '1px solid #f1f5f9'
              }}
              onClick={() => handlePlay(content.id)}
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
                    src={content.poster}
                    alt={content.title}
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
                        handlePlay(content.id);
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
                    {content.isTrending && (
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
                    {content.rating}
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
                      {content.title}
                    </h3>
                    <div style={{
                      display: 'flex',
                      alignItems: 'center',
                      gap: '8px',
                      fontSize: '13px',
                      color: '#6b7280'
                    }}>
                      <span>{content.year}</span>
                      <span>•</span>
                      <span>{content.duration}</span>
                      <span>•</span>
                      <span style={{
                        backgroundColor: '#f3f4f6',
                        color: '#374151',
                        padding: '2px 6px',
                        borderRadius: '4px',
                        fontSize: '11px',
                        fontWeight: '500'
                      }}>
                        {content.genre}
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
                    {content.description}
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
                    {content.cast.slice(0, 3).join(', ')}
                    {content.cast.length > 3 && '...'}
                  </div>

                  {/* Action Buttons */}
                  <div style={{ display: 'flex', alignItems: 'center', gap: '8px' }}>
                    <button
                      onClick={(e) => {
                        e.stopPropagation();
                        handlePlay(content.id);
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
                        toggleSave(content.id);
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
        )}
      </div>
    </div>
  );
};

export default Saved; 