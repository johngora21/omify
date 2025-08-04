import { useState, useEffect } from 'react';
import { useNavigate } from 'react-router-dom';
import { IoHeart, IoHeartOutline, IoPlay, IoSearchOutline, IoRadio } from 'react-icons/io5';
import { FaBookmark, FaRegBookmark, FaStar } from 'react-icons/fa';

const Entertainment = () => {
  const navigate = useNavigate();
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
    },
    {
      id: '7',
      title: 'Breaking Bad',
      genre: 'Series',
      rating: 4.9,
      year: 2008,
      duration: '5 Seasons',
      poster: 'https://images.unsplash.com/photo-1536440136628-849c177e76a1?w=300&h=450&fit=crop',
      description: 'A high school chemistry teacher turned methamphetamine manufacturer partners with a former student to secure his family\'s financial future.',
      director: 'Vince Gilligan',
      cast: ['Bryan Cranston', 'Aaron Paul', 'Anna Gunn'],
      isNew: false,
      isTrending: true
    },
    {
      id: '8',
      title: 'Game of Thrones',
      genre: 'Series',
      rating: 4.8,
      year: 2011,
      duration: '8 Seasons',
      poster: 'https://images.unsplash.com/photo-1518709268805-4e9042af2176?w=300&h=450&fit=crop',
      description: 'Nine noble families fight for control over the lands of Westeros, while an ancient enemy returns after being dormant for millennia.',
      director: 'David Benioff',
      cast: ['Emilia Clarke', 'Kit Harington', 'Peter Dinklage'],
      isNew: false,
      isTrending: true
    },
    {
      id: '9',
      title: 'Attack on Titan',
      genre: 'Anime',
      rating: 4.9,
      year: 2013,
      duration: '4 Seasons',
      poster: 'https://images.unsplash.com/photo-1531259683007-016a7b628fc3?w=300&h=450&fit=crop',
      description: 'Humanity\'s last stand against giant humanoid creatures known as Titans in a world where the remnants of humanity live behind massive walls.',
      director: 'Tetsurō Araki',
      cast: ['Yuki Kaji', 'Yui Ishikawa', 'Marina Inoue'],
      isNew: false,
      isTrending: true
    },
    {
      id: '10',
      title: 'Demon Slayer',
      genre: 'Anime',
      rating: 4.8,
      year: 2019,
      duration: '3 Seasons',
      poster: 'https://images.unsplash.com/photo-1440404653325-ab127d49abc1?w=300&h=450&fit=crop',
      description: 'A young boy becomes a demon slayer after his family is attacked and his sister is turned into a demon.',
      director: 'Haruo Sotozaki',
      cast: ['Natsuki Hanae', 'Akari Kitō', 'Hiro Shimono'],
      isNew: true,
      isTrending: true
    },
    {
      id: '11',
      title: 'Spider-Man: Into the Spider-Verse',
      genre: 'Animation',
      rating: 4.9,
      year: 2018,
      duration: '1h 57m',
      poster: 'https://images.unsplash.com/photo-1518709268805-4e9042af2176?w=300&h=450&fit=crop',
      description: 'Teen Miles Morales becomes the Spider-Man of his universe and must join with five spider-powered individuals from other dimensions.',
      director: 'Bob Persichetti',
      cast: ['Shameik Moore', 'Jake Johnson', 'Hailee Steinfeld'],
      isNew: false,
      isTrending: true
    },
    {
      id: '12',
      title: 'Toy Story 4',
      genre: 'Animation',
      rating: 4.7,
      year: 2019,
      duration: '1h 40m',
      poster: 'https://images.unsplash.com/photo-1531259683007-016a7b628fc3?w=300&h=450&fit=crop',
      description: 'When a new toy called Forky joins Woody and the gang, a road trip alongside old and new friends reveals how big the world can be.',
      director: 'Josh Cooley',
      cast: ['Tom Hanks', 'Tim Allen', 'Annie Potts'],
      isNew: false,
      isTrending: false
    }
  ];



  const matches = [
    {
      id: '1',
      teamA: 'Manchester City',
      teamB: 'Arsenal',
      league: 'Premier League',
      genre: 'Football',
      status: 'live',
      time: 'LIVE',
      score: '2-1',
      poster: 'https://images.unsplash.com/photo-1571019613454-1cb2f99b2d8b?w=300&h=200&fit=crop',
      description: 'Premier League clash between title contenders',
      isLive: true,
      quality: ['HD', '4K', '1080p']
    },
    {
      id: '2',
      teamA: 'Lakers',
      teamB: 'Celtics',
      league: 'NBA',
      genre: 'Basketball',
      status: 'live',
      time: 'LIVE',
      score: '98-95',
      poster: 'https://images.unsplash.com/photo-1546519638-68e109498ffc?w=300&h=200&fit=crop',
      description: 'NBA Finals Game 7 - Championship decider',
      isLive: true,
      quality: ['HD', '4K', '1080p']
    },
    {
      id: '3',
      teamA: 'Jon Jones',
      teamB: 'Israel Adesanya',
      league: 'UFC',
      genre: 'UFC',
      status: 'live',
      time: 'LIVE',
      score: 'Round 3',
      poster: 'https://images.unsplash.com/photo-1544367567-0f2fcb009e0b?w=300&h=200&fit=crop',
      description: 'UFC 300 Main Event - Light Heavyweight Championship',
      isLive: true,
      quality: ['HD', '4K', '1080p']
    },
    {
      id: '4',
      teamA: 'Novak Djokovic',
      teamB: 'Carlos Alcaraz',
      league: 'Wimbledon',
      genre: 'Tennis',
      status: 'live',
      time: 'LIVE',
      score: '6-4, 3-6, 7-5',
      poster: 'https://images.unsplash.com/photo-1531259683007-016a7b628fc3?w=300&h=200&fit=crop',
      description: 'Wimbledon Final - Men\'s Singles Championship',
      isLive: true,
      quality: ['HD', '4K', '1080p']
    },
    {
      id: '5',
      teamA: 'Yankees',
      teamB: 'Dodgers',
      league: 'MLB',
      genre: 'Baseball',
      status: 'live',
      time: 'LIVE',
      score: '3-2',
      poster: 'https://images.unsplash.com/photo-1440404653325-ab127d49abc1?w=300&h=200&fit=crop',
      description: 'World Series Game 5 - Championship on the line',
      isLive: true,
      quality: ['HD', '4K', '1080p']
    },
    {
      id: '6',
      teamA: 'Real Madrid',
      teamB: 'Barcelona',
      league: 'La Liga',
      genre: 'Football',
      status: 'upcoming',
      time: '20:00',
      score: 'vs',
      poster: 'https://images.unsplash.com/photo-1518709268805-4e9042af2176?w=300&h=200&fit=crop',
      description: 'El Clásico - The biggest rivalry in football',
      isLive: false,
      quality: ['HD', '4K', '1080p']
    },
    {
      id: '8',
      teamA: 'Max Verstappen',
      teamB: 'Lewis Hamilton',
      league: 'Formula 1',
      genre: 'Formula 1',
      status: 'live',
      time: 'LIVE',
      score: 'Lap 45/58',
      poster: 'https://images.unsplash.com/photo-1544367567-0f2fcb009e0b?w=300&h=200&fit=crop',
      description: 'Monaco Grand Prix - The crown jewel of F1',
      isLive: true,
      quality: ['HD', '4K', '1080p']
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
    navigate(`/movie/${contentId}`);
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
      case 'sports':
        return matches;
      default:
        return movies;
    }
  };

  const getGenres = () => {
    switch (activeTab) {
      case 'movies':
        return ['all', 'Action', 'Sci-Fi', 'Drama', 'Comedy', 'Horror', 'Romance', 'Thriller', 'Anime', 'Animation', 'Series', 'TV Shows'];
      case 'tvshows':
        return ['all', 'Drama', 'Fantasy', 'Sci-Fi', 'Comedy', 'Crime', 'Anime', 'Animation', 'Series', 'TV Shows'];
      case 'sports':
        return ['all', 'Football', 'Basketball', 'Tennis', 'UFC', 'Baseball', 'Formula 1', 'Soccer', 'Boxing', 'Golf', 'Hockey', 'Cricket'];
      default:
        return ['all', 'Anime', 'Animation', 'Series', 'TV Shows'];
    }
  };

  const filteredContent = getCurrentContent().filter(content => {
    if (activeTab === 'sports') {
      const match = content as any;
      const matchesSearch = match.teamA.toLowerCase().includes(searchQuery.toLowerCase()) ||
                           match.teamB.toLowerCase().includes(searchQuery.toLowerCase()) ||
                           match.league.toLowerCase().includes(searchQuery.toLowerCase()) ||
                           match.genre.toLowerCase().includes(searchQuery.toLowerCase());
      
      let matchesGenre = filters.genres.length === 0 || filters.genres.includes(match.genre);
      
      return matchesSearch && matchesGenre;
    } else {
      const matchesSearch = content.title.toLowerCase().includes(searchQuery.toLowerCase()) ||
                           content.description.toLowerCase().includes(searchQuery.toLowerCase()) ||
                           content.genre.toLowerCase().includes(searchQuery.toLowerCase());
      
      let matchesGenre = filters.genres.length === 0 || filters.genres.includes(content.genre);
      
      return matchesSearch && matchesGenre;
    }
  });

  return (
    <div style={{
      backgroundColor: '#f8f9fa',
      minHeight: '100vh',
      paddingBottom: '80px'
    }}>


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
            { id: 'sports', label: 'Sports' }
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
          alignItems: 'center',
          flexWrap: 'wrap'
        }}>
          <form onSubmit={handleSearch} style={{ flex: '1 1 300px', minWidth: '250px' }}>
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
              transition: 'all 0.2s ease',
              flexShrink: 0
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
          gridTemplateColumns: 'repeat(2, 1fr)',
          gap: '16px',
          maxWidth: '800px',
          margin: '0 auto'
        }}>
          {activeTab === 'sports' ? (
            // Sports content rendering
            filteredContent.map((content) => {
              const match = content as any;
              return (
              <div key={match.id} style={{
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
                {/* Match Image */}
                <div style={{ position: 'relative' }}>
                  <img
                    src={match.poster}
                    alt={`${match.teamA} vs ${match.teamB}`}
                    style={{
                      width: '100%',
                      height: '200px',
                      objectFit: 'cover'
                    }}
                    onClick={() => handlePlay(match.id)}
                  />
                  {match.isLive && (
                    <div style={{
                      position: 'absolute',
                      top: '12px',
                      left: '12px',
                      background: '#ef4444',
                      color: 'white',
                      padding: '4px 8px',
                      borderRadius: '12px',
                      fontSize: '12px',
                      fontWeight: '600',
                      display: 'flex',
                      alignItems: 'center',
                      gap: '4px'
                    }}>
                      <IoRadio size={12} />
                      LIVE
                    </div>
                  )}
                  
                  {/* Quality Options Inside Image */}
                  <div style={{
                    position: 'absolute',
                    bottom: '12px',
                    left: '12px',
                    display: 'flex',
                    gap: '6px'
                  }}>
                    {match.quality.map((quality) => (
                      <button
                        key={quality}
                        onClick={(e) => {
                          e.stopPropagation();
                          handlePlay(match.id);
                        }}
                        style={{
                          background: 'rgba(0,0,0,0.8)',
                          color: 'white',
                          border: 'none',
                          borderRadius: '6px',
                          padding: '4px 8px',
                          fontSize: '10px',
                          fontWeight: '500',
                          cursor: 'pointer',
                          transition: 'all 0.2s ease'
                        }}
                      >
                        {quality}
                      </button>
                    ))}
                  </div>
                </div>

                {/* Match Info */}
                <div style={{ padding: '16px' }}>
                  {/* Teams */}
                  <div style={{ textAlign: 'center', marginBottom: '12px' }}>
                    <div style={{
                      display: 'flex',
                      alignItems: 'center',
                      justifyContent: 'center',
                      gap: '12px',
                      marginBottom: '8px'
                    }}>
                      <span style={{
                        fontSize: '16px',
                        fontWeight: '600',
                        color: '#1a1a1a'
                      }}>
                        {match.teamA}
                      </span>
                      <span style={{
                        fontSize: '14px',
                        color: '#6b7280',
                        fontWeight: '500'
                      }}>
                        vs
                      </span>
                      <span style={{
                        fontSize: '16px',
                        fontWeight: '600',
                        color: '#1a1a1a'
                      }}>
                        {match.teamB}
                      </span>
                    </div>
                    
                    {/* Score/Time */}
                    <div style={{
                      fontSize: '18px',
                      fontWeight: '700',
                      color: match.isLive ? '#ef4444' : '#6b7280',
                      marginBottom: '8px'
                    }}>
                      {match.score}
                    </div>
                  </div>
                </div>
              </div>
            );
            })
          ) : (
            // Movies/TV Shows content rendering
            filteredContent.map((content) => (
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
                  {content.isNew && (
                    <div style={{
                      background: '#10b981',
                      color: 'white',
                      padding: '4px 8px',
                      borderRadius: '6px',
                      fontSize: '10px',
                      fontWeight: '600',
                      textTransform: 'uppercase'
                    }}>
                      New
                    </div>
                  )}
                  {content.isTrending && (
                    <div style={{
                      background: '#f59e0b',
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
                  top: '12px',
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
                      color: savedContent.has(content.id) ? '#ffa502' : '#6b7280',
                      transition: 'all 0.2s ease'
                    }}
                    onMouseEnter={(e) => e.currentTarget.style.borderColor = '#ffa502'}
                    onMouseLeave={(e) => e.currentTarget.style.borderColor = '#e5e7eb'}
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
          ))
        )}
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

export default Entertainment; 