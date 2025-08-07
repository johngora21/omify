import { useState } from 'react';
import { useNavigate } from 'react-router-dom';
import { IoArrowBack, IoHeart, IoBed, IoLocation, IoCar } from 'react-icons/io5';

const Professional = ({ onMenuClick }: { onMenuClick?: () => void }) => {
  const navigate = useNavigate();
  const [selectedService, setSelectedService] = useState('');

  const serviceTypes = [
    {
      id: 'accommodation',
      title: 'Accommodation',
      icon: <IoBed size={32} />,
      description: 'Hotels, BnBs, vacation rentals',
      color: '#3b82f6'
    },
    {
      id: 'adventure',
      title: 'Adventures & Safaris',
      icon: <IoLocation size={32} />,
      description: 'Tours, safaris, travel experiences',
      color: '#10b981'
    },
    {
      id: 'car-rental',
      title: 'Car Rental',
      icon: <IoCar size={32} />,
      description: 'Vehicle rentals and transport',
      color: '#f59e0b'
    },
    {
      id: 'erotic',
      title: 'Erotic Services',
      icon: <IoHeart size={32} />,
      description: 'Wellness, massage, adult entertainment',
      color: '#ef4444'
    }
  ];

  const handleServiceSelect = (serviceId: string) => {
    setSelectedService(serviceId);
    // Navigate to the appropriate registration page based on service type
    switch (serviceId) {
      case 'erotic':
        navigate('/erotic-registration');
        break;
      case 'accommodation':
        navigate('/accommodation-registration');
        break;
      case 'adventure':
        navigate('/adventure-registration');
        break;
      case 'car-rental':
        navigate('/car-rental-registration');
        break;
      default:
        break;
    }
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
          onClick={() => onMenuClick ? onMenuClick() : navigate(-1)}
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
        

      </div>

      {/* Service Selection */}
      <div style={{
        padding: '24px 16px',
        background: 'white'
      }}>
        <h2 style={{
          fontSize: '20px',
          fontWeight: '600',
          color: '#1a1a1a',
          marginBottom: '20px',
          textAlign: 'center'
        }}>
          What type of service do you provide?
        </h2>
        
        <div style={{
          display: 'grid',
          gridTemplateColumns: 'repeat(2, 1fr)',
          gap: '16px'
        }}>
          {serviceTypes.map((service) => (
            <div
              key={service.id}
              onClick={() => handleServiceSelect(service.id)}
              style={{
                padding: '20px',
                border: selectedService === service.id ? `2px solid ${service.color}` : '2px solid #e5e7eb',
                borderRadius: '16px',
                cursor: 'pointer',
                background: selectedService === service.id ? `${service.color}10` : 'white',
                transition: 'all 0.2s ease',
                textAlign: 'center'
              }}
            >
              <div style={{
                display: 'flex',
                justifyContent: 'center',
                marginBottom: '12px'
              }}>
                <div style={{ color: service.color }}>
                  {service.icon}
                </div>
              </div>
              <div style={{
                fontSize: '16px',
                fontWeight: '600',
                color: '#1a1a1a',
                marginBottom: '8px'
              }}>
                {service.title}
              </div>
              <div style={{
                fontSize: '14px',
                color: '#6b7280',
                lineHeight: '1.4'
              }}>
                {service.description}
              </div>
            </div>
          ))}
        </div>
      </div>


    </div>
  );
};

export default Professional; 