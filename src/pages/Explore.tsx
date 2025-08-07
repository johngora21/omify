import { useState } from 'react';
import { useNavigate } from 'react-router-dom';
import { IoSearchOutline, IoLocation, IoClose, IoCar, IoBed, IoArrowBack } from 'react-icons/io5';
import { MdTravelExplore } from 'react-icons/md';
import { FaHeart, FaRegHeart, FaRegBookmark, FaStar } from 'react-icons/fa';
import { MdVerified } from 'react-icons/md';

const Explore = () => {
  const navigate = useNavigate();
  const [activeTab, setActiveTab] = useState('hotels');
  const [searchQuery, setSearchQuery] = useState('');
  const [showFilterModal, setShowFilterModal] = useState(false);

  const [filters, setFilters] = useState({
    priceRange: [0, 1000],
    distance: 10,
    rating: 0,
    verifiedOnly: false,
    // Hotels specific
    propertyType: '',
    starRating: 0,
    amenities: [] as string[],
    locationSpecific: [] as string[],
    // Cars specific
    vehicleType: '',
    features: [] as string[],
    // Adventures specific
    adventureType: '',
    groupSize: '',
    duration: '',
    services: [] as string[]
  });

  const hotels = [
    {
      id: '1',
      name: 'Serengeti Safari Lodge',
      providerName: 'Serengeti Lodge Group',
      providerAvatar: 'https://images.unsplash.com/photo-1566073771259-6a8506099945?w=400&h=300&fit=crop',
      avatar: 'https://images.unsplash.com/photo-1566073771259-6a8506099945?w=400&h=300&fit=crop',
      rating: 4.8,
      price: '150,000',
      priceType: 'night',
      location: 'Serengeti National Park',
      amenities: ['WiFi', 'Pool', 'Restaurant', 'Spa'],
      verified: true,
      description: 'Luxury safari lodge with stunning views of the Serengeti plains.'
    },
    {
      id: '2',
      name: 'Zanzibar Beach Resort',
      providerName: 'Zanzibar Resorts Ltd',
      providerAvatar: 'https://images.unsplash.com/photo-1571896349842-33c89424de2d?w=400&h=300&fit=crop',
      avatar: 'https://images.unsplash.com/photo-1571896349842-33c89424de2d?w=400&h=300&fit=crop',
      rating: 4.6,
      price: '120,000',
      priceType: 'night',
      location: 'Zanzibar Island',
      amenities: ['Beach Access', 'Spa', 'Restaurant', 'Water Sports'],
      verified: true,
      description: 'Beachfront resort with pristine white sand beaches.'
    }
  ];

  const carRentals = [
    {
      id: '1',
      name: 'Toyota Land Cruiser 4x4',
      providerName: 'Safari Car Rentals',
      providerAvatar: 'https://images.unsplash.com/photo-1549317661-bd32c8ce0db2?w=400&h=300&fit=crop',
      avatar: 'https://images.unsplash.com/photo-1549317661-bd32c8ce0db2?w=400&h=300&fit=crop',
      rating: 4.7,
      price: '80,000',
      priceType: 'day',
      location: 'Arusha',
      amenities: ['4x4', 'AC', 'GPS', 'Insurance'],
      verified: true,
      description: 'Perfect for safari adventures and off-road exploration.'
    },
    {
      id: '2',
      name: 'Economy Sedan',
      providerName: 'City Car Rentals',
      providerAvatar: 'https://images.unsplash.com/photo-1552519507-da3b142c6e3d?w=400&h=300&fit=crop',
      avatar: 'https://images.unsplash.com/photo-1552519507-da3b142c6e3d?w=400&h=300&fit=crop',
      rating: 4.3,
      price: '45,000',
      priceType: 'day',
      location: 'Dar es Salaam',
      amenities: ['AC', 'GPS', 'Fuel Efficient'],
      verified: false,
      description: 'Affordable city transportation with great fuel economy.'
    }
  ];

  const adventures = [
    {
      id: '1',
      name: 'Serengeti Safari Tour',
      providerName: 'Wildlife Adventures',
      providerAvatar: 'https://images.unsplash.com/photo-1559827260-dc66d52bef19?w=400&h=300&fit=crop',
      avatar: 'https://images.unsplash.com/photo-1559827260-dc66d52bef19?w=400&h=300&fit=crop',
      rating: 4.9,
      price: '250,000',
      priceType: 'person',
      location: 'Serengeti National Park',
      amenities: ['Guide', 'Transport', 'Accommodation', 'Meals'],
      verified: true,
      description: '3-day safari experience with professional wildlife guides.'
    },
    {
      id: '2',
      name: 'Kilimanjaro Climbing',
      providerName: 'Mountain Expeditions',
      providerAvatar: 'https://images.unsplash.com/photo-1506905925346-21bda4d32df4?w=400&h=300&fit=crop',
      avatar: 'https://images.unsplash.com/photo-1506905925346-21bda4d32df4?w=400&h=300&fit=crop',
      rating: 4.8,
      price: '800,000',
      priceType: 'person',
      location: 'Mount Kilimanjaro',
      amenities: ['Equipment', 'Guide', 'Accommodation', 'Permits'],
      verified: true,
      description: '7-day climbing expedition to Africa\'s highest peak.'
    }
  ];

  const getItems = () => {
    switch (activeTab) {
      case 'hotels':
        return hotels;
      case 'cars':
        return carRentals;
      case 'adventures':
        return adventures;
      default:
        return hotels;
    }
  };

  const items = getItems();

  const closeFilterModal = () => {
    setShowFilterModal(false);
  };

  const resetFilters = () => {
    setFilters({
      priceRange: [0, 1000],
      distance: 10,
      rating: 0,
      verifiedOnly: false,
      propertyType: '',
      starRating: 0,
      amenities: [],
      locationSpecific: [],
      vehicleType: '',
      features: [],
      adventureType: '',
      groupSize: '',
      duration: '',
      services: []
    });
  };

  const applyFilters = () => {
    // Apply filters logic here
    console.log('Applied filters:', filters);
    setShowFilterModal(false);
  };

  return (
    <div style={{
      minHeight: '100vh',
      background: '#f8f9fa',
      maxWidth: '100vw',
      overflowX: 'hidden'
    }}>
      {/* Header */}
      <div style={{
        background: 'white',
        borderBottom: '1px solid #e5e7eb',
        padding: '16px',
        position: 'sticky',
        top: 0,
        zIndex: 10
      }}>
        {/* Back Arrow */}
        <button
          onClick={() => navigate(-1)}
          style={{
            background: 'none',
            border: 'none',
            cursor: 'pointer',
            padding: '8px',
            borderRadius: '50%',
            display: 'flex',
            alignItems: 'center',
            justifyContent: 'center',
            marginBottom: '16px'
          }}
        >
          <IoArrowBack size={24} color="#6b7280" />
        </button>
        {/* Tabs */}
        <div style={{
          display: 'flex',
          backgroundColor: '#f3f4f6',
          borderRadius: '12px',
          padding: '4px',
          marginBottom: '16px'
        }}>
          <button
            onClick={() => setActiveTab('hotels')}
            style={{
              flex: 1,
              padding: '12px 16px',
              borderRadius: '8px',
              border: 'none',
              background: activeTab === 'hotels' ? 'white' : 'transparent',
              color: activeTab === 'hotels' ? '#1a1a1a' : '#6b7280',
              fontWeight: activeTab === 'hotels' ? '600' : '500',
              cursor: 'pointer',
              transition: 'all 0.2s ease',
              boxShadow: activeTab === 'hotels' ? '0 2px 4px rgba(0,0,0,0.1)' : 'none'
            }}
          >
            <IoBed size={16} style={{ 
              marginRight: '8px', 
              verticalAlign: 'middle',
              color: activeTab === 'hotels' ? '#3b82f6' : '#6b7280'
            }} />
            Accommodation
          </button>
          <button
            onClick={() => setActiveTab('cars')}
            style={{
              flex: 1,
              padding: '12px 16px',
              borderRadius: '8px',
              border: 'none',
              background: activeTab === 'cars' ? 'white' : 'transparent',
              color: activeTab === 'cars' ? '#1a1a1a' : '#6b7280',
              fontWeight: activeTab === 'cars' ? '600' : '500',
              cursor: 'pointer',
              transition: 'all 0.2s ease',
              boxShadow: activeTab === 'cars' ? '0 2px 4px rgba(0,0,0,0.1)' : 'none'
            }}
          >
            <IoCar size={16} style={{ 
              marginRight: '8px', 
              verticalAlign: 'middle',
              color: activeTab === 'cars' ? '#3b82f6' : '#6b7280'
            }} />
            Cars
          </button>
          <button
            onClick={() => setActiveTab('adventures')}
            style={{
              flex: 1,
              padding: '12px 16px',
              borderRadius: '8px',
              border: 'none',
              background: activeTab === 'adventures' ? 'white' : 'transparent',
              color: activeTab === 'adventures' ? '#1a1a1a' : '#6b7280',
              fontWeight: activeTab === 'adventures' ? '600' : '500',
              cursor: 'pointer',
              transition: 'all 0.2s ease',
              boxShadow: activeTab === 'adventures' ? '0 2px 4px rgba(0,0,0,0.1)' : 'none'
            }}
          >
            <MdTravelExplore size={16} style={{ 
              marginRight: '8px', 
              verticalAlign: 'middle',
              color: activeTab === 'adventures' ? '#3b82f6' : '#6b7280'
            }} />
            Adventures
          </button>
        </div>

        {/* Search Bar */}
        <div style={{
          display: 'flex',
          gap: '12px',
          alignItems: 'center'
        }}>
          <form style={{ flex: 1 }}>
            <div style={{
              position: 'relative',
              display: 'flex',
              alignItems: 'center'
            }}>
              <IoSearchOutline 
                size={20} 
                color="#9ca3af" 
                style={{ position: 'absolute', left: '12px' }}
              />
              <input
                type="text"
                placeholder={`Search ${activeTab === 'hotels' ? 'hotels' : activeTab === 'cars' ? 'car rentals' : 'adventures'}...`}
                value={searchQuery}
                onChange={(e) => setSearchQuery(e.target.value)}
                style={{
                  width: '100%',
                  padding: '12px 12px 12px 44px',
                  border: '1px solid #e5e7eb',
                  borderRadius: '12px',
                  fontSize: '16px',
                  background: '#f9fafb'
                }}
              />
            </div>
          </form>
          <button
            onClick={() => alert('Location clicked')}
            style={{
              padding: '12px',
              background: 'white',
              border: '1px solid #e5e7eb',
              borderRadius: '12px',
              cursor: 'pointer',
              display: 'flex',
              alignItems: 'center',
              justifyContent: 'center'
            }}
          >
            <IoLocation size={20} color="#3b82f6" />
          </button>
          <button
            onClick={() => setShowFilterModal(true)}
            style={{
              background: '#f3f4f6',
              color: '#6b7280',
              border: 'none',
              borderRadius: '12px',
              padding: '12px',
              cursor: 'pointer',
              display: 'flex',
              alignItems: 'center',
              justifyContent: 'center',
              transition: 'all 0.2s ease'
            }}
          >
            <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="#6b7280" strokeWidth="2">
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

      {/* Content */}
      <div style={{
        padding: '16px',
        paddingBottom: '100px'
      }}>
        <div style={{
          display: 'grid',
          gridTemplateColumns: 'repeat(auto-fill, minmax(300px, 1fr))',
          gap: '20px',
          maxWidth: '100%'
        }}>
          {items.map((item) => (
            <div key={item.id} style={{
              backgroundColor: 'white',
              borderRadius: '16px',
              overflow: 'hidden',
              boxShadow: '0 4px 6px -1px rgba(0, 0, 0, 0.1)',
              transition: 'all 0.2s ease',
              cursor: 'pointer'
            }}>
              {/* Profile Info Section */}
              <div style={{
                padding: '16px 16px 12px 16px',
                display: 'flex',
                alignItems: 'center',
                gap: '12px'
              }}>
                <img
                  src={item.providerAvatar}
                  alt={item.providerName}
                  style={{
                    width: '48px',
                    height: '48px',
                    borderRadius: '50%',
                    objectFit: 'cover',
                    cursor: 'pointer',
                    border: '2px solid #e5e7eb'
                  }}
                />
                <div style={{ flex: 1 }}>
                  <div style={{
                    display: 'flex',
                    alignItems: 'center',
                    gap: '8px',
                    marginBottom: '4px'
                  }}>
                    <span style={{
                      fontSize: '16px',
                      fontWeight: '600',
                      color: '#1a1a1a'
                    }}>
                      {item.providerName}
                    </span>
                    {item.verified && (
                      <MdVerified size={16} color="#3b82f6" />
                    )}
                  </div>
                  <div style={{
                    display: 'flex',
                    alignItems: 'center',
                    gap: '8px',
                    fontSize: '14px',
                    color: '#6b7280'
                  }}>
                    <span>{item.location}</span>
                  </div>
                </div>
              </div>

              {/* Main Image */}
              <div style={{
                position: 'relative',
                height: '350px'
              }}>
                <img
                  src={item.avatar}
                  alt={item.name}
                  style={{
                    width: '100%',
                    height: '100%',
                    objectFit: 'cover'
                  }}
                />
              </div>

              {/* Like and Save Icons Below Image */}
              <div style={{
                padding: '12px 16px',
                display: 'flex',
                gap: '16px',
                alignItems: 'center'
              }}>
                <button
                  style={{
                    background: 'none',
                    border: 'none',
                    cursor: 'pointer',
                    display: 'flex',
                    alignItems: 'center',
                    justifyContent: 'center',
                    color: '#6b7280',
                    transition: 'all 0.2s ease',
                    padding: '8px'
                  }}
                >
                  <FaRegHeart size={26} />
                </button>
                
                <button
                  style={{
                    background: 'none',
                    border: 'none',
                    cursor: 'pointer',
                    display: 'flex',
                    alignItems: 'center',
                    justifyContent: 'center',
                    color: '#6b7280',
                    transition: 'all 0.2s ease',
                    padding: '8px'
                  }}
                >
                  <FaRegBookmark size={24} />
                </button>
              </div>

              {/* Item Details */}
              <div style={{
                padding: '0 16px 16px 16px'
              }}>
                {/* Rating */}
                <div style={{
                  marginBottom: '16px',
                  fontSize: '14px',
                  color: '#6b7280',
                  display: 'flex',
                  alignItems: 'center',
                  gap: '12px'
                }}>
                  <div style={{
                    display: 'flex',
                    alignItems: 'center',
                    gap: '4px'
                  }}>
                    <FaStar size={12} color="#fbbf24" />
                    <span>{item.rating}</span>
                  </div>
                </div>

                {/* Description */}
                <div style={{
                  marginBottom: '16px',
                  fontSize: '14px',
                  color: '#6b7280',
                  lineHeight: '1.4'
                }}>
                  {item.description}
                </div>

                {/* Amenities */}
                <div style={{
                  marginBottom: '12px'
                }}>
                  <div style={{
                    fontSize: '14px',
                    fontWeight: '600',
                    color: '#1a1a1a',
                    marginBottom: '6px'
                  }}>
                    Features:
                  </div>
                  <div style={{
                    display: 'flex',
                    flexWrap: 'wrap',
                    gap: '4px'
                  }}>
                    {item.amenities.slice(0, 3).map((amenity, index) => (
                      <span key={index} style={{
                        background: '#f3f4f6',
                        color: '#6b7280',
                        padding: '2px 6px',
                        borderRadius: '8px',
                        fontSize: '11px',
                        fontWeight: '400'
                      }}>
                        {amenity}
                      </span>
                    ))}
                    {item.amenities.length > 3 && (
                      <span style={{
                        background: '#f3f4f6',
                        color: '#6b7280',
                        padding: '2px 6px',
                        borderRadius: '8px',
                        fontSize: '11px'
                      }}>
                        +{item.amenities.length - 3} more
                      </span>
                    )}
                  </div>
                </div>

                {/* Price */}
                <div style={{
                  marginBottom: '16px',
                  fontSize: '16px',
                  color: '#1a1a1a'
                }}>
                  <span style={{ fontWeight: '700', color: '#3b82f6' }}>Tsh {item.price}</span>
                  <span style={{ fontWeight: '400', color: '#6b7280' }}> / {item.priceType}</span>
                </div>

                {/* Booking Button */}
                <div style={{
                  display: 'flex',
                  justifyContent: 'flex-end',
                  marginTop: '16px'
                }}>
                  <button
                    style={{
                      padding: '12px 24px',
                      borderRadius: '8px',
                      border: 'none',
                      fontWeight: '600',
                      cursor: 'pointer',
                      transition: 'all 0.2s ease',
                      backgroundColor: '#3b82f6',
                      color: 'white'
                    }}
                  >
                    Book Now
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
          background: 'rgba(0, 0, 0, 0.8)',
          zIndex: 2000,
          display: 'flex',
          alignItems: 'center',
          justifyContent: 'center',
          padding: '20px'
        }}>
          <div style={{
            background: 'white',
            borderRadius: '16px',
            padding: '20px',
            maxWidth: '90vw',
            maxHeight: '90vh',
            overflow: 'auto',
            width: '400px'
          }}>
            <div style={{
              display: 'flex',
              justifyContent: 'space-between',
              alignItems: 'center',
              marginBottom: '20px'
            }}>
              <h3 style={{ margin: 0, fontSize: '18px', fontWeight: '600' }}>
                Filter {activeTab === 'hotels' ? 'Accommodation' : activeTab === 'cars' ? 'Car Rentals' : 'Adventures'}
              </h3>
              <button
                onClick={closeFilterModal}
                style={{
                  background: 'none',
                  border: 'none',
                  cursor: 'pointer',
                  padding: '8px'
                }}
              >
                <IoClose size={24} />
              </button>
            </div>

            {/* Price Range */}
            <div style={{ marginBottom: '20px' }}>
              <label style={{ fontSize: '16px', fontWeight: '600', marginBottom: '8px', display: 'block' }}>
                Price Range (TSh)
              </label>
              <div style={{ display: 'flex', gap: '12px', alignItems: 'center' }}>
                <input
                  type="number"
                  placeholder="Min"
                  value={filters.priceRange[0]}
                  onChange={(e) => setFilters({...filters, priceRange: [parseInt(e.target.value) || 0, filters.priceRange[1]]})}
                  style={{
                    flex: 1,
                    padding: '12px',
                    border: '1px solid #e5e7eb',
                    borderRadius: '8px',
                    fontSize: '14px'
                  }}
                />
                <span>-</span>
                <input
                  type="number"
                  placeholder="Max"
                  value={filters.priceRange[1]}
                  onChange={(e) => setFilters({...filters, priceRange: [filters.priceRange[0], parseInt(e.target.value) || 1000]})}
                  style={{
                    flex: 1,
                    padding: '12px',
                    border: '1px solid #e5e7eb',
                    borderRadius: '8px',
                    fontSize: '14px'
                  }}
                />
              </div>
            </div>

            {/* Rating Filter */}
            <div style={{ marginBottom: '20px' }}>
              <label style={{ fontSize: '16px', fontWeight: '600', marginBottom: '8px', display: 'block' }}>
                Minimum Rating
              </label>
              <div style={{ display: 'flex', gap: '8px', flexWrap: 'wrap' }}>
                {[0, 1, 2, 3, 4, 5].map((rating) => (
                  <button
                    key={rating}
                    onClick={() => setFilters({...filters, rating})}
                    style={{
                      padding: '8px 12px',
                      border: '1px solid #e5e7eb',
                      borderRadius: '8px',
                      background: filters.rating === rating ? '#3b82f6' : 'white',
                      color: filters.rating === rating ? 'white' : '#6b7280',
                      cursor: 'pointer',
                      fontSize: '14px'
                    }}
                  >
                    {rating === 0 ? 'Any' : `${rating}+`}
                  </button>
                ))}
              </div>
            </div>

            {/* Verified Only */}
            <div style={{ marginBottom: '20px' }}>
              <label style={{ fontSize: '16px', fontWeight: '600', marginBottom: '8px', display: 'block' }}>
                Verification
              </label>
              <div style={{ display: 'flex', alignItems: 'center', gap: '8px' }}>
                <input
                  type="checkbox"
                  id="verifiedOnly"
                  checked={filters.verifiedOnly}
                  onChange={(e) => setFilters({...filters, verifiedOnly: e.target.checked})}
                  style={{ width: '16px', height: '16px' }}
                />
                <label htmlFor="verifiedOnly" style={{ fontSize: '14px', color: '#6b7280' }}>
                  Verified providers only
                </label>
              </div>
            </div>

            {/* Hotels Specific Filters */}
            {activeTab === 'hotels' && (
              <>
                {/* Property Type */}
                <div style={{ marginBottom: '20px' }}>
                  <label style={{ fontSize: '16px', fontWeight: '600', marginBottom: '8px', display: 'block' }}>
                    Property Type
                  </label>
                  <div style={{ display: 'flex', flexWrap: 'wrap', gap: '8px' }}>
                    {['Hotel', 'BnB', 'Lodge', 'Resort', 'Camp'].map((type) => (
                      <button
                        key={type}
                        onClick={() => setFilters({...filters, propertyType: filters.propertyType === type ? '' : type})}
                        style={{
                          padding: '6px 12px',
                          border: '1px solid #e5e7eb',
                          borderRadius: '16px',
                          background: filters.propertyType === type ? '#3b82f6' : 'white',
                          color: filters.propertyType === type ? 'white' : '#6b7280',
                          cursor: 'pointer',
                          fontSize: '12px'
                        }}
                      >
                        {type}
                      </button>
                    ))}
                  </div>
                </div>

                {/* Star Rating */}
                <div style={{ marginBottom: '20px' }}>
                  <label style={{ fontSize: '16px', fontWeight: '600', marginBottom: '8px', display: 'block' }}>
                    Star Rating
                  </label>
                  <div style={{ display: 'flex', gap: '8px', flexWrap: 'wrap' }}>
                    {[0, 1, 2, 3, 4, 5].map((stars) => (
                      <button
                        key={stars}
                        onClick={() => setFilters({...filters, starRating: filters.starRating === stars ? 0 : stars})}
                        style={{
                          padding: '8px 12px',
                          border: '1px solid #e5e7eb',
                          borderRadius: '8px',
                          background: filters.starRating === stars ? '#3b82f6' : 'white',
                          color: filters.starRating === stars ? 'white' : '#6b7280',
                          cursor: 'pointer',
                          fontSize: '14px'
                        }}
                      >
                        {stars === 0 ? 'Any' : `${stars}★`}
                      </button>
                    ))}
                  </div>
                </div>

                {/* Amenities */}
                <div style={{ marginBottom: '20px' }}>
                  <label style={{ fontSize: '16px', fontWeight: '600', marginBottom: '8px', display: 'block' }}>
                    Amenities
                  </label>
                  <div style={{ display: 'flex', flexWrap: 'wrap', gap: '8px' }}>
                    {['WiFi', 'Pool', 'Restaurant', 'Spa', 'Airport Transfer', 'Breakfast', 'Parking', 'AC/Heating', 'Pet Friendly', 'Family Rooms'].map((amenity) => (
                      <button
                        key={amenity}
                        onClick={() => {
                          const newAmenities = filters.amenities.includes(amenity) 
                            ? filters.amenities.filter(a => a !== amenity)
                            : [...filters.amenities, amenity];
                          setFilters({...filters, amenities: newAmenities});
                        }}
                        style={{
                          padding: '6px 12px',
                          border: '1px solid #e5e7eb',
                          borderRadius: '16px',
                          background: filters.amenities.includes(amenity) ? '#3b82f6' : 'white',
                          color: filters.amenities.includes(amenity) ? 'white' : '#6b7280',
                          cursor: 'pointer',
                          fontSize: '12px'
                        }}
                      >
                        {amenity}
                      </button>
                    ))}
                  </div>
                </div>

                {/* Location Specific */}
                <div style={{ marginBottom: '20px' }}>
                  <label style={{ fontSize: '16px', fontWeight: '600', marginBottom: '8px', display: 'block' }}>
                    Location Features
                  </label>
                  <div style={{ display: 'flex', flexWrap: 'wrap', gap: '8px' }}>
                    {['Near Safari Parks', 'Beach Access', 'City Center', 'Airport Proximity'].map((location) => (
                      <button
                        key={location}
                        onClick={() => {
                          const newLocations = filters.locationSpecific.includes(location) 
                            ? filters.locationSpecific.filter(l => l !== location)
                            : [...filters.locationSpecific, location];
                          setFilters({...filters, locationSpecific: newLocations});
                        }}
                        style={{
                          padding: '6px 12px',
                          border: '1px solid #e5e7eb',
                          borderRadius: '16px',
                          background: filters.locationSpecific.includes(location) ? '#3b82f6' : 'white',
                          color: filters.locationSpecific.includes(location) ? 'white' : '#6b7280',
                          cursor: 'pointer',
                          fontSize: '12px'
                        }}
                      >
                        {location}
                      </button>
                    ))}
                  </div>
                </div>
              </>
            )}

            {/* Cars Specific Filters */}
            {activeTab === 'cars' && (
              <>
                {/* Vehicle Type */}
                <div style={{ marginBottom: '20px' }}>
                  <label style={{ fontSize: '16px', fontWeight: '600', marginBottom: '8px', display: 'block' }}>
                    Vehicle Type
                  </label>
                  <div style={{ display: 'flex', flexWrap: 'wrap', gap: '8px' }}>
                    {['4x4/SUV', 'Sedan', 'Economy', 'Luxury', 'Van/Minibus', 'Truck'].map((type) => (
                      <button
                        key={type}
                        onClick={() => setFilters({...filters, vehicleType: filters.vehicleType === type ? '' : type})}
                        style={{
                          padding: '6px 12px',
                          border: '1px solid #e5e7eb',
                          borderRadius: '16px',
                          background: filters.vehicleType === type ? '#3b82f6' : 'white',
                          color: filters.vehicleType === type ? 'white' : '#6b7280',
                          cursor: 'pointer',
                          fontSize: '12px'
                        }}
                      >
                        {type}
                      </button>
                    ))}
                  </div>
                </div>

                {/* Features */}
                <div style={{ marginBottom: '20px' }}>
                  <label style={{ fontSize: '16px', fontWeight: '600', marginBottom: '8px', display: 'block' }}>
                    Features
                  </label>
                  <div style={{ display: 'flex', flexWrap: 'wrap', gap: '8px' }}>
                    {['AC', 'GPS', 'Insurance', 'Unlimited Mileage', 'Driver Optional', 'Airport Pickup', 'Hotel Delivery', '24/7 Support', 'One-way Rental'].map((feature) => (
                      <button
                        key={feature}
                        onClick={() => {
                          const newFeatures = filters.features.includes(feature) 
                            ? filters.features.filter(f => f !== feature)
                            : [...filters.features, feature];
                          setFilters({...filters, features: newFeatures});
                        }}
                        style={{
                          padding: '6px 12px',
                          border: '1px solid #e5e7eb',
                          borderRadius: '16px',
                          background: filters.features.includes(feature) ? '#3b82f6' : 'white',
                          color: filters.features.includes(feature) ? 'white' : '#6b7280',
                          cursor: 'pointer',
                          fontSize: '12px'
                        }}
                      >
                        {feature}
                      </button>
                    ))}
                  </div>
                </div>
              </>
            )}

            {/* Adventures Specific Filters */}
            {activeTab === 'adventures' && (
              <>
                {/* Adventure Type */}
                <div style={{ marginBottom: '20px' }}>
                  <label style={{ fontSize: '16px', fontWeight: '600', marginBottom: '8px', display: 'block' }}>
                    Adventure Type
                  </label>
                  <div style={{ display: 'flex', flexWrap: 'wrap', gap: '8px' }}>
                    {['Safari', 'Climbing', 'Cultural', 'Water Sports', 'Hiking', 'Beach', 'Historical'].map((type) => (
                      <button
                        key={type}
                        onClick={() => setFilters({...filters, adventureType: filters.adventureType === type ? '' : type})}
                        style={{
                          padding: '6px 12px',
                          border: '1px solid #e5e7eb',
                          borderRadius: '16px',
                          background: filters.adventureType === type ? '#3b82f6' : 'white',
                          color: filters.adventureType === type ? 'white' : '#6b7280',
                          cursor: 'pointer',
                          fontSize: '12px'
                        }}
                      >
                        {type}
                      </button>
                    ))}
                  </div>
                </div>

                {/* Group Size */}
                <div style={{ marginBottom: '20px' }}>
                  <label style={{ fontSize: '16px', fontWeight: '600', marginBottom: '8px', display: 'block' }}>
                    Group Size
                  </label>
                  <div style={{ display: 'flex', flexWrap: 'wrap', gap: '8px' }}>
                    {['Private', 'Small Group', 'Large Group', 'Custom'].map((size) => (
                      <button
                        key={size}
                        onClick={() => setFilters({...filters, groupSize: filters.groupSize === size ? '' : size})}
                        style={{
                          padding: '6px 12px',
                          border: '1px solid #e5e7eb',
                          borderRadius: '16px',
                          background: filters.groupSize === size ? '#3b82f6' : 'white',
                          color: filters.groupSize === size ? 'white' : '#6b7280',
                          cursor: 'pointer',
                          fontSize: '12px'
                        }}
                      >
                        {size}
                      </button>
                    ))}
                  </div>
                </div>

                {/* Duration */}
                <div style={{ marginBottom: '20px' }}>
                  <label style={{ fontSize: '16px', fontWeight: '600', marginBottom: '8px', display: 'block' }}>
                    Duration
                  </label>
                  <div style={{ display: 'flex', flexWrap: 'wrap', gap: '8px' }}>
                    {['Half Day', 'Full Day', '2-3 Days', '4-7 Days', '1+ Weeks'].map((duration) => (
                      <button
                        key={duration}
                        onClick={() => setFilters({...filters, duration: filters.duration === duration ? '' : duration})}
                        style={{
                          padding: '6px 12px',
                          border: '1px solid #e5e7eb',
                          borderRadius: '16px',
                          background: filters.duration === duration ? '#3b82f6' : 'white',
                          color: filters.duration === duration ? 'white' : '#6b7280',
                          cursor: 'pointer',
                          fontSize: '12px'
                        }}
                      >
                        {duration}
                      </button>
                    ))}
                  </div>
                </div>

                {/* Services */}
                <div style={{ marginBottom: '20px' }}>
                  <label style={{ fontSize: '16px', fontWeight: '600', marginBottom: '8px', display: 'block' }}>
                    Services Included
                  </label>
                  <div style={{ display: 'flex', flexWrap: 'wrap', gap: '8px' }}>
                    {['Accommodation', 'Meals', 'Transport', 'Guide', 'Equipment', 'Park Fees', 'Insurance'].map((service) => (
                      <button
                        key={service}
                        onClick={() => {
                          const newServices = filters.services.includes(service) 
                            ? filters.services.filter(s => s !== service)
                            : [...filters.services, service];
                          setFilters({...filters, services: newServices});
                        }}
                        style={{
                          padding: '6px 12px',
                          border: '1px solid #e5e7eb',
                          borderRadius: '16px',
                          background: filters.services.includes(service) ? '#3b82f6' : 'white',
                          color: filters.services.includes(service) ? 'white' : '#6b7280',
                          cursor: 'pointer',
                          fontSize: '12px'
                        }}
                      >
                        {service}
                      </button>
                    ))}
                  </div>
                </div>
              </>
            )}

            {/* Action Buttons */}
            <div style={{ display: 'flex', gap: '12px', marginTop: '24px' }}>
              <button
                onClick={resetFilters}
                style={{
                  flex: 1,
                  padding: '12px',
                  border: '1px solid #e5e7eb',
                  borderRadius: '8px',
                  background: 'white',
                  color: '#6b7280',
                  cursor: 'pointer',
                  fontSize: '14px',
                  fontWeight: '600'
                }}
              >
                Reset
              </button>
              <button
                onClick={applyFilters}
                style={{
                  flex: 1,
                  padding: '12px',
                  border: 'none',
                  borderRadius: '8px',
                  background: '#3b82f6',
                  color: 'white',
                  cursor: 'pointer',
                  fontSize: '14px',
                  fontWeight: '600'
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

export default Explore;