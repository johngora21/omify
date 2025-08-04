import { useState } from 'react';
import { IoPlay, IoSearchOutline, IoRadio } from 'react-icons/io5';

const Sports = () => {
  const [searchQuery, setSearchQuery] = useState('');
  const [activeTab, setActiveTab] = useState('live');
  const [showFilterModal, setShowFilterModal] = useState(false);
  const [filters, setFilters] = useState({
    leagues: [] as string[],
    status: 'all' as 'all' | 'live' | 'upcoming'
  });

  const matches = [
    {
      id: '1',
      teamA: 'Manchester City',
      teamB: 'Arsenal',
      league: 'Premier League',
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
      status: 'live',
      time: 'LIVE',
      score: 'Lap 45/58',
      poster: 'https://images.unsplash.com/photo-1544367567-0f2fcb009e0b?w=300&h=200&fit=crop',
      description: 'Monaco Grand Prix - The crown jewel of F1',
      isLive: true,
      quality: ['HD', '4K', '1080p']
    }
  ];

  const handlePlay = (contentId: string, quality: string) => {
    console.log('Play match:', contentId, 'Quality:', quality);
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
      leagues: [],
      status: 'all'
    });
  };

  const toggleLeague = (league: string) => {
    setFilters(prev => ({
      ...prev,
      leagues: prev.leagues.includes(league) 
        ? prev.leagues.filter(l => l !== league)
        : [...prev.leagues, league]
    }));
  };

  const getLeagues = () => {
    return ['Premier League', 'NBA', 'UFC', 'Wimbledon', 'MLB', 'La Liga', 'NFL', 'Formula 1'];
  };

  const filteredMatches = matches.filter(match => {
    const matchesSearch = match.teamA.toLowerCase().includes(searchQuery.toLowerCase()) ||
                         match.teamB.toLowerCase().includes(searchQuery.toLowerCase()) ||
                         match.league.toLowerCase().includes(searchQuery.toLowerCase());
    
    let matchesStatus = filters.status === 'all' || match.status === filters.status;
    let matchesLeague = filters.leagues.length === 0 || filters.leagues.includes(match.league);
    
    return matchesSearch && matchesStatus && matchesLeague;
  });

  return (
    <div style={{
      backgroundColor: '#f8f9fa',
      minHeight: '100vh',
      paddingBottom: '80px'
    }}>




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
                placeholder="Search matches..."
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

      {/* Matches Grid */}
      <div style={{ padding: '16px' }}>
        <div style={{
          display: 'grid',
          gridTemplateColumns: 'repeat(auto-fill, minmax(320px, 1fr))',
          gap: '16px'
        }}>
          {filteredMatches.map((match) => (
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
                  onClick={() => handlePlay(match.id, 'HD')}
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
                        handlePlay(match.id, quality);
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

            {/* Leagues */}
            <div style={{ marginBottom: '24px' }}>
              <h4 style={{
                fontSize: '16px',
                fontWeight: '600',
                color: '#1a1a1a',
                marginBottom: '12px'
              }}>
                Leagues
              </h4>
              <div style={{
                display: 'flex',
                flexWrap: 'wrap',
                gap: '8px'
              }}>
                {getLeagues().map((league) => (
                  <button
                    key={league}
                    onClick={() => toggleLeague(league)}
                    style={{
                      padding: '8px 16px',
                      borderRadius: '20px',
                      border: '1px solid #e5e7eb',
                      background: filters.leagues.includes(league) ? '#3b82f6' : 'white',
                      color: filters.leagues.includes(league) ? 'white' : '#6b7280',
                      cursor: 'pointer',
                      fontSize: '14px',
                      fontWeight: '500',
                      transition: 'all 0.2s ease'
                    }}
                  >
                    {league}
                  </button>
                ))}
              </div>
            </div>

            {/* Status */}
            <div style={{ marginBottom: '24px' }}>
              <h4 style={{
                fontSize: '16px',
                fontWeight: '600',
                color: '#1a1a1a',
                marginBottom: '12px'
              }}>
                Status
              </h4>
              <div style={{
                display: 'flex',
                gap: '8px'
              }}>
                {[
                  { value: 'all', label: 'All Matches' },
                  { value: 'live', label: 'Live Now' },
                  { value: 'upcoming', label: 'Upcoming' }
                ].map((option) => (
                  <button
                    key={option.value}
                    onClick={() => setFilters(prev => ({ ...prev, status: option.value as any }))}
                    style={{
                      padding: '8px 16px',
                      borderRadius: '20px',
                      border: '1px solid #e5e7eb',
                      background: filters.status === option.value ? '#3b82f6' : 'white',
                      color: filters.status === option.value ? 'white' : '#6b7280',
                      cursor: 'pointer',
                      fontSize: '14px',
                      fontWeight: '500',
                      transition: 'all 0.2s ease'
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

export default Sports; 