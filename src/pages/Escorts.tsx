import { useState, useEffect } from 'react';
import { Link } from 'react-router-dom';
import { FaMapMarkerAlt, FaLocationArrow } from 'react-icons/fa';
import type { ServiceProvider } from '../types';

interface Location {
  latitude: number;
  longitude: number;
}

const Escorts = () => {
  const [filters, setFilters] = useState({
    orientation: 'all',
    maxPrice: 1000,
    minRating: 0,
    maxDistance: 50, // km
  });

  const [userLocation, setUserLocation] = useState<Location | null>(null);
  const [locationPermission, setLocationPermission] = useState<'granted' | 'denied' | 'requesting'>('requesting');

  // Mock escort data with coordinates
  const escorts: (ServiceProvider & { coordinates: Location })[] = [
    {
      id: '1',
      name: 'Sophia',
      age: 25,
      location: 'Downtown',
      serviceType: 'escort',
      orientation: 'straight',
      price: 300,
      rating: 4.8,
      bio: 'Professional escort with 5 years of experience. Specializing in intimate companionship and massage services.',
      services: ['Traditional intimate companionship', 'Oral services', 'Massage with happy ending'],
      equipment: ['Vibrators', 'Massage oils', 'Lingerie'],
      photos: ['https://images.unsplash.com/photo-1494790108755-2616b612b786?w=300&h=400&fit=crop&crop=face'],
      verified: true,
      coordinates: { latitude: 40.7128, longitude: -74.0060 }, // NYC coordinates
    },
    {
      id: '2',
      name: 'Isabella',
      age: 23,
      location: 'Midtown',
      serviceType: 'escort',
      orientation: 'lesbian',
      price: 250,
      rating: 4.7,
      bio: 'Experienced escort providing intimate services and companionship. Discreet and professional.',
      services: ['Traditional intimate companionship', 'Oral services', 'Pegging services'],
      equipment: ['Toys', 'Bondage equipment', 'Roleplay props'],
      photos: ['https://images.unsplash.com/photo-1494790108755-2616b612b786?w=300&h=400&fit=crop&crop=face'],
      verified: true,
      coordinates: { latitude: 40.7589, longitude: -73.9851 },
    },
    {
      id: '3',
      name: 'Ava',
      age: 27,
      location: 'Westside',
      serviceType: 'escort',
      orientation: 'straight',
      price: 400,
      rating: 4.9,
      bio: 'Premium escort service with luxury amenities. Specializing in high-end companionship and exclusive experiences.',
      services: ['Traditional intimate companionship', 'Oral services', 'Threesome', 'Video calls'],
      equipment: ['Premium toys', 'Luxury lingerie', 'Roleplay costumes', 'Safety equipment'],
      photos: ['https://images.unsplash.com/photo-1494790108755-2616b612b786?w=300&h=400&fit=crop&crop=face'],
      verified: true,
      coordinates: { latitude: 40.7589, longitude: -74.0060 },
    },
    {
      id: '4',
      name: 'Luna',
      age: 24,
      location: 'Northside',
      serviceType: 'escort',
      orientation: 'bisexual',
      price: 280,
      rating: 4.8,
      bio: 'Young and energetic escort providing exciting experiences. Open to various preferences and fantasies.',
      services: ['Traditional intimate companionship', 'Oral services', 'Roleplay scenarios'],
      equipment: ['Various toys', 'Costumes', 'Roleplay props', 'Safety items'],
      photos: ['https://images.unsplash.com/photo-1494790108755-2616b612b786?w=300&h=400&fit=crop&crop=face'],
      verified: true,
      coordinates: { latitude: 40.7505, longitude: -73.9934 },
    },
  ];

  // Calculate distance between two points using Haversine formula
  const calculateDistance = (lat1: number, lon1: number, lat2: number, lon2: number): number => {
    const R = 6371; // Earth's radius in kilometers
    const dLat = (lat2 - lat1) * Math.PI / 180;
    const dLon = (lon2 - lon1) * Math.PI / 180;
    const a = Math.sin(dLat/2) * Math.sin(dLat/2) +
              Math.cos(lat1 * Math.PI / 180) * Math.cos(lat2 * Math.PI / 180) *
              Math.sin(dLon/2) * Math.sin(dLon/2);
    const c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1-a));
    return R * c;
  };

  // Get user location
  const getUserLocation = () => {
    if (!navigator.geolocation) {
      setLocationPermission('denied');
      return;
    }

    setLocationPermission('requesting');
    navigator.geolocation.getCurrentPosition(
      (position) => {
        setUserLocation({
          latitude: position.coords.latitude,
          longitude: position.coords.longitude
        });
        setLocationPermission('granted');
      },
      (error) => {
        console.error('Error getting location:', error);
        setLocationPermission('denied');
      }
    );
  };

  useEffect(() => {
    getUserLocation();
  }, []);

  const filteredEscorts = escorts
    .map(escort => {
      let distance = null;
      if (userLocation) {
        distance = calculateDistance(
          userLocation.latitude,
          userLocation.longitude,
          escort.coordinates.latitude,
          escort.coordinates.longitude
        );
      }
      return { ...escort, distance };
    })
    .filter(escort => {
      if (filters.orientation !== 'all' && escort.orientation !== filters.orientation) return false;
      if (escort.price > filters.maxPrice) return false;
      if (escort.rating < filters.minRating) return false;
      if (escort.distance !== null && escort.distance > filters.maxDistance) return false;
      return true;
    })
    .sort((a, b) => {
      if (a.distance === null && b.distance === null) return 0;
      if (a.distance === null) return 1;
      if (b.distance === null) return -1;
      return a.distance - b.distance;
    });

  return (
    <div style={{ padding: '16px' }}>
      {/* Header */}
      <div style={{ marginBottom: '24px' }}>
        <h1 style={{
          fontSize: '1.75rem',
          fontWeight: '700',
          color: '#111827',
          marginBottom: '8px'
        }}>
          Escort Services
        </h1>
        <p style={{
          color: '#6b7280',
          fontSize: '0.875rem'
        }}>
          Find verified escort providers in your area
        </p>
      </div>

      {/* Location Status */}
      <div style={{
        background: 'rgba(255, 255, 255, 0.8)',
        backdropFilter: 'blur(10px)',
        borderRadius: '12px',
        padding: '16px',
        marginBottom: '16px',
        border: '1px solid rgba(255, 255, 255, 0.2)'
      }}>
        <div style={{
          display: 'flex',
          alignItems: 'center',
          justifyContent: 'space-between',
          marginBottom: '12px'
        }}>
          <div style={{ display: 'flex', alignItems: 'center', gap: '8px' }}>
            <FaLocationArrow color={locationPermission === 'granted' ? '#10b981' : '#6b7280'} />
            <span style={{ fontSize: '0.875rem', fontWeight: '500', color: '#374151' }}>
              Location Services
            </span>
          </div>
          {locationPermission === 'requesting' && (
            <span style={{ fontSize: '0.75rem', color: '#f59e0b' }}>Getting location...</span>
          )}
          {locationPermission === 'granted' && (
            <span style={{ fontSize: '0.75rem', color: '#10b981' }}>Location enabled</span>
          )}
          {locationPermission === 'denied' && (
            <button
              onClick={getUserLocation}
              style={{
                padding: '4px 8px',
                fontSize: '0.75rem',
                background: '#3b82f6',
                color: 'white',
                border: 'none',
                borderRadius: '4px',
                cursor: 'pointer'
              }}
            >
              Enable Location
            </button>
          )}
        </div>
        {userLocation && (
          <div style={{ fontSize: '0.75rem', color: '#6b7280' }}>
            Your location: {userLocation.latitude.toFixed(4)}, {userLocation.longitude.toFixed(4)}
          </div>
        )}
      </div>

      {/* Filters */}
      <div style={{
        background: 'rgba(255, 255, 255, 0.8)',
        backdropFilter: 'blur(10px)',
        borderRadius: '12px',
        padding: '16px',
        marginBottom: '20px',
        border: '1px solid rgba(255, 255, 255, 0.2)'
      }}>
        <div style={{
          display: 'grid',
          gridTemplateColumns: 'repeat(auto-fit, minmax(150px, 1fr))',
          gap: '12px'
        }}>
          <div>
            <label style={{
              display: 'block',
              fontSize: '0.75rem',
              fontWeight: '500',
              color: '#374151',
              marginBottom: '4px'
            }}>
              Orientation
            </label>
            <select
              value={filters.orientation}
              onChange={(e) => setFilters({...filters, orientation: e.target.value})}
              style={{
                width: '100%',
                padding: '8px 12px',
                border: '1px solid #e5e7eb',
                borderRadius: '8px',
                fontSize: '0.875rem',
                background: 'white'
              }}
            >
              <option value="all">All</option>
              <option value="straight">Straight</option>
              <option value="bisexual">Bisexual</option>
              <option value="lesbian">Lesbian</option>
            </select>
          </div>
          
          <div>
            <label style={{
              display: 'block',
              fontSize: '0.75rem',
              fontWeight: '500',
              color: '#374151',
              marginBottom: '4px'
            }}>
              Max Price: ${filters.maxPrice}
            </label>
            <input
              type="range"
              min="100"
              max="1000"
              value={filters.maxPrice}
              onChange={(e) => setFilters({...filters, maxPrice: parseInt(e.target.value)})}
              style={{
                width: '100%',
                height: '4px',
                borderRadius: '2px',
                background: 'linear-gradient(135deg, #3b82f6 0%, #1d4ed8 100%)',
                outline: 'none'
              }}
            />
          </div>
          
          <div>
            <label style={{
              display: 'block',
              fontSize: '0.75rem',
              fontWeight: '500',
              color: '#374151',
              marginBottom: '4px'
            }}>
              Min Rating: {filters.minRating}+
            </label>
            <input
              type="range"
              min="0"
              max="5"
              step="0.1"
              value={filters.minRating}
              onChange={(e) => setFilters({...filters, minRating: parseFloat(e.target.value)})}
              style={{
                width: '100%',
                height: '4px',
                borderRadius: '2px',
                background: 'linear-gradient(135deg, #3b82f6 0%, #1d4ed8 100%)',
                outline: 'none'
              }}
            />
          </div>
          
          <div>
            <label style={{
              display: 'block',
              fontSize: '0.75rem',
              fontWeight: '500',
              color: '#374151',
              marginBottom: '4px'
            }}>
              Max Distance: {filters.maxDistance}km
            </label>
            <input
              type="range"
              min="5"
              max="100"
              value={filters.maxDistance}
              onChange={(e) => setFilters({...filters, maxDistance: parseInt(e.target.value)})}
              style={{
                width: '100%',
                height: '4px',
                borderRadius: '2px',
                background: 'linear-gradient(135deg, #3b82f6 0%, #1d4ed8 100%)',
                outline: 'none'
              }}
            />
          </div>
        </div>
      </div>

      {/* Results */}
      <div style={{
        display: 'grid',
        gridTemplateColumns: 'repeat(auto-fill, minmax(280px, 1fr))',
        gap: '16px'
      }}>
        {filteredEscorts.map(escort => (
          <div key={escort.id} style={{
            background: 'rgba(255, 255, 255, 0.9)',
            backdropFilter: 'blur(10px)',
            borderRadius: '16px',
            overflow: 'hidden',
            border: '1px solid rgba(255, 255, 255, 0.2)',
            transition: 'all 0.3s ease'
          }}>
            <div style={{ position: 'relative' }}>
              <img
                src={escort.photos[0]}
                alt={escort.name}
                style={{
                  width: '100%',
                  height: '200px',
                  objectFit: 'cover'
                }}
              />
              {escort.verified && (
                <div style={{
                  position: 'absolute',
                  top: '8px',
                  right: '8px',
                  background: '#10b981',
                  color: 'white',
                  padding: '4px 8px',
                  borderRadius: '8px',
                  fontSize: '0.75rem',
                  fontWeight: '600'
                }}>
                  ✓ Verified
                </div>
              )}
            </div>
            
            <div style={{ padding: '16px' }}>
              <div style={{
                display: 'flex',
                justifyContent: 'space-between',
                alignItems: 'flex-start',
                marginBottom: '12px'
              }}>
                <div>
                  <h3 style={{
                    fontSize: '1.125rem',
                    fontWeight: '700',
                    color: '#111827',
                    marginBottom: '4px'
                  }}>
                    {escort.name}, {escort.age}
                  </h3>
                  <div style={{
                    display: 'flex',
                    alignItems: 'center',
                    gap: '4px',
                    color: '#6b7280',
                    fontSize: '0.875rem'
                  }}>
                    <FaMapMarkerAlt size={12} />
                    <span>{escort.location}</span>
                    {escort.distance !== null && (
                      <span style={{ color: '#3b82f6', fontWeight: '500' }}>
                        • {escort.distance.toFixed(1)}km away
                      </span>
                    )}
                  </div>
                </div>
                <div style={{ textAlign: 'right' }}>
                  <p style={{
                    fontSize: '1.25rem',
                    fontWeight: '700',
                    color: '#3b82f6'
                  }}>
                    ${escort.price}
                  </p>
                  <p style={{
                    fontSize: '0.75rem',
                    color: '#6b7280'
                  }}>
                    per hour
                  </p>
                </div>
              </div>
              
              <div style={{
                display: 'flex',
                alignItems: 'center',
                marginBottom: '12px'
              }}>
                <div style={{
                  display: 'flex',
                  color: '#fbbf24'
                }}>
                  {[...Array(5)].map((_, i) => (
                    <span key={i} style={{ fontSize: '0.875rem' }}>
                      {i < Math.floor(escort.rating) ? '★' : '☆'}
                    </span>
                  ))}
                </div>
                <span style={{
                  marginLeft: '6px',
                  fontSize: '0.875rem',
                  color: '#6b7280'
                }}>
                  {escort.rating}
                </span>
              </div>
              
              <p style={{
                color: '#6b7280',
                fontSize: '0.875rem',
                lineHeight: '1.5',
                marginBottom: '12px',
                display: '-webkit-box',
                WebkitLineClamp: 2,
                WebkitBoxOrient: 'vertical',
                overflow: 'hidden'
              }}>
                {escort.bio}
              </p>
              
              <div style={{
                display: 'flex',
                flexWrap: 'wrap',
                gap: '6px',
                marginBottom: '16px'
              }}>
                {escort.services.slice(0, 2).map(service => (
                  <span key={service} style={{
                    background: '#dbeafe',
                    color: '#1e40af',
                    fontSize: '0.75rem',
                    padding: '4px 8px',
                    borderRadius: '8px'
                  }}>
                    {service}
                  </span>
                ))}
              </div>
              
              <Link
                to={`/provider/${escort.id}`}
                style={{
                  background: 'linear-gradient(135deg, #3b82f6 0%, #1d4ed8 100%)',
                  color: 'white',
                  fontWeight: '600',
                  padding: '10px 16px',
                  borderRadius: '8px',
                  textDecoration: 'none',
                  display: 'block',
                  textAlign: 'center',
                  fontSize: '0.875rem',
                  transition: 'all 0.3s ease'
                }}
              >
                View Profile
              </Link>
            </div>
          </div>
        ))}
      </div>
      
      {filteredEscorts.length === 0 && (
        <div style={{
          textAlign: 'center',
          padding: '32px 16px'
        }}>
          <p style={{
            color: '#6b7280',
            fontSize: '1rem'
          }}>
            No escorts found matching your criteria.
          </p>
        </div>
      )}
    </div>
  );
};

export default Escorts; 