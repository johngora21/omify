import { useState } from 'react';
import { IoHeart, IoHeartOutline, IoPlay, IoSearchOutline } from 'react-icons/io5';
import { FaBookmark, FaRegBookmark, FaStar } from 'react-icons/fa';

const Movies = () => {
  const [likedContent, setLikedContent] = useState<Set<string>>(new Set());
  const [savedContent, setSavedContent] = useState<Set<string>>(new Set());
  const [searchQuery, setSearchQuery] = useState('');
  const [activeTab, setActiveTab] = useState('movies');
  const [showFilterModal, setShowFilterModal] = useState(false);
  const [filters, setFilters] = useState({
    genres: [] as string[],
    yearRange: { min: 1990, max: 2024 },
    rating: 0,
    duration: 'all' as 'all' | 'short' | 'medium' | 'long'
  });

  const movies = [
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
    },
    {
      id: '4',
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
    },
    {
      id: '5',
      title: 'The Hangover',
      genre: 'Comedy',
      rating: 4.5,
      year: 2009,
      duration: '1h 40m',
      poster: 'https://images.unsplash.com/photo-1531259683007-016a7b628fc3?w=300&h=450&fit=crop',
      description: 'Three friends wake up from a bachelor party in Las Vegas, with no memory of the previous night and the bachelor missing.',
      director: 'Todd Phillips',
      cast: ['Bradley Cooper', 'Ed Helms', 'Zach Galifianakis'],
      isNew: false,
      isTrending: false
    },
    {
      id: '6',
      title: 'The Conjuring',
      genre: 'Horror',
      rating: 4.6,
      year: 2013,
      duration: '1h 52m',
      poster: 'https://images.unsplash.com/photo-1440404653325-ab127d49abc1?w=300&h=450&fit=crop',
      description: 'Paranormal investigators Ed and Lorraine Warren work to help a family terrorized by a dark presence in their farmhouse.',
      director: 'James Wan',
      cast: ['Patrick Wilson', 'Vera Farmiga', 'Ron Livingston'],
      isNew: false,
      isTrending: false
    }
  ];

  const tvShows = [
    {
      id: '1',
      title: 'Breaking Bad',
      genre: 'Drama',
      rating: 4.9,
      year: 2008,
      seasons: 5,
      episodes: 62,
      poster: 'https://images.unsplash.com/photo-1536440136628-849c177e76a1?w=300&h=450&fit=crop',
      description: 'A high school chemistry teacher turned methamphetamine manufacturer partners with a former student to secure his family\'s financial future as a terminal lung cancer diagnosis.',
      creator: 'Vince Gilligan',
      cast: ['Bryan Cranston', 'Aaron Paul', 'Anna Gunn'],
      isNew: false,
      isTrending: true
    },
    {
      id: '2',
      title: 'Game of Thrones',
      genre: 'Fantasy',
      rating: 4.8,
      year: 2011,
      seasons: 8,
      episodes: 73,
      poster: 'https://images.unsplash.com/photo-1518709268805-4e9042af2176?w=300&h=450&fit=crop',
      description: 'Nine noble families fight for control over the lands of Westeros, while an ancient enemy returns after being dormant for millennia.',
      creator: 'David Benioff',
      cast: ['Emilia Clarke', 'Kit Harington', 'Peter Dinklage'],
      isNew: false,
      isTrending: true
    },
    {
      id: '3',
      title: 'Stranger Things',
      genre: 'Sci-Fi',
      rating: 4.7,
      year: 2016,
      seasons: 4,
      episodes: 34,
      poster: 'https://images.unsplash.com/photo-1531259683007-016a7b628fc3?w=300&h=450&fit=crop',
      description: 'When a young boy disappears, his mother, a police chief and his friends must confront terrifying supernatural forces in order to get him back.',
      creator: 'The Duffer Brothers',
      cast: ['Millie Bobby Brown', 'Finn Wolfhard', 'Winona Ryder'],
      isNew: true,
      isTrending: true
    },
    {
      id: '4',
      title: 'The Office',
      genre: 'Comedy',
      rating: 4.8,
      year: 2005,
      seasons: 9,
      episodes: 201,
      poster: 'https://images.unsplash.com/photo-1440404653325-ab127d49abc1?w=300&h=450&fit=crop',
      description: 'A mockumentary on a group of typical office workers, where the workday consists of ego clashes, inappropriate behavior, and tedium.',
      creator: 'Greg Daniels',
      cast: ['Steve Carell', 'Rainn Wilson', 'John Krasinski'],
      isNew: false,
      isTrending: false
    },
    {
      id: '5',
      title: 'True Detective',
      genre: 'Crime',
      rating: 4.7,
      year: 2014,
      seasons: 4,
      episodes: 24,
      poster: 'https://images.unsplash.com/photo-1531259683007-016a7b628fc3?w=300&h=450&fit=crop',
      description: 'Anthology series in which police investigations unearth the personal and professional secrets of those involved.',
      creator: 'Nic Pizzolatto',
      cast: ['Matthew McConaughey', 'Woody Harrelson', 'Mahershala Ali'],
      isNew: false,
      isTrending: false
    },
    {
      id: '6',
      title: 'The Crown',
      genre: 'Drama',
      rating: 4.6,
      year: 2016,
      seasons: 6,
      episodes: 60,
      poster: 'https://images.unsplash.com/photo-1518709268805-4e9042af2176?w=300&h=450&fit=crop',
      description: 'Follows the political rivalries and romance of Queen Elizabeth II\'s reign and the events that shaped the second half of the twentieth century.',
      creator: 'Peter Morgan',
      cast: ['Olivia Colman', 'Emma Corrin', 'Josh O\'Connor'],
      isNew: false,
      isTrending: false
    }
  ];

  const toggleLike = (contentId: string) => {
    const newLikedContent = new Set(likedContent);
    if (newLikedContent.has(contentId)) {
      newLikedContent.delete(contentId);
    } else {
      newLikedContent.add(contentId);
    }
    setLikedContent(newLikedContent);
  };

  const toggleSave = (contentId: string) => {
    const newSavedContent = new Set(savedContent);
    if (newSavedContent.has(contentId)) {
      newSavedContent.delete(contentId);
    } else {
      newSavedContent.add(contentId);
    }
    setSavedContent(newSavedContent);
  };

  const handlePlay = (contentId: string) => {
    console.log('Play content:', contentId);
  };

  const handleSearch = (e: React.FormEvent) => {
    e.preventDefault();
    console.log('Searching for:', searchQuery);
  };

  const closeFilterModal = () => {
    setShowFilterModal(false);
  };

  const applyFilters = () => {
    setShowFilterModal(false);
  };

  const resetFilters = () => {
    setFilters({
      genres: [],
      yearRange: { min: 1990, max: 2024 },
      rating: 0,
      duration: 'all'
    });
  };

  const toggleGenre = (genre: string) => {
    setFilters(prev => ({
      ...prev,
      genres: prev.genres.includes(genre) 
        ? prev.genres.filter(g => g !== genre)
        : [...prev.genres, genre]
    }));
  };

  const getCurrentContent = () => {
    switch (activeTab) {
      case 'movies':
        return movies;
      case 'tvshows':
        return tvShows;
      default:
        return movies;
    }
  };

  const getGenres = () => {
    switch (activeTab) {
      case 'movies':
        return ['all', 'Action', 'Sci-Fi', 'Drama', 'Comedy', 'Horror', 'Romance', 'Thriller'];
      case 'tvshows':
        return ['all', 'Drama', 'Fantasy', 'Sci-Fi', 'Comedy', 'Crime'];
      default:
        return ['all'];
    }
  };

  const filteredContent = getCurrentContent().filter(content => {
    const matchesSearch = content.title.toLowerCase().includes(searchQuery.toLowerCase()) ||
                         content.description.toLowerCase().includes(searchQuery.toLowerCase()) ||
                         content.genre.toLowerCase().includes(searchQuery.toLowerCase());
    
    let matchesGenre = filters.genres.length === 0 || filters.genres.includes(content.genre);
    
    return matchesSearch && matchesGenre;
  });

  return (
    <div style={{
      backgroundColor: '#f8f9fa',
      minHeight: '100vh',
      paddingBottom: '80px'
    }}>
      {/* Header */}
      <div style={{
        backgroundColor: 'white',
        padding: '20px 16px',
        borderBottom: '1px solid #e5e7eb'
      }}>
        <h1 style={{
          fontSize: '24px',
          fontWeight: '700',
          color: '#1a1a1a',
          marginBottom: '8px',
          textAlign: 'center'
        }}>
          Movies & TV Shows
        </h1>
        <p style={{
          fontSize: '14px',
          color: '#6b7280',
          textAlign: 'center',
          margin: 0
        }}>
          Discover the latest movies and TV series
        </p>
      </div>

      {/* Tab Navigation */}
      <div style={{
        backgroundColor: 'white',
        padding: '0 16px',
        borderBottom: '1px solid #e5e7eb'
      }}>
        <div style={{
          display: 'flex',
          gap: '4px',
          overflowX: 'auto',
          padding: '16px 0'
        }}>
          {[
            { id: 'movies', label: 'Movies' },
            { id: 'tvshows', label: 'TV Shows' }
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
                whiteSpace: 'nowrap'
              }}
            >
              {tab.label}
            </button>
          ))}
        </div>
      </div>

      {/* Search and Filter Bar */}
      <div style={{ padding: '16px' }}>
        <div style={{
          display: 'flex',
          gap: '12px',
          alignItems: 'center'
        }}>
          <form onSubmit={handleSearch} style={{ flex: 1 }}>
            <div style={{
              position: 'relative',
              display: 'flex',
              alignItems: 'center'
            }}>
              <IoSearchOutline 
                size={20} 
                color="#9ca3af" 
                style={{
                  position: 'absolute',
                  left: '16px',
                  zIndex: 1
                }}
              />
              <input
                type="text"
                placeholder={`Search ${activeTab}...`}
                value={searchQuery}
                onChange={(e) => setSearchQuery(e.target.value)}
                style={{
                  width: '100%',
                  padding: '16px 16px 16px 48px',
                  border: '1px solid #e5e7eb',
                  borderRadius: '12px',
                  fontSize: '16px',
                  backgroundColor: 'white',
                  outline: 'none',
                  transition: 'all 0.2s ease',
                  boxShadow: '0 2px 4px rgba(0,0,0,0.05)'
                }}
              />
            </div>
          </form>
          
          <button
            onClick={() => setShowFilterModal(true)}
            style={{
              background: '#3b82f6',
              color: 'white',
              border: 'none',
              borderRadius: '12px',
              padding: '16px',
              cursor: 'pointer',
              display: 'flex',
              alignItems: 'center',
              justifyContent: 'center',
              transition: 'all 0.2s ease'
            }}
          >
            <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2">
              <line x1="4" y1="6" x2="20" y2="6"/>
              <circle cx="12" cy="6" r="2"/>
              <line x1="4" y1="12" x2="20" y2="12"/>
              <circle cx="12" cy="12" r="2"/>
              <line x1="4" y1="18" x2="20" y2="18"/>
              <circle cx="12" cy="18" r="2"/>
            </svg>
          </button>
        </div>
      </div>

      {/* Content Grid */}
      <div style={{ padding: '16px' }}>
        <div style={{
          display: 'grid',
          gridTemplateColumns: 'repeat(auto-fill, minmax(280px, 1fr))',
          gap: '16px'
        }}>
          {filteredContent.map((content) => (
            <div key={content.id} style={{
              backgroundColor: 'white',
              borderRadius: '16px',
              overflow: 'hidden',
              boxShadow: '0 4px 12px rgba(0,0,0,0.08)',
              transition: 'transform 0.2s ease',
              cursor: 'pointer'
            }}
            onMouseEnter={(e) => e.currentTarget.style.transform = 'translateY(-4px)'}
            onMouseLeave={(e) => e.currentTarget.style.transform = 'translateY(0)'}
            >
              {/* Poster */}
              <div style={{ position: 'relative' }}>
                <img
                  src={content.poster}
                  alt={content.title}
                  style={{
                    width: '100%',
                    height: '400px',
                    objectFit: 'cover'
                  }}
                />
                {content.isNew && (
                  <div style={{
                    position: 'absolute',
                    top: '12px',
                    left: '12px',
                    background: '#10b981',
                    color: 'white',
                    padding: '4px 8px',
                    borderRadius: '12px',
                    fontSize: '12px',
                    fontWeight: '600'
                  }}>
                    NEW
                  </div>
                )}
                {content.isTrending && (
                  <div style={{
                    position: 'absolute',
                    top: '12px',
                    right: '12px',
                    background: '#f59e0b',
                    color: 'white',
                    padding: '4px 8px',
                    borderRadius: '12px',
                    fontSize: '12px',
                    fontWeight: '600'
                  }}>
                    TRENDING
                  </div>
                )}
                <button
                  onClick={() => handlePlay(content.id)}
                  style={{
                    position: 'absolute',
                    bottom: '12px',
                    right: '12px',
                    background: 'rgba(0,0,0,0.8)',
                    color: 'white',
                    border: 'none',
                    borderRadius: '50%',
                    width: '48px',
                    height: '48px',
                    display: 'flex',
                    alignItems: 'center',
                    justifyContent: 'center',
                    cursor: 'pointer',
                    transition: 'all 0.2s ease'
                  }}
                >
                  <IoPlay size={20} />
                </button>
              </div>

              {/* Content Info */}
              <div style={{ padding: '16px' }}>
                <div style={{ display: 'flex', alignItems: 'center', gap: '8px', marginBottom: '8px' }}>
                  <h3 style={{
                    fontSize: '16px',
                    fontWeight: '600',
                    color: '#1a1a1a',
                    margin: 0,
                    flex: 1
                  }}>
                    {content.title}
                  </h3>
                  <div style={{ display: 'flex', alignItems: 'center', gap: '4px' }}>
                    <FaStar size={14} color="#fbbf24" />
                    <span style={{ fontSize: '14px', color: '#6b7280' }}>
                      {content.rating}
                    </span>
                  </div>
                </div>

                <div style={{ display: 'flex', alignItems: 'center', gap: '8px', marginBottom: '8px' }}>
                  <span style={{
                    backgroundColor: '#f3f4f6',
                    color: '#6b7280',
                    padding: '2px 8px',
                    borderRadius: '12px',
                    fontSize: '12px',
                    fontWeight: '500'
                  }}>
                    {content.genre}
                  </span>
                  <span style={{ fontSize: '14px', color: '#6b7280' }}>
                    • {content.year}
                  </span>
                  <span style={{ fontSize: '14px', color: '#6b7280' }}>
                    • {content.duration}
                  </span>
                </div>

                <p style={{
                  fontSize: '14px',
                  color: '#6b7280',
                  lineHeight: '18px',
                  marginBottom: '12px',
                  display: '-webkit-box',
                  WebkitLineClamp: 2,
                  WebkitBoxOrient: 'vertical',
                  overflow: 'hidden'
                }}>
                  {content.description}
                </p>

                <div style={{ display: 'flex', alignItems: 'center', gap: '8px' }}>
                  <button
                    onClick={() => handlePlay(content.id)}
                    style={{
                      flex: 1,
                      background: '#3b82f6',
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
                      gap: '6px'
                    }}
                  >
                    <IoPlay size={16} />
                    Play
                  </button>
                  <button
                    onClick={() => toggleLike(content.id)}
                    style={{
                      background: 'none',
                      border: '1px solid #e5e7eb',
                      borderRadius: '8px',
                      padding: '10px',
                      cursor: 'pointer',
                      color: likedContent.has(content.id) ? '#ef4444' : '#6b7280'
                    }}
                  >
                    {likedContent.has(content.id) ? (
                      <IoHeart size={16} />
                    ) : (
                      <IoHeartOutline size={16} />
                    )}
                  </button>
                  <button
                    onClick={() => toggleSave(content.id)}
                    style={{
                      background: 'none',
                      border: '1px solid #e5e7eb',
                      borderRadius: '8px',
                      padding: '10px',
                      cursor: 'pointer',
                      color: savedContent.has(content.id) ? '#ffa502' : '#6b7280'
                    }}
                  >
                    {savedContent.has(content.id) ? (
                      <FaBookmark size={16} />
                    ) : (
                      <FaRegBookmark size={16} />
                    )}
                  </button>
                </div>
              </div>
            </div>
          ))}
        </div>
      </div>

      {/* Filter Modal */}
      {showFilterModal && (
        <div style={{
          position: 'fixed',
          top: 0,
          left: 0,
          right: 0,
          bottom: 0,
          backgroundColor: 'rgba(0, 0, 0, 0.5)',
          zIndex: 1000,
          display: 'flex',
          alignItems: 'center',
          justifyContent: 'center'
        }}>
          <div style={{
            backgroundColor: 'white',
            borderRadius: '16px',
            padding: '24px',
            maxWidth: '400px',
            width: '90%',
            maxHeight: '80vh',
            overflowY: 'auto'
          }}>
            <div style={{
              display: 'flex',
              justifyContent: 'space-between',
              alignItems: 'center',
              marginBottom: '24px'
            }}>
              <h3 style={{
                fontSize: '20px',
                fontWeight: '600',
                color: '#1a1a1a',
                margin: 0
              }}>
                Filters
              </h3>
              <button
                onClick={closeFilterModal}
                style={{
                  background: 'none',
                  border: 'none',
                  fontSize: '24px',
                  cursor: 'pointer',
                  color: '#6b7280'
                }}
              >
                ×
              </button>
            </div>

            {/* Genres */}
            <div style={{ marginBottom: '24px' }}>
              <h4 style={{
                fontSize: '16px',
                fontWeight: '600',
                color: '#1a1a1a',
                marginBottom: '12px'
              }}>
                Genres
              </h4>
              <div style={{
                display: 'flex',
                flexWrap: 'wrap',
                gap: '8px'
              }}>
                {getGenres().filter(genre => genre !== 'all').map((genre) => (
                  <button
                    key={genre}
                    onClick={() => toggleGenre(genre)}
                    style={{
                      padding: '8px 16px',
                      borderRadius: '20px',
                      border: '1px solid #e5e7eb',
                      background: filters.genres.includes(genre) ? '#3b82f6' : 'white',
                      color: filters.genres.includes(genre) ? 'white' : '#6b7280',
                      cursor: 'pointer',
                      fontSize: '14px',
                      fontWeight: '500',
                      transition: 'all 0.2s ease'
                    }}
                  >
                    {genre}
                  </button>
                ))}
              </div>
            </div>

            {/* Year Range */}
            <div style={{ marginBottom: '24px' }}>
              <h4 style={{
                fontSize: '16px',
                fontWeight: '600',
                color: '#1a1a1a',
                marginBottom: '12px'
              }}>
                Year Range
              </h4>
              <div style={{
                display: 'flex',
                gap: '8px',
                alignItems: 'center'
              }}>
                <input
                  type="number"
                  value={filters.yearRange.min}
                  onChange={(e) => setFilters(prev => ({
                    ...prev,
                    yearRange: { ...prev.yearRange, min: parseInt(e.target.value) || 1990 }
                  }))}
                  style={{
                    width: '80px',
                    padding: '8px 12px',
                    border: '1px solid #e5e7eb',
                    borderRadius: '8px',
                    fontSize: '14px',
                    textAlign: 'center'
                  }}
                  placeholder="1990"
                />
                <span style={{ color: '#6b7280', fontSize: '14px' }}>to</span>
                <input
                  type="number"
                  value={filters.yearRange.max}
                  onChange={(e) => setFilters(prev => ({
                    ...prev,
                    yearRange: { ...prev.yearRange, max: parseInt(e.target.value) || 2024 }
                  }))}
                  style={{
                    width: '80px',
                    padding: '8px 12px',
                    border: '1px solid #e5e7eb',
                    borderRadius: '8px',
                    fontSize: '14px',
                    textAlign: 'center'
                  }}
                  placeholder="2024"
                />
              </div>
            </div>

            {/* Rating */}
            <div style={{ marginBottom: '24px' }}>
              <h4 style={{
                fontSize: '16px',
                fontWeight: '600',
                color: '#1a1a1a',
                marginBottom: '12px'
              }}>
                Minimum Rating
              </h4>
              <div style={{
                display: 'flex',
                gap: '8px'
              }}>
                {[1, 2, 3, 4, 5].map((star) => (
                  <button
                    key={star}
                    onClick={() => setFilters(prev => ({ ...prev, rating: star }))}
                    style={{
                      background: 'none',
                      border: 'none',
                      cursor: 'pointer',
                      color: filters.rating >= star ? '#ffa502' : '#e5e7eb',
                      fontSize: '20px'
                    }}
                  >
                    <FaStar />
                  </button>
                ))}
              </div>
            </div>

            {/* Duration */}
            <div style={{ marginBottom: '24px' }}>
              <h4 style={{
                fontSize: '16px',
                fontWeight: '600',
                color: '#1a1a1a',
                marginBottom: '12px'
              }}>
                Duration
              </h4>
              <div style={{
                display: 'flex',
                flexWrap: 'wrap',
                gap: '6px'
              }}>
                {[
                  { value: 'all', label: 'All' },
                  { value: 'short', label: 'Short' },
                  { value: 'medium', label: 'Medium' },
                  { value: 'long', label: 'Long' }
                ].map((option) => (
                  <button
                    key={option.value}
                    onClick={() => setFilters(prev => ({ ...prev, duration: option.value as any }))}
                    style={{
                      padding: '6px 12px',
                      borderRadius: '16px',
                      border: '1px solid #e5e7eb',
                      background: filters.duration === option.value ? '#3b82f6' : 'white',
                      color: filters.duration === option.value ? 'white' : '#6b7280',
                      cursor: 'pointer',
                      fontSize: '13px',
                      fontWeight: '500',
                      transition: 'all 0.2s ease',
                      whiteSpace: 'nowrap'
                    }}
                  >
                    {option.label}
                  </button>
                ))}
              </div>
            </div>

            {/* Action Buttons */}
            <div style={{
              display: 'flex',
              gap: '12px',
              marginTop: '24px'
            }}>
              <button
                onClick={resetFilters}
                style={{
                  flex: 1,
                  padding: '12px 16px',
                  border: '1px solid #e5e7eb',
                  borderRadius: '8px',
                  background: 'white',
                  color: '#6b7280',
                  cursor: 'pointer',
                  fontSize: '14px',
                  fontWeight: '500'
                }}
              >
                Reset
              </button>
              <button
                onClick={applyFilters}
                style={{
                  flex: 1,
                  padding: '12px 16px',
                  border: 'none',
                  borderRadius: '8px',
                  background: '#3b82f6',
                  color: 'white',
                  cursor: 'pointer',
                  fontSize: '14px',
                  fontWeight: '500'
                }}
              >
                Apply Filters
              </button>
            </div>
          </div>
        </div>
      )}
    </div>
  );
};

export default Movies; 