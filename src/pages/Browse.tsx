import { useState } from 'react';
import { Link } from 'react-router-dom';
import type { ServiceProvider, FilterOptions } from '../types';

const Browse = () => {
  const [filters, setFilters] = useState<FilterOptions>({
    serviceType: 'all',
    orientation: 'all',
    maxPrice: 1000,
    minRating: 0,
  });

  // Real mock data for demonstration
  const providers: ServiceProvider[] = [
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
      photos: ['https://via.placeholder.com/300x400'],
      verified: true,
    },
    {
      id: '2',
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
      photos: ['https://via.placeholder.com/300x400'],
      verified: true,
    },
    {
      id: '3',
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
      photos: ['https://via.placeholder.com/300x400'],
      verified: true,
    },
    {
      id: '4',
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
      photos: ['https://via.placeholder.com/300x400'],
      verified: true,
    },
    {
      id: '5',
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
      photos: ['https://via.placeholder.com/300x400'],
      verified: true,
    },
    {
      id: '6',
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
      photos: ['https://via.placeholder.com/300x400'],
      verified: true,
    },
  ];

  const filteredProviders = providers.filter(provider => {
    if (filters.serviceType !== 'all' && provider.serviceType !== filters.serviceType) return false;
    if (filters.orientation !== 'all' && provider.orientation !== filters.orientation) return false;
    if (provider.price > filters.maxPrice) return false;
    if (provider.rating < filters.minRating) return false;
    return true;
  });

  return (
    <div style={{
      padding: '48px 16px',
      maxWidth: '1200px',
      margin: '0 auto'
    }}>
      <h1 style={{
        fontSize: '2.25rem',
        fontWeight: '700',
        color: '#111827',
        marginBottom: '48px',
        textAlign: 'center'
      }}>
        Browse Services
      </h1>
      
      {/* Filters */}
      <div style={{
        background: 'rgba(255, 255, 255, 0.8)',
        backdropFilter: 'blur(10px)',
        borderRadius: '16px',
        boxShadow: '0 20px 25px -5px rgba(0, 0, 0, 0.1), 0 10px 10px -5px rgba(0, 0, 0, 0.04)',
        border: '1px solid rgba(255, 255, 255, 0.2)',
        padding: '32px',
        marginBottom: '32px'
      }}>
        <h2 style={{
          fontSize: '1.5rem',
          fontWeight: '700',
          color: '#111827',
          marginBottom: '24px'
        }}>
          Filters
        </h2>
        <div style={{
          display: 'grid',
          gridTemplateColumns: 'repeat(auto-fit, minmax(200px, 1fr))',
          gap: '24px'
        }}>
          <div>
            <label style={{
              display: 'block',
              fontSize: '0.875rem',
              fontWeight: '500',
              color: '#374151',
              marginBottom: '8px'
            }}>
              Service Type
            </label>
            <select
              value={filters.serviceType}
              onChange={(e) => setFilters({...filters, serviceType: e.target.value})}
              style={{
                width: '100%',
                padding: '12px 16px',
                border: '1px solid #e5e7eb',
                borderRadius: '12px',
                background: 'rgba(255, 255, 255, 0.8)',
                backdropFilter: 'blur(10px)',
                transition: 'all 0.2s ease'
              }}
            >
              <option value="all">All Services</option>
              <option value="escort">Escort Services</option>
              <option value="masseur">Mobile Massage</option>
            </select>
          </div>
          
          <div>
            <label style={{
              display: 'block',
              fontSize: '0.875rem',
              fontWeight: '500',
              color: '#374151',
              marginBottom: '8px'
            }}>
              Orientation
            </label>
            <select
              value={filters.orientation}
              onChange={(e) => setFilters({...filters, orientation: e.target.value})}
              style={{
                width: '100%',
                padding: '12px 16px',
                border: '1px solid #e5e7eb',
                borderRadius: '12px',
                background: 'rgba(255, 255, 255, 0.8)',
                backdropFilter: 'blur(10px)',
                transition: 'all 0.2s ease'
              }}
            >
              <option value="all">All Orientations</option>
              <option value="straight">Straight</option>
              <option value="bisexual">Bisexual</option>
              <option value="lesbian">Lesbian</option>
            </select>
          </div>
          
          <div>
            <label style={{
              display: 'block',
              fontSize: '0.875rem',
              fontWeight: '500',
              color: '#374151',
              marginBottom: '8px'
            }}>
              Max Price: ${filters.maxPrice}
            </label>
            <input
              type="range"
              min="50"
              max="1000"
              value={filters.maxPrice}
              onChange={(e) => setFilters({...filters, maxPrice: parseInt(e.target.value)})}
              style={{
                width: '100%',
                height: '6px',
                borderRadius: '3px',
                background: 'linear-gradient(135deg, #ec4899 0%, #8b5cf6 100%)',
                outline: 'none'
              }}
            />
          </div>
          
          <div>
            <label style={{
              display: 'block',
              fontSize: '0.875rem',
              fontWeight: '500',
              color: '#374151',
              marginBottom: '8px'
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
                height: '6px',
                borderRadius: '3px',
                background: 'linear-gradient(135deg, #ec4899 0%, #8b5cf6 100%)',
                outline: 'none'
              }}
            />
          </div>
        </div>
      </div>

      {/* Results */}
      <div style={{
        display: 'grid',
        gridTemplateColumns: 'repeat(auto-fill, minmax(350px, 1fr))',
        gap: '32px'
      }}>
        {filteredProviders.map(provider => (
          <div key={provider.id} style={{
            background: 'rgba(255, 255, 255, 0.9)',
            backdropFilter: 'blur(10px)',
            borderRadius: '16px',
            boxShadow: '0 10px 15px -3px rgba(0, 0, 0, 0.1), 0 4px 6px -2px rgba(0, 0, 0, 0.05)',
            border: '1px solid rgba(255, 255, 255, 0.2)',
            padding: '24px',
            transition: 'all 0.3s ease'
          }}>
            <div style={{ position: 'relative', marginBottom: '16px' }}>
              <img
                src={provider.photos[0]}
                alt={provider.name}
                style={{
                  width: '100%',
                  height: '256px',
                  objectFit: 'cover',
                  borderRadius: '12px'
                }}
              />
              {provider.verified && (
                <div style={{
                  position: 'absolute',
                  top: '8px',
                  right: '8px',
                  background: '#10b981',
                  color: 'white',
                  padding: '4px 8px',
                  borderRadius: '12px',
                  fontSize: '0.75rem',
                  fontWeight: '600'
                }}>
                  ✓ Verified
                </div>
              )}
            </div>
            
            <div style={{
              display: 'flex',
              justifyContent: 'space-between',
              alignItems: 'flex-start',
              marginBottom: '16px'
            }}>
              <div>
                <h3 style={{
                  fontSize: '1.25rem',
                  fontWeight: '700',
                  color: '#111827'
                }}>
                  {provider.name}, {provider.age}
                </h3>
                <p style={{
                  color: '#6b7280',
                  fontSize: '0.875rem'
                }}>
                  {provider.location}
                </p>
              </div>
              <div style={{ textAlign: 'right' }}>
                <p style={{
                  fontSize: '1.5rem',
                  fontWeight: '700',
                  color: '#ec4899'
                }}>
                  ${provider.price}
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
              marginBottom: '16px'
            }}>
              <div style={{
                display: 'flex',
                color: '#fbbf24'
              }}>
                {[...Array(5)].map((_, i) => (
                  <span key={i} style={{ fontSize: '1rem' }}>
                    {i < Math.floor(provider.rating) ? '★' : '☆'}
                  </span>
                ))}
              </div>
              <span style={{
                marginLeft: '8px',
                fontSize: '0.875rem',
                color: '#6b7280'
              }}>
                {provider.rating}
              </span>
            </div>
            
            <p style={{
              color: '#6b7280',
              marginBottom: '16px',
              lineHeight: '1.6',
              display: '-webkit-box',
              WebkitLineClamp: 2,
              WebkitBoxOrient: 'vertical',
              overflow: 'hidden'
            }}>
              {provider.bio}
            </p>
            
            <div style={{
              display: 'flex',
              flexWrap: 'wrap',
              gap: '8px',
              marginBottom: '16px'
            }}>
              {provider.services.slice(0, 2).map(service => (
                <span key={service} style={{
                  background: '#fce7f3',
                  color: '#be185d',
                  fontSize: '0.75rem',
                  padding: '4px 8px',
                  borderRadius: '12px'
                }}>
                  {service}
                </span>
              ))}
            </div>
            
            <Link
              to={`/provider/${provider.id}`}
              style={{
                background: 'linear-gradient(135deg, #ec4899 0%, #8b5cf6 100%)',
                color: 'white',
                fontWeight: '600',
                padding: '12px 24px',
                borderRadius: '12px',
                textDecoration: 'none',
                display: 'block',
                textAlign: 'center',
                transition: 'all 0.3s ease'
              }}
            >
              View Profile
            </Link>
          </div>
        ))}
      </div>
      
      {filteredProviders.length === 0 && (
        <div style={{
          textAlign: 'center',
          padding: '48px 16px'
        }}>
          <p style={{
            color: '#6b7280',
            fontSize: '1.125rem'
          }}>
            No providers found matching your criteria.
          </p>
        </div>
      )}
    </div>
  );
};

export default Browse; 