import { useState } from 'react';
import { useNavigate } from 'react-router-dom';
import { IoArrowBack, IoCar, IoCall, IoMail, IoGlobe, IoLocation } from 'react-icons/io5';
import MapPicker from '../components/MapPicker';

const CarRentalRegistration = ({ onMenuClick }: { onMenuClick?: () => void }) => {
  const navigate = useNavigate();
  const [formData, setFormData] = useState({
    businessName: '',
    vehicleTypes: [],
    address: '',
    city: '',
    state: '',
    postalCode: '',
    country: '',
    latitude: '',
    longitude: '',
    phone: '',
    email: '',
    website: '',
    description: '',
    services: [],
    priceRange: '',
    fleetSize: '',
    licenseNumber: '',
    images: []
  });

  const vehicleTypesList = ['Sedan', 'SUV', 'Luxury Vehicle', 'Van', 'Truck', 'Motorcycle', 'Bus', 'Limousine'];
  const servicesList = ['Pickup Service', 'Drop-off Service', 'Insurance', 'GPS Navigation', 'Child Seats', 'Airport Transfer', 'Long-term Rental', 'Chauffeur Service', 'Fuel Included', '24/7 Support'];



  const handleInputChange = (field: string, value: any) => {
    setFormData(prev => ({
      ...prev,
      [field]: value
    }));
  };

  const handleVehicleTypeToggle = (vehicleType: string) => {
    setFormData(prev => ({
      ...prev,
      vehicleTypes: prev.vehicleTypes.includes(vehicleType)
        ? prev.vehicleTypes.filter(v => v !== vehicleType)
        : [...prev.vehicleTypes, vehicleType]
    }));
  };

  const handleServiceToggle = (service: string) => {
    setFormData(prev => ({
      ...prev,
      services: prev.services.includes(service)
        ? prev.services.filter(s => s !== service)
        : [...prev.services, service]
    }));
  };

  const handleLocationSelect = (lat: number, lng: number, address: string) => {
    setFormData(prev => ({
      ...prev,
      latitude: lat.toString(),
      longitude: lng.toString(),
      address: address
    }));
  };

  const handleSubmit = (e: React.FormEvent) => {
    e.preventDefault();
    // Handle form submission
    alert('Car rental registration submitted successfully!');
    navigate('/profile');
  };

  return (
    <div style={{
      minHeight: '100vh',
      background: 'white',
      paddingBottom: '80px'
    }}>
      {/* Header */}
      <div style={{
        padding: '20px 16px',
        position: 'relative',
        background: 'white'
      }}>
        {/* Back Arrow */}
        <button
          onClick={() => navigate('/professional')}
          style={{
            position: 'absolute',
            top: '50%',
            left: '16px',
            transform: 'translateY(-50%)',
            background: '#f3f4f6',
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
          <IoArrowBack size={20} color="#6b7280" />
        </button>
        
        {/* Title */}
        <div style={{
          textAlign: 'center',
          color: '#1a1a1a'
        }}>
          <h1 style={{
            fontSize: '24px',
            fontWeight: '700',
            margin: '0 0 8px 0'
          }}>
            Car Rental Registration
          </h1>

        </div>
      </div>

      {/* Form */}
      <form onSubmit={handleSubmit} style={{
        padding: '24px 16px',
        background: 'white'
      }}>
        {/* Basic Information */}
        <div style={{ marginBottom: '32px' }}>
          <h2 style={{
            fontSize: '18px',
            fontWeight: '600',
            color: '#1a1a1a',
            marginBottom: '16px'
          }}>
            Basic Information
          </h2>
          
          <div style={{ marginBottom: '16px' }}>
            <label style={{
              display: 'block',
              fontSize: '14px',
              fontWeight: '500',
              color: '#374151',
              marginBottom: '8px'
            }}>
              Business Name *
            </label>
            <input
              type="text"
              value={formData.businessName}
              onChange={(e) => handleInputChange('businessName', e.target.value)}
              style={{
                width: '100%',
                padding: '12px',
                border: '1px solid #d1d5db',
                borderRadius: '8px',
                fontSize: '16px'
              }}
              placeholder="Enter your business name"
              required
            />
          </div>

          <div style={{ marginBottom: '16px' }}>
            <label style={{
              display: 'block',
              fontSize: '14px',
              fontWeight: '500',
              color: '#374151',
              marginBottom: '8px'
            }}>
              License Number *
            </label>
            <input
              type="text"
              value={formData.licenseNumber}
              onChange={(e) => handleInputChange('licenseNumber', e.target.value)}
              style={{
                width: '100%',
                padding: '12px',
                border: '1px solid #d1d5db',
                borderRadius: '8px',
                fontSize: '16px'
              }}
              placeholder="Enter business license number"
              required
            />
          </div>

          <MapPicker 
            onLocationSelect={handleLocationSelect}
            height="250px"
          />

          <div style={{ marginBottom: '16px' }}>
            <label style={{
              display: 'block',
              fontSize: '14px',
              fontWeight: '500',
              color: '#374151',
              marginBottom: '8px'
            }}>
              City *
            </label>
            <input
              type="text"
              value={formData.city}
              onChange={(e) => handleInputChange('city', e.target.value)}
              style={{
                width: '100%',
                padding: '12px',
                border: '1px solid #d1d5db',
                borderRadius: '8px',
                fontSize: '16px'
              }}
              placeholder="Enter city"
              required
            />
          </div>

          <div style={{ marginBottom: '16px' }}>
            <label style={{
              display: 'block',
              fontSize: '14px',
              fontWeight: '500',
              color: '#374151',
              marginBottom: '8px'
            }}>
              State/Province *
            </label>
            <input
              type="text"
              value={formData.state || ''}
              onChange={(e) => handleInputChange('state', e.target.value)}
              style={{
                width: '100%',
                padding: '12px',
                border: '1px solid #d1d5db',
                borderRadius: '8px',
                fontSize: '16px'
              }}
              placeholder="Enter state or province"
              required
            />
          </div>

          <div style={{ marginBottom: '16px' }}>
            <label style={{
              display: 'block',
              fontSize: '14px',
              fontWeight: '500',
              color: '#374151',
              marginBottom: '8px'
            }}>
              Country *
            </label>
            <input
              type="text"
              value={formData.country || ''}
              onChange={(e) => handleInputChange('country', e.target.value)}
              style={{
                width: '100%',
                padding: '12px',
                border: '1px solid #d1d5db',
                borderRadius: '8px',
                fontSize: '16px'
              }}
              placeholder="Enter country"
              required
            />
          </div>
        </div>

        {/* Contact Information */}
        <div style={{ marginBottom: '32px' }}>
          <h2 style={{
            fontSize: '18px',
            fontWeight: '600',
            color: '#1a1a1a',
            marginBottom: '16px'
          }}>
            Contact Information
          </h2>
          
          <div style={{ marginBottom: '16px' }}>
            <label style={{
              display: 'block',
              fontSize: '14px',
              fontWeight: '500',
              color: '#374151',
              marginBottom: '8px'
            }}>
              Phone Number *
            </label>
            <input
              type="tel"
              value={formData.phone}
              onChange={(e) => handleInputChange('phone', e.target.value)}
              style={{
                width: '100%',
                padding: '12px',
                border: '1px solid #d1d5db',
                borderRadius: '8px',
                fontSize: '16px'
              }}
              placeholder="Enter phone number"
              required
            />
          </div>

          <div style={{ marginBottom: '16px' }}>
            <label style={{
              display: 'block',
              fontSize: '14px',
              fontWeight: '500',
              color: '#374151',
              marginBottom: '8px'
            }}>
              Email *
            </label>
            <input
              type="email"
              value={formData.email}
              onChange={(e) => handleInputChange('email', e.target.value)}
              style={{
                width: '100%',
                padding: '12px',
                border: '1px solid #d1d5db',
                borderRadius: '8px',
                fontSize: '16px'
              }}
              placeholder="Enter email address"
              required
            />
          </div>

          <div style={{ marginBottom: '16px' }}>
            <label style={{
              display: 'block',
              fontSize: '14px',
              fontWeight: '500',
              color: '#374151',
              marginBottom: '8px'
            }}>
              Website
            </label>
            <input
              type="url"
              value={formData.website}
              onChange={(e) => handleInputChange('website', e.target.value)}
              style={{
                width: '100%',
                padding: '12px',
                border: '1px solid #d1d5db',
                borderRadius: '8px',
                fontSize: '16px'
              }}
              placeholder="Enter website URL (optional)"
            />
          </div>
        </div>

        {/* Business Details */}
        <div style={{ marginBottom: '32px' }}>
          <h2 style={{
            fontSize: '18px',
            fontWeight: '600',
            color: '#1a1a1a',
            marginBottom: '16px'
          }}>
            Business Details
          </h2>
          
          <div style={{ marginBottom: '16px' }}>
            <label style={{
              display: 'block',
              fontSize: '14px',
              fontWeight: '500',
              color: '#374151',
              marginBottom: '8px'
            }}>
              Description *
            </label>
            <textarea
              value={formData.description}
              onChange={(e) => handleInputChange('description', e.target.value)}
              style={{
                width: '100%',
                padding: '12px',
                border: '1px solid #d1d5db',
                borderRadius: '8px',
                fontSize: '16px',
                minHeight: '100px',
                resize: 'vertical'
              }}
              placeholder="Describe your car rental services..."
              required
            />
          </div>




        </div>

        {/* Vehicle Types */}
        <div style={{ marginBottom: '32px' }}>
          <h2 style={{
            fontSize: '18px',
            fontWeight: '600',
            color: '#1a1a1a',
            marginBottom: '16px'
          }}>
            Vehicle Types Available
          </h2>
          
          <div style={{
            display: 'grid',
            gridTemplateColumns: 'repeat(2, 1fr)',
            gap: '12px'
          }}>
            {vehicleTypesList.map(vehicleType => (
              <label key={vehicleType} style={{
                display: 'flex',
                alignItems: 'center',
                gap: '8px',
                cursor: 'pointer'
              }}>
                <input
                  type="checkbox"
                  checked={formData.vehicleTypes.includes(vehicleType)}
                  onChange={() => handleVehicleTypeToggle(vehicleType)}
                  style={{ width: '16px', height: '16px' }}
                />
                <span style={{ fontSize: '14px', color: '#374151' }}>{vehicleType}</span>
              </label>
            ))}
          </div>
        </div>

        {/* Services */}
        <div style={{ marginBottom: '32px' }}>
          <h2 style={{
            fontSize: '18px',
            fontWeight: '600',
            color: '#1a1a1a',
            marginBottom: '16px'
          }}>
            Services Offered
          </h2>
          
          <div style={{
            display: 'grid',
            gridTemplateColumns: 'repeat(2, 1fr)',
            gap: '12px'
          }}>
            {servicesList.map(service => (
              <label key={service} style={{
                display: 'flex',
                alignItems: 'center',
                gap: '8px',
                cursor: 'pointer'
              }}>
                <input
                  type="checkbox"
                  checked={formData.services.includes(service)}
                  onChange={() => handleServiceToggle(service)}
                  style={{ width: '16px', height: '16px' }}
                />
                <span style={{ fontSize: '14px', color: '#374151' }}>{service}</span>
              </label>
            ))}
          </div>
        </div>

        {/* Submit Button */}
        <button
          type="submit"
          style={{
            width: '200px',
            padding: '16px',
            background: 'linear-gradient(135deg, #3b82f6, #1d4ed8)',
            color: 'white',
            border: 'none',
            borderRadius: '12px',
            fontSize: '16px',
            fontWeight: '600',
            cursor: 'pointer',
            transition: 'all 0.2s ease',
            margin: '24px auto 0',
            display: 'block'
          }}
          onMouseEnter={(e) => e.currentTarget.style.transform = 'scale(1.02)'}
          onMouseLeave={(e) => e.currentTarget.style.transform = 'scale(1)'}
        >
          Register
        </button>
      </form>
    </div>
  );
};

export default CarRentalRegistration; 