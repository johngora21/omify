import { useState, useEffect } from 'react';
import { Link } from 'react-router-dom';
import { FaMapMarkerAlt, FaLocationArrow } from 'react-icons/fa';
import type { ServiceProvider } from '../types';

interface Location {
  latitude: number;
  longitude: number;
}

const Massage = () => {
  const [filters, setFilters] = useState({
    orientation: 'all',
    maxPrice: 500,
    minRating: 0,
    maxDistance: 50, // km
  });

  const [userLocation, setUserLocation] = useState<Location | null>(null);
  const [locationPermission, setLocationPermission] = useState<'granted' | 'denied' | 'requesting'>('requesting');

  // Mock massage data with coordinates
  const masseurs: (ServiceProvider & { coordinates: Location })[] = [
    {
      id: '1',
      name: 'Emma',
      age: 28,
      location: 'Uptown',
      serviceType: 'masseur',
      orientation: 'bisexual',
      price: 150,
      rating: 4.9,
      bio: 'Licensed massage therapist offering professional massage services. Swedish, deep tissue, and therapeutic massage available.',
      services: ['Swedish massage', 'Deep tissue massage', 'Hot stone massage'],
      equipment: ['Massage table', 'Hot stones', 'Aromatherapy oils'],
      photos: ['https://images.unsplash.com/photo-1517841905240-472988babdf9?w=300&h=400&fit=crop&crop=face'],
      verified: true,
      coordinates: { latitude: 40.7589, longitude: -73.9851 }, // NYC coordinates
    },
    {
      id: '2',
      name: 'Mia',
      age: 26,
      location: 'Eastside',
      serviceType: 'masseur',
      orientation: 'straight',
      price: 120,
      rating: 4.6,
      bio: 'Professional massage therapist with 8 years experience. Specializing in relaxation and stress relief.',
      services: ['Swedish massage', 'Relaxation massage', 'Sports massage'],
      equipment: ['Portable massage table', 'Essential oils', 'Heating pad'],
      photos: ['https://images.unsplash.com/photo-1517841905240-472988babdf9?w=300&h=400&fit=crop&crop=face'],
      verified: true,
      coordinates: { latitude: 40.7505, longitude: -73.9934 },
    },
    {
      id: '3',
      name: 'Sarah',
      age: 30,
      location: 'Downtown',
      serviceType: 'masseur',
      orientation: 'lesbian',
      price: 180,
      rating: 4.8,
      bio: 'Experienced massage therapist specializing in therapeutic and relaxation techniques. Mobile service available.',
      services: ['Therapeutic massage', 'Relaxation massage', 'Hot stone therapy'],
      equipment: ['Professional table', 'Hot stones', 'Essential oils', 'Heating equipment'],
      photos: ['https://images.unsplash.com/photo-1517841905240-472988babdf9?w=300&h=400&fit=crop&crop=face'],
      verified: true,
      coordinates: { latitude: 40.7128, longitude: -74.0060 },
    },
    {
      id: '4',
      name: 'Jessica',
      age: 25,
      location: 'Westside',
      serviceType: 'masseur',
      orientation: 'straight',
      price: 200,
      rating: 4.9,
      bio: 'Premium massage therapist with luxury spa experience. Specializing in deep tissue and relaxation massage.',
      services: ['Deep tissue massage', 'Luxury relaxation', 'Aromatherapy'],
      equipment: ['Luxury table', 'Premium oils', 'Aromatherapy', 'Heating system'],
      photos: ['https://images.unsplash.com/photo-1517841905240-472988babdf9?w=300&h=400&fit=crop&crop=face'],
      verified: true,
      coordinates: { latitude: 40.7589, longitude: -74.0060 },
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

  const filteredMasseurs = masseurs
    .map(masseur => {
      let distance = null;
      if (userLocation) {
        distance = calculateDistance(
          userLocation.latitude,
          userLocation.longitude,
          masseur.coordinates.latitude,
          masseur.coordinates.longitude
        );
      }
      return { ...masseur, distance };
    })
    .filter(masseur => {
      if (filters.orientation !== 'all' && masseur.orientation !== filters.orientation) return false;
      if (masseur.price > filters.maxPrice) return false;
      if (masseur.rating < filters.minRating) return false;
      if (masseur.distance !== null && masseur.distance > filters.maxDistance) return false;
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
          Massage Services
        </h1>
        <p style={{
          color: '#6b7280',
          fontSize: '0.875rem'
        }}>
          Professional massage therapists who come to you
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
              min="50"
              max="500"
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
        {filteredMasseurs.map(masseur => (
          <div key={masseur.id} style={{
            background: 'rgba(255, 255, 255, 0.9)',
            backdropFilter: 'blur(10px)',
            borderRadius: '16px',
            overflow: 'hidden',
            border: '1px solid rgba(255, 255, 255, 0.2)',
            transition: 'all 0.3s ease'
          }}>
            <div style={{ position: 'relative' }}>
              <img
                src={masseur.photos[0]}
                alt={masseur.name}
                style={{
                  width: '100%',
                  height: '200px',
                  objectFit: 'cover'
                }}
              />
              {masseur.verified && (
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
                    {masseur.name}, {masseur.age}
                  </h3>
                  <div style={{
                    display: 'flex',
                    alignItems: 'center',
                    gap: '4px',
                    color: '#6b7280',
                    fontSize: '0.875rem'
                  }}>
                    <FaMapMarkerAlt size={12} />
                    <span>{masseur.location}</span>
                    {masseur.distance !== null && (
                      <span style={{ color: '#3b82f6', fontWeight: '500' }}>
                        • {masseur.distance.toFixed(1)}km away
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
                    ${masseur.price}
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
                      {i < Math.floor(masseur.rating) ? '★' : '☆'}
                    </span>
                  ))}
                </div>
                <span style={{
                  marginLeft: '6px',
                  fontSize: '0.875rem',
                  color: '#6b7280'
                }}>
                  {masseur.rating}
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
                {masseur.bio}
              </p>
              
              <div style={{
                display: 'flex',
                flexWrap: 'wrap',
                gap: '6px',
                marginBottom: '16px'
              }}>
                {masseur.services.slice(0, 2).map(service => (
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
                to={`/provider/${masseur.id}`}
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
      
      {filteredMasseurs.length === 0 && (
        <div style={{
          textAlign: 'center',
          padding: '32px 16px'
        }}>
          <p style={{
            color: '#6b7280',
            fontSize: '1rem'
          }}>
            No massage therapists found matching your criteria.
          </p>
        </div>
      )}
    </div>
  );
};

export default Massage; 