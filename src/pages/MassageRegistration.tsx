import React, { useState } from 'react';
import { useNavigate } from 'react-router-dom';
import { IoArrowBack, IoPersonOutline, IoHandLeftOutline, IoBusinessOutline, IoLocationOutline } from 'react-icons/io5';

const MassageRegistration = () => {
  const navigate = useNavigate();
  const [formData, setFormData] = useState({
    name: '',
    age: '',
    gender: '',
    location: '',
    phone: '',
    email: '',
    experience: '',
    qualifications: '',
    services: [],
    rates: '',
    availability: '',
    description: '',
    photos: [],
    height: '',
    weight: '',
    languages: '',
    orientation: '',
    incall: false,
    outcall: false
  });

  const handleInputChange = (e: React.ChangeEvent<HTMLInputElement | HTMLTextAreaElement | HTMLSelectElement>) => {
    setFormData({
      ...formData,
      [e.target.name]: e.target.value
    });
  };

  const handleServiceToggle = (service: string) => {
    setFormData(prev => ({
      ...prev,
      services: prev.services.includes(service)
        ? prev.services.filter(s => s !== service)
        : [...prev.services, service]
    }));
  };

  const handleSubmit = (e: React.FormEvent) => {
    e.preventDefault();
    console.log('Massage registration:', formData);
    navigate('/erotic');
  };

  const massageServices = [
    'Body to Body Massage', 'Scrub Massage', 'Waxing Services', 'Nuru Massage', 
    'Tantra Massage', 'Happy Ending Massage', 'Four Hands Massage', 'Sensual Massage', 
    'Erotic Massage', 'Couples Massage', 'Prostate Massage', 'Breast Massage', 
    'Foot Fetish Massage', 'BDSM Massage', 'Roleplay Massage'
  ];

  return (
    <div style={{
      minHeight: '100vh',
      background: 'white',
      padding: '20px'
    }}>
      {/* Header */}
      <div style={{
        display: 'flex',
        alignItems: 'center',
        marginBottom: '32px',
        position: 'relative'
      }}>
        <button
          onClick={() => navigate('/professional')}
          style={{
            background: 'rgba(0, 0, 0, 0.1)',
            border: 'none',
            borderRadius: '50%',
            width: '40px',
            height: '40px',
            display: 'flex',
            alignItems: 'center',
            justifyContent: 'center',
            cursor: 'pointer',
            marginRight: '16px'
          }}
        >
          <IoArrowBack size={20} color="#1a1a1a" />
        </button>
        <h1 style={{
          fontSize: '24px',
          fontWeight: '700',
          color: '#1a1a1a',
          margin: '0',
          flex: '1',
          textAlign: 'center'
        }}>
          Massage Therapist Profile
        </h1>
      </div>

      <form onSubmit={handleSubmit} style={{ maxWidth: '600px', margin: '0 auto' }}>
        {/* Personal Information */}
        <div style={{
          background: '#f8fafc',
          borderRadius: '16px',
          padding: '24px',
          marginBottom: '24px'
        }}>
          <h3 style={{
            fontSize: '18px',
            fontWeight: '600',
            color: '#1a1a1a',
            margin: '0 0 20px 0',
            display: 'flex',
            alignItems: 'center',
            gap: '8px'
          }}>
            <IoPersonOutline size={20} />
            Personal Information
          </h3>
          
          <div style={{ display: 'grid', gridTemplateColumns: '1fr 1fr', gap: '16px', marginBottom: '16px' }}>
            <div>
              <label style={{ display: 'block', marginBottom: '8px', fontWeight: '500', color: '#374151' }}>
                Full Name *
              </label>
              <input
                type="text"
                name="name"
                value={formData.name}
                onChange={handleInputChange}
                required
                style={{
                  width: '100%',
                  padding: '12px',
                  border: '1px solid #d1d5db',
                  borderRadius: '8px',
                  fontSize: '16px'
                }}
              />
            </div>
            
            <div>
              <label style={{ display: 'block', marginBottom: '8px', fontWeight: '500', color: '#374151' }}>
                Age *
              </label>
              <input
                type="number"
                name="age"
                value={formData.age}
                onChange={handleInputChange}
                required
                min="18"
                max="100"
                style={{
                  width: '100%',
                  padding: '12px',
                  border: '1px solid #d1d5db',
                  borderRadius: '8px',
                  fontSize: '16px'
                }}
              />
            </div>
          </div>

          <div style={{ display: 'grid', gridTemplateColumns: '1fr 1fr', gap: '16px', marginBottom: '16px' }}>
            <div>
              <label style={{ display: 'block', marginBottom: '8px', fontWeight: '500', color: '#374151' }}>
                Gender *
              </label>
              <select
                name="gender"
                value={formData.gender}
                onChange={handleInputChange}
                required
                style={{
                  width: '100%',
                  padding: '12px',
                  border: '1px solid #d1d5db',
                  borderRadius: '8px',
                  fontSize: '16px'
                }}
              >
                <option value="">Select Gender</option>
                <option value="Female">Female</option>
                <option value="Male">Male</option>
              </select>
            </div>
            

          </div>

          <div style={{ display: 'grid', gridTemplateColumns: '1fr 1fr', gap: '16px', marginBottom: '16px' }}>
            <div>
              <label style={{ display: 'block', marginBottom: '8px', fontWeight: '500', color: '#374151' }}>
                Height
              </label>
              <input
                type="text"
                name="height"
                value={formData.height}
                onChange={handleInputChange}
                placeholder="e.g., 5'6&quot;"
                style={{
                  width: '100%',
                  padding: '12px',
                  border: '1px solid #d1d5db',
                  borderRadius: '8px',
                  fontSize: '16px'
                }}
              />
            </div>
            
            <div>
              <label style={{ display: 'block', marginBottom: '8px', fontWeight: '500', color: '#374151' }}>
                Weight
              </label>
              <input
                type="text"
                name="weight"
                value={formData.weight}
                onChange={handleInputChange}
                placeholder="e.g., 130 lbs"
                style={{
                  width: '100%',
                  padding: '12px',
                  border: '1px solid #d1d5db',
                  borderRadius: '8px',
                  fontSize: '16px'
                }}
              />
            </div>
          </div>

          <div style={{ display: 'grid', gridTemplateColumns: '1fr 1fr', gap: '16px', marginBottom: '16px' }}>
            <div>
              <label style={{ display: 'block', marginBottom: '8px', fontWeight: '500', color: '#374151' }}>
                Phone Number *
              </label>
              <input
                type="tel"
                name="phone"
                value={formData.phone}
                onChange={handleInputChange}
                required
                style={{
                  width: '100%',
                  padding: '12px',
                  border: '1px solid #d1d5db',
                  borderRadius: '8px',
                  fontSize: '16px'
                }}
              />
            </div>
            
            <div>
              <label style={{ display: 'block', marginBottom: '8px', fontWeight: '500', color: '#374151' }}>
                Email *
              </label>
              <input
                type="email"
                name="email"
                value={formData.email}
                onChange={handleInputChange}
                required
                style={{
                  width: '100%',
                  padding: '12px',
                  border: '1px solid #d1d5db',
                  borderRadius: '8px',
                  fontSize: '16px'
                }}
              />
            </div>
          </div>
        </div>

        {/* Location */}
        <div style={{
          background: '#f8fafc',
          borderRadius: '16px',
          padding: '24px',
          marginBottom: '24px'
        }}>
          <h3 style={{
            fontSize: '18px',
            fontWeight: '600',
            color: '#1a1a1a',
            margin: '0 0 20px 0',
            display: 'flex',
            alignItems: 'center',
            gap: '8px'
          }}>
            <IoLocationOutline size={20} />
            Service Location
          </h3>
          
          <div style={{ marginBottom: '16px' }}>
            <label style={{ display: 'block', marginBottom: '8px', fontWeight: '500', color: '#374151' }}>
              City/Location *
            </label>
            <input
              type="text"
              name="location"
              value={formData.location}
              onChange={handleInputChange}
              required
              placeholder="e.g., Downtown Spa, Uptown Wellness"
              style={{
                width: '100%',
                padding: '12px',
                border: '1px solid #d1d5db',
                borderRadius: '8px',
                fontSize: '16px'
              }}
            />
          </div>

          {/* Map Selection */}
          <div>
            <label style={{ display: 'block', marginBottom: '8px', fontWeight: '500', color: '#374151' }}>
              Select Service Area on Map
            </label>
            <div style={{
              width: '100%',
              height: '300px',
              border: '2px dashed #d1d5db',
              borderRadius: '12px',
              background: '#f9fafb',
              display: 'flex',
              alignItems: 'center',
              justifyContent: 'center',
              flexDirection: 'column',
              cursor: 'pointer',
              transition: 'all 0.2s ease'
            }}
            onClick={() => {
              // Open OpenStreetMap modal for location selection
              alert('OpenStreetMap selection feature will be implemented here');
            }}
            >
              <IoLocationOutline size={48} color="#9ca3af" style={{ marginBottom: '16px' }} />
              <p style={{ color: '#6b7280', margin: '0 0 8px 0', fontSize: '16px' }}>
                Click to select your service area
              </p>
              <p style={{ color: '#9ca3af', margin: '0', fontSize: '14px' }}>
                Drag to move, scroll to zoom
              </p>
            </div>
          </div>
        </div>

        {/* Professional Information */}
        <div style={{
          background: '#f8fafc',
          borderRadius: '16px',
          padding: '24px',
          marginBottom: '24px'
        }}>
          <h3 style={{
            fontSize: '18px',
            fontWeight: '600',
            color: '#1a1a1a',
            margin: '0 0 20px 0',
            display: 'flex',
            alignItems: 'center',
            gap: '8px'
          }}>
            <IoBusinessOutline size={20} />
            Professional Information
          </h3>
          
          <div style={{ marginBottom: '16px' }}>
            <label style={{ display: 'block', marginBottom: '8px', fontWeight: '500', color: '#374151' }}>
              Years of Experience *
            </label>
            <select
              name="experience"
              value={formData.experience}
              onChange={handleInputChange}
              required
              style={{
                width: '100%',
                padding: '12px',
                border: '1px solid #d1d5db',
                borderRadius: '8px',
                fontSize: '16px'
              }}
            >
              <option value="">Select Experience</option>
              <option value="0-1">0-1 years</option>
              <option value="1-3">1-3 years</option>
              <option value="3-5">3-5 years</option>
              <option value="5-10">5-10 years</option>
              <option value="10+">10+ years</option>
            </select>
          </div>

          <div style={{ marginBottom: '16px' }}>
            <label style={{ display: 'block', marginBottom: '8px', fontWeight: '500', color: '#374151' }}>
              Qualifications & Certifications
            </label>
            <textarea
              name="qualifications"
              value={formData.qualifications}
              onChange={handleInputChange}
              placeholder="List your massage therapy certifications, training, and qualifications..."
              rows={3}
              style={{
                width: '100%',
                padding: '12px',
                border: '1px solid #d1d5db',
                borderRadius: '8px',
                fontSize: '16px',
                resize: 'vertical'
              }}
            />
          </div>

          <div>
            <label style={{ display: 'block', marginBottom: '8px', fontWeight: '500', color: '#374151' }}>
              Hourly Rate (Tsh) *
            </label>
            <input
              type="number"
              name="rates"
              value={formData.rates}
              onChange={handleInputChange}
              required
              placeholder="e.g., 30000"
              style={{
                width: '100%',
                padding: '12px',
                border: '1px solid #d1d5db',
                borderRadius: '8px',
                fontSize: '16px'
              }}
            />
          </div>
        </div>

        {/* Services Offered */}
        <div style={{
          background: '#f8fafc',
          borderRadius: '16px',
          padding: '24px',
          marginBottom: '24px'
        }}>
          <h3 style={{
            fontSize: '18px',
            fontWeight: '600',
            color: '#1a1a1a',
            margin: '0 0 20px 0',
            display: 'flex',
            alignItems: 'center',
            gap: '8px'
          }}>
            <IoHandLeftOutline size={20} />
            Massage Services
          </h3>
          
          <div style={{
            display: 'grid',
            gridTemplateColumns: 'repeat(auto-fit, minmax(200px, 1fr))',
            gap: '12px'
          }}>
            {massageServices.map(service => (
              <label
                key={service}
                style={{
                  display: 'flex',
                  alignItems: 'center',
                  gap: '8px',
                  padding: '12px',
                  border: `2px solid ${formData.services.includes(service) ? '#3b82f6' : '#e5e7eb'}`,
                  borderRadius: '8px',
                  background: formData.services.includes(service) ? '#eff6ff' : 'white',
                  cursor: 'pointer',
                  fontSize: '14px'
                }}
              >
                <input
                  type="checkbox"
                  checked={formData.services.includes(service)}
                  onChange={() => handleServiceToggle(service)}
                  style={{ margin: '0' }}
                />
                {service}
              </label>
            ))}
          </div>
        </div>

        {/* Service Options */}
        <div style={{
          background: '#f8fafc',
          borderRadius: '16px',
          padding: '24px',
          marginBottom: '24px'
        }}>
          <h3 style={{
            fontSize: '18px',
            fontWeight: '600',
            color: '#1a1a1a',
            margin: '0 0 20px 0'
          }}>
            Service Options
          </h3>
          
          <div style={{
            display: 'flex',
            gap: '16px',
            marginBottom: '16px'
          }}>
            <label style={{
              display: 'flex',
              alignItems: 'center',
              gap: '8px',
              cursor: 'pointer'
            }}>
              <input
                type="checkbox"
                checked={formData.incall}
                onChange={(e) => setFormData({...formData, incall: e.target.checked})}
              />
              <span>Incall Available</span>
            </label>
            
            <label style={{
              display: 'flex',
              alignItems: 'center',
              gap: '8px',
              cursor: 'pointer'
            }}>
              <input
                type="checkbox"
                checked={formData.outcall}
                onChange={(e) => setFormData({...formData, outcall: e.target.checked})}
              />
              <span>Outcall Available</span>
            </label>
          </div>
        </div>

        {/* Availability */}
        <div style={{
          background: '#f8fafc',
          borderRadius: '16px',
          padding: '24px',
          marginBottom: '24px'
        }}>
          <h3 style={{
            fontSize: '18px',
            fontWeight: '600',
            color: '#1a1a1a',
            margin: '0 0 20px 0'
          }}>
            Availability
          </h3>
          
          <div>
            <label style={{ display: 'block', marginBottom: '8px', fontWeight: '500', color: '#374151' }}>
              Working Hours & Availability
            </label>
            <textarea
              name="availability"
              value={formData.availability}
              onChange={handleInputChange}
              placeholder="Describe your availability, working hours, advance booking requirements..."
              rows={3}
              style={{
                width: '100%',
                padding: '12px',
                border: '1px solid #d1d5db',
                borderRadius: '8px',
                fontSize: '16px',
                resize: 'vertical'
              }}
            />
          </div>
        </div>

        {/* Description */}
        <div style={{
          background: '#f8fafc',
          borderRadius: '16px',
          padding: '24px',
          marginBottom: '24px'
        }}>
          <h3 style={{
            fontSize: '18px',
            fontWeight: '600',
            color: '#1a1a1a',
            margin: '0 0 20px 0'
          }}>
            Service Description
          </h3>
          
          <div>
            <label style={{ display: 'block', marginBottom: '8px', fontWeight: '500', color: '#374151' }}>
              Professional Description *
            </label>
            <textarea
              name="description"
              value={formData.description}
              onChange={handleInputChange}
              required
              placeholder="Describe your massage style, approach, what clients can expect, and any special techniques you offer..."
              rows={5}
              style={{
                width: '100%',
                padding: '12px',
                border: '1px solid #d1d5db',
                borderRadius: '8px',
                fontSize: '16px',
                resize: 'vertical'
              }}
            />
          </div>
        </div>

        {/* Languages */}
        <div style={{
          background: '#f8fafc',
          borderRadius: '16px',
          padding: '24px',
          marginBottom: '32px'
        }}>
          <h3 style={{
            fontSize: '18px',
            fontWeight: '600',
            color: '#1a1a1a',
            margin: '0 0 20px 0'
          }}>
            Languages
          </h3>
          
          <div>
            <label style={{ display: 'block', marginBottom: '8px', fontWeight: '500', color: '#374151' }}>
              Languages Spoken
            </label>
            <input
              type="text"
              name="languages"
              value={formData.languages}
              onChange={handleInputChange}
              placeholder="e.g., English, Spanish, Mandarin"
              style={{
                width: '100%',
                padding: '12px',
                border: '1px solid #d1d5db',
                borderRadius: '8px',
                fontSize: '16px'
              }}
            />
          </div>
        </div>

        {/* Submit Button */}
        <button
          type="submit"
          style={{
            width: '100%',
            background: 'linear-gradient(135deg, #3b82f6, #1d4ed8)',
            color: 'white',
            border: 'none',
            borderRadius: '12px',
            padding: '16px',
            fontSize: '18px',
            fontWeight: '600',
            cursor: 'pointer',
            marginBottom: '32px'
          }}
        >
          Create Massage Profile
        </button>
      </form>
    </div>
  );
};

export default MassageRegistration; 