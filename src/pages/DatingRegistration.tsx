import React, { useState } from 'react';
import { useNavigate } from 'react-router-dom';
import { IoArrowBack, IoPersonOutline, IoHeartOutline, IoCameraOutline, IoLocationOutline } from 'react-icons/io5';

const DatingRegistration = () => {
  const navigate = useNavigate();
  const [formData, setFormData] = useState({
    name: '',
    age: '',
    sex: '',
    location: '',
    about: '',
    whatSheNeeds: '',
    hobbies: [],
    services: [],
    languages: '',
    photos: [],
    phone: '',
    email: '',
    orientation: '',
    height: '',
    weight: ''
  });

  const handleInputChange = (e: React.ChangeEvent<HTMLInputElement | HTMLTextAreaElement | HTMLSelectElement>) => {
    setFormData({
      ...formData,
      [e.target.name]: e.target.value
    });
  };

  const handleSubmit = (e: React.FormEvent) => {
    e.preventDefault();
    console.log('Dating registration:', formData);
    navigate('/erotic');
  };

  const datingServices = [
    'Dating', 'Relationship', 'Companionship', 'Travel Partner', 'Dinner Date', 
    'Movie Night', 'Coffee Meet', 'Weekend Getaway', 'Long-term Relationship', 
    'Marriage', 'Family Planning', 'Shared Interests', 'Emotional Support', 
    'Life Partner', 'Soulmate'
  ];

  const hobbyOptions = [
    'Travel', 'Photography', 'Yoga', 'Cooking', 'Reading', 'Hiking', 'Art', 
    'Music', 'Painting', 'Dancing', 'Adventure', 'Fitness', 'Rock Climbing', 
    'Meditation', 'Swimming', 'Cycling', 'Gaming', 'Writing', 'Gardening'
  ];

  const handleServiceToggle = (service: string) => {
    setFormData(prev => ({
      ...prev,
      services: prev.services.includes(service)
        ? prev.services.filter(s => s !== service)
        : [...prev.services, service]
    }));
  };

  const handleHobbyToggle = (hobby: string) => {
    setFormData(prev => ({
      ...prev,
      hobbies: prev.hobbies.includes(hobby)
        ? prev.hobbies.filter(h => h !== hobby)
        : [...prev.hobbies, hobby]
    }));
  };

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
          onClick={() => navigate('/erotic-registration')}
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
          Dating Profile
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
                Sex *
              </label>
              <select
                name="sex"
                value={formData.sex}
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
                <option value="">Select Sex</option>
                <option value="Female">Female</option>
                <option value="Male">Male</option>
              </select>
            </div>
            
            <div>
              <label style={{ display: 'block', marginBottom: '8px', fontWeight: '500', color: '#374151' }}>
                Orientation *
              </label>
              <select
                name="orientation"
                value={formData.orientation}
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
                <option value="">Select Orientation</option>
                <option value="Straight">Straight</option>
                <option value="Lesbian">Lesbian</option>
                <option value="Bisexual">Bisexual</option>
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
            Location
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
              placeholder="e.g., New York, NY"
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
              Select Your Location on Map
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
                Click to select your location
              </p>
              <p style={{ color: '#9ca3af', margin: '0', fontSize: '14px' }}>
                Drag to move, scroll to zoom
              </p>
            </div>
          </div>
        </div>

        {/* About Me */}
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
            About Me
          </h3>
          
          <div style={{ marginBottom: '16px' }}>
            <label style={{ display: 'block', marginBottom: '8px', fontWeight: '500', color: '#374151' }}>
              About Me *
            </label>
            <textarea
              name="about"
              value={formData.about}
              onChange={handleInputChange}
              required
              placeholder="Tell us about yourself, your personality, interests, and what makes you unique..."
              rows={4}
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
              What I'm Looking For
            </label>
            <textarea
              name="whatSheNeeds"
              value={formData.whatSheNeeds}
              onChange={handleInputChange}
              placeholder="Describe what you're looking for in a partner or relationship..."
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

        {/* Dating Services */}
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
            <IoHeartOutline size={20} />
            Dating Services
          </h3>
          
          <div style={{
            display: 'grid',
            gridTemplateColumns: 'repeat(auto-fit, minmax(200px, 1fr))',
            gap: '12px'
          }}>
            {datingServices.map(service => (
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

        {/* Hobbies */}
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
            Hobbies & Interests
          </h3>
          
          <div style={{
            display: 'grid',
            gridTemplateColumns: 'repeat(auto-fit, minmax(150px, 1fr))',
            gap: '12px'
          }}>
            {hobbyOptions.map(hobby => (
              <label
                key={hobby}
                style={{
                  display: 'flex',
                  alignItems: 'center',
                  gap: '8px',
                  padding: '12px',
                  border: `2px solid ${formData.hobbies.includes(hobby) ? '#3b82f6' : '#e5e7eb'}`,
                  borderRadius: '8px',
                  background: formData.hobbies.includes(hobby) ? '#eff6ff' : 'white',
                  cursor: 'pointer',
                  fontSize: '14px'
                }}
              >
                <input
                  type="checkbox"
                  checked={formData.hobbies.includes(hobby)}
                  onChange={() => handleHobbyToggle(hobby)}
                  style={{ margin: '0' }}
                />
                {hobby}
              </label>
            ))}
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
              placeholder="e.g., English, Spanish, French"
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

        {/* Photos */}
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
            margin: '0 0 20px 0',
            display: 'flex',
            alignItems: 'center',
            gap: '8px'
          }}>
            <IoCameraOutline size={20} />
            Photos
          </h3>
          
          <div style={{
            border: '2px dashed #d1d5db',
            borderRadius: '12px',
            padding: '40px',
            textAlign: 'center',
            background: 'white'
          }}>
            <IoCameraOutline size={48} color="#9ca3af" style={{ marginBottom: '16px' }} />
            <p style={{ color: '#6b7280', margin: '0 0 16px 0' }}>
              Upload at least 3 photos of yourself
            </p>
            <button
              type="button"
              style={{
                background: '#3b82f6',
                color: 'white',
                border: 'none',
                borderRadius: '8px',
                padding: '12px 24px',
                fontSize: '16px',
                fontWeight: '500',
                cursor: 'pointer'
              }}
            >
              Upload Photos
            </button>
          </div>
        </div>

        {/* Submit Button */}
        <button
          type="submit"
          style={{
            width: '100%',
            background: 'linear-gradient(135deg, #10b981 0%, #059669 100%)',
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
          Create Dating Profile
        </button>
      </form>
    </div>
  );
};

export default DatingRegistration; 