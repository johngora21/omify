import { useState } from 'react';
import { useNavigate } from 'react-router-dom';
import { IoSearchOutline, IoLocation, IoClose } from 'react-icons/io5';
import { FaHeart, FaRegHeart, FaRegBookmark, FaStar } from 'react-icons/fa';
import { BiSpa } from 'react-icons/bi';
import { MdVerified, MdDiamond } from 'react-icons/md';
import { Link } from 'react-router-dom';

const Erotic = () => {
  const navigate = useNavigate();
  const [activeTab, setActiveTab] = useState('match');
  const [searchQuery, setSearchQuery] = useState('');
  const [savedProviders, setSavedProviders] = useState(new Set<string>());
  const [bookedProviders, setBookedProviders] = useState(new Set<string>());
  const [acceptedBookings, setAcceptedBookings] = useState(new Set<string>());
  const [showMapModal, setShowMapModal] = useState(false);
  const [showFilterModal, setShowFilterModal] = useState(false);
  const [filters, setFilters] = useState({
    priceRange: [0, 1000],
    distance: 10,
    ageRange: [18, 60],
    services: [] as string[],
    orientation: [] as string[],
    rating: 0,
    onlineOnly: false,
    verifiedOnly: false
  });

  const wellnessProviders = [
    {
      id: '1',
      name: 'Emma Thompson',
      avatar: 'https://images.unsplash.com/photo-1517841905240-472988babdf9?w=400&h=300&fit=crop&crop=face',
      rating: 4.8,
      reviews: 127,
      price: '30,000',
      priceType: 'hour',
      location: 'Downtown Spa',
      distance: '0.5km',
      services: ['Body to Body Massage', 'Scrub Massage', 'Waxing Services', 'Nuru Massage', 'Tantra Massage', 'Happy Ending Massage', 'Four Hands Massage', 'Sensual Massage', 'Erotic Massage', 'Couples Massage', 'Prostate Massage', 'Breast Massage', 'Foot Fetish Massage', 'BDSM Massage', 'Roleplay Massage'],
      orientation: 'Straight',
      age: 28,
      height: '5\'6"',
      weight: '130 lbs',
      languages: ['English', 'Spanish'],
      verified: true,
      online: true,
      coordinates: { lat: 40.7128, lng: -74.0060 },
      description: 'Professional massage therapist with 5+ years experience. Specializing in therapeutic and relaxation massages.',
      availability: 'Mon-Sun 9AM-9PM',
      incall: true,
      outcall: true
    },
    {
      id: '2',
      name: 'Sophia Chen',
      avatar: 'https://images.unsplash.com/photo-1494790108755-2616b612b786?w=400&h=300&fit=crop&crop=face',
      rating: 4.9,
      reviews: 89,
      price: '35,000',
      priceType: 'hour',
      location: 'Uptown Wellness',
      distance: '1.2km',
      services: ['Body to Body Massage', 'Scrub Massage', 'Waxing Services', 'Nuru Massage', 'Tantra Massage', 'Happy Ending Massage', 'Four Hands Massage', 'Sensual Massage', 'Erotic Massage', 'Couples Massage', 'Prostate Massage', 'Breast Massage', 'Foot Fetish Massage', 'BDSM Massage', 'Roleplay Massage'],
      orientation: 'Bisexual',
      age: 25,
      height: '5\'4"',
      weight: '125 lbs',
      languages: ['English', 'Mandarin'],
      verified: true,
      online: false,
      coordinates: { lat: 40.7589, lng: -73.9851 },
      description: 'Certified massage therapist offering traditional Thai and modern therapeutic techniques.',
      availability: 'Mon-Sat 10AM-8PM',
      incall: true,
      outcall: false
    },
    {
      id: '3',
      name: 'Mia Rodriguez',
      avatar: 'https://images.unsplash.com/photo-1524504388940-b1c1722653e1?w=400&h=300&fit=crop&crop=face',
      rating: 4.7,
      reviews: 203,
      price: '25,000',
      priceType: 'hour',
      location: 'Mobile Service',
      distance: '2.1km',
      services: ['Body to Body Massage', 'Scrub Massage', 'Waxing Services', 'Nuru Massage', 'Tantra Massage', 'Happy Ending Massage', 'Four Hands Massage', 'Sensual Massage', 'Erotic Massage', 'Couples Massage', 'Prostate Massage', 'Breast Massage', 'Foot Fetish Massage', 'BDSM Massage', 'Roleplay Massage'],
      orientation: 'Lesbian',
      age: 30,
      height: '5\'7"',
      weight: '135 lbs',
      languages: ['English', 'Portuguese'],
      verified: true,
      online: true,
      coordinates: { lat: 40.7505, lng: -73.9934 },
      description: 'Mobile massage therapist bringing relaxation to your home. Certified with 5+ years experience.',
      availability: 'Mon-Sun 8AM-10PM',
      incall: false,
      outcall: true
    }
  ];

  const escortProviders = [
    {
      id: '4',
      name: 'Luna Black',
      avatar: 'https://images.unsplash.com/photo-1539571696357-5a69c17a67c6?w=400&h=300&fit=crop&crop=face',
      rating: 4.9,
      reviews: 156,
      price: '50,000',
      priceType: 'round',
      location: 'Luxury Hotel',
      distance: '0.8km',
      services: ['Normal Sex', 'Blowjob', 'Anal Sex', 'Anal Fingering', 'Anal Toys', 'Rimming', 'Prostate Massage', 'Threesomes', 'Group Sex', 'Pegging', 'Double Penetration', 'Fisting', 'Roleplay', 'Nipple Play', 'Submission', 'Handjob', 'Fingering', 'Mutual Masturbation', 'Massage with Happy Ending', 'Girlfriend Experience', 'Strap-on Play', 'Couple'],
      orientation: 'Straight',
      age: 26,
      height: '5\'8"',
      weight: '120 lbs',
      languages: ['English', 'French'],
      verified: true,
      online: true,
      coordinates: { lat: 40.7589, lng: -73.9851 },
      description: 'High-class escort offering discreet and professional companionship services.',
      availability: 'Mon-Sun 24/7',
      incall: true,
      outcall: true
    },
    {
      id: '5',
      name: 'Isabella Johnson',
      avatar: 'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?w=400&h=300&fit=crop&crop=face',
      rating: 4.8,
      reviews: 234,
      price: '40,000',
      priceType: 'round',
      location: 'Private Residence',
      distance: '1.5km',
      services: ['Normal Sex', 'Blowjob', 'Anal Sex', 'Anal Fingering', 'Anal Toys', 'Rimming', 'Prostate Massage', 'Threesomes', 'Group Sex', 'Pegging', 'Double Penetration', 'Fisting', 'Roleplay', 'Nipple Play', 'Submission', 'Handjob', 'Fingering', 'Mutual Masturbation', 'Massage with Happy Ending', 'Girlfriend Experience', 'Strap-on Play', 'Couple'],
      orientation: 'Bisexual',
      age: 29,
      height: '5\'5"',
      weight: '130 lbs',
      languages: ['English', 'Spanish'],
      verified: true,
      online: false,
      coordinates: { lat: 40.7505, lng: -73.9934 },
      description: 'Experienced escort specializing in intimate services and fantasy fulfillment.',
      availability: 'Mon-Sat 6PM-2AM',
      incall: true,
      outcall: true
    },
    {
      id: '6',
      name: 'Aria Martinez',
      avatar: 'https://images.unsplash.com/photo-1544005313-94ddf0286df2?w=400&h=300&fit=crop&crop=face',
      rating: 4.7,
      reviews: 189,
      price: '35,000',
      priceType: 'round',
      location: 'Downtown Area',
      distance: '0.3km',
      services: ['Normal Sex', 'Blowjob', 'Anal Sex', 'Anal Fingering', 'Anal Toys', 'Rimming', 'Prostate Massage', 'Threesomes', 'Group Sex', 'Pegging', 'Double Penetration', 'Fisting', 'Roleplay', 'Nipple Play', 'Submission', 'Handjob', 'Fingering', 'Mutual Masturbation', 'Massage with Happy Ending', 'Girlfriend Experience', 'Strap-on Play', 'Couple'],
      orientation: 'Straight',
      age: 24,
      height: '5\'6"',
      weight: '125 lbs',
      languages: ['English', 'Italian'],
      verified: true,
      online: true,
      coordinates: { lat: 40.7128, lng: -74.0060 },
      description: 'Young and energetic escort offering girlfriend experience and companionship.',
      availability: 'Mon-Sun 10AM-12AM',
      incall: true,
      outcall: true
    }
  ];

  const matchProfiles = [
    {
      id: '7',
      name: 'Sarah Wilson',
      avatar: 'https://images.unsplash.com/photo-1494790108755-2616b612b786?w=400&h=300&fit=crop&crop=face',
      rating: 4.8,
      reviews: 45,
      price: 'Free',
      priceType: 'dating',
      location: 'New York, NY',
      distance: '2.3km',
      services: ['Dating', 'Relationship', 'Companionship', 'Travel Partner', 'Dinner Date', 'Movie Night', 'Coffee Meet', 'Weekend Getaway', 'Long-term Relationship', 'Marriage', 'Family Planning', 'Shared Interests', 'Emotional Support', 'Life Partner', 'Soulmate'],
      orientation: 'Straight',
      age: 27,
      sex: 'Female',
      height: '5\'6"',
      weight: '130 lbs',
      languages: ['English', 'Spanish'],
      verified: true,
      online: true,
      coordinates: { lat: 40.7128, lng: -74.0060 },
      about: 'Love exploring new places and meeting interesting people. Looking for meaningful connections.',
      whatSheNeeds: 'Seeking a genuine, caring partner who values communication and shared experiences.',
      hobbies: ['Travel', 'Photography', 'Yoga', 'Cooking', 'Reading', 'Hiking'],
      availability: 'Mon-Sun 6PM-10PM',
      incall: false,
      outcall: true
    },
    {
      id: '8',
      name: 'Jessica Brown',
      avatar: 'https://images.unsplash.com/photo-1524504388940-b1c1722653e1?w=400&h=300&fit=crop&crop=face',
      rating: 4.9,
      reviews: 32,
      price: 'Free',
      priceType: 'dating',
      location: 'Brooklyn, NY',
      distance: '1.8km',
      services: ['Dating', 'Relationship', 'Companionship', 'Travel Partner', 'Dinner Date', 'Movie Night', 'Coffee Meet', 'Weekend Getaway', 'Long-term Relationship', 'Marriage', 'Family Planning', 'Shared Interests', 'Emotional Support', 'Life Partner', 'Soulmate'],
      orientation: 'Bisexual',
      age: 25,
      sex: 'Female',
      height: '5\'4"',
      weight: '125 lbs',
      languages: ['English', 'French'],
      verified: true,
      online: false,
      coordinates: { lat: 40.7589, lng: -73.9851 },
      about: 'Passionate about art and music. Seeking someone to share adventures with.',
      whatSheNeeds: 'Looking for someone who appreciates creativity and has a sense of adventure.',
      hobbies: ['Art', 'Music', 'Hiking', 'Reading', 'Painting', 'Dancing'],
      availability: 'Mon-Sun 7PM-11PM',
      incall: false,
      outcall: true
    },
    {
      id: '9',
      name: 'Amanda Davis',
      avatar: 'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?w=400&h=300&fit=crop&crop=face',
      rating: 4.7,
      reviews: 28,
      price: 'Free',
      priceType: 'dating',
      location: 'Manhattan, NY',
      distance: '0.9km',
      services: ['Dating', 'Relationship', 'Companionship', 'Travel Partner', 'Dinner Date', 'Movie Night', 'Coffee Meet', 'Weekend Getaway', 'Long-term Relationship', 'Marriage', 'Family Planning', 'Shared Interests', 'Emotional Support', 'Life Partner', 'Soulmate'],
      orientation: 'Straight',
      age: 28,
      sex: 'Female',
      height: '5\'7"',
      weight: '135 lbs',
      languages: ['English', 'German'],
      verified: true,
      online: true,
      coordinates: { lat: 40.7505, lng: -73.9934 },
      about: 'Professional by day, adventurer by night. Looking for someone to explore life with. Seeking a partner who balances ambition with fun and values personal growth.',
      whatSheNeeds: '',
      hobbies: ['Adventure', 'Fitness', 'Dancing', 'Travel', 'Rock Climbing', 'Meditation'],
      availability: 'Mon-Sun 6PM-10PM',
      incall: false,
      outcall: true
    }
  ];

  const toggleSave = (providerId: string) => {
    setSavedProviders(prev => {
      const newSet = new Set(prev);
      if (newSet.has(providerId)) {
        newSet.delete(providerId);
      } else {
        newSet.add(providerId);
      }
      return newSet;
    });
  };

  const toggleBook = (providerId: string) => {
    setBookedProviders(prev => {
      const newSet = new Set(prev);
      if (newSet.has(providerId)) {
        newSet.delete(providerId);
        setAcceptedBookings(prevAccepted => {
          const newAccepted = new Set(prevAccepted);
          newAccepted.delete(providerId);
          return newAccepted;
        });
      } else {
        newSet.add(providerId);
        // Simulate booking acceptance after 2 seconds
        setTimeout(() => {
          setAcceptedBookings(prev => new Set([...prev, providerId]));
        }, 2000);
      }
      return newSet;
    });
  };

  const handleMessage = (providerId: string) => {
    // Navigate to messages or open chat
    console.log('Opening chat with provider:', providerId);
  };

  const handleSearch = (e: React.FormEvent) => {
    e.preventDefault();
    // Handle search functionality
  };

  const handleFilter = () => {
    setShowFilterModal(true);
  };

  const closeFilterModal = () => {
    setShowFilterModal(false);
  };

  const applyFilters = () => {
    // Apply filters logic here
    closeFilterModal();
  };

  const resetFilters = () => {
    setFilters({
      priceRange: [0, 1000],
      distance: 10,
      ageRange: [18, 60],
      services: [],
      orientation: [],
      rating: 0,
      onlineOnly: false,
      verifiedOnly: false
    });
  };

  const handleMapView = () => {
    setShowMapModal(true);
  };

  const closeMapModal = () => {
    setShowMapModal(false);
  };

  const handleProfileClick = (providerId: string) => {
    // Navigate to provider profile
    window.location.href = `/provider/${providerId}`;
  };

  const getProviders = () => {
    switch (activeTab) {
      case 'wellness':
        return wellnessProviders;
      case 'escorts':
        return escortProviders;
      case 'match':
        return matchProfiles;
      default:
        return wellnessProviders;
    }
  };

  const providers = getProviders();

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
        {/* Tabs */}
        <div style={{
          display: 'flex',
          backgroundColor: '#f3f4f6',
          borderRadius: '12px',
          padding: '4px',
          marginBottom: '16px'
        }}>
          <button
            onClick={() => setActiveTab('match')}
            style={{
              flex: 1,
              padding: '12px 16px',
              borderRadius: '8px',
              border: 'none',
              background: activeTab === 'match' ? 'white' : 'transparent',
              color: activeTab === 'match' ? '#1a1a1a' : '#6b7280',
              fontWeight: activeTab === 'match' ? '600' : '500',
              cursor: 'pointer',
              transition: 'all 0.2s ease',
              boxShadow: activeTab === 'match' ? '0 2px 4px rgba(0,0,0,0.1)' : 'none'
            }}
          >
            <FaHeart size={16} style={{ marginRight: '8px', verticalAlign: 'middle' }} />
            Match
          </button>
          <button
            onClick={() => setActiveTab('wellness')}
            style={{
              flex: 1,
              padding: '12px 16px',
              borderRadius: '8px',
              border: 'none',
              background: activeTab === 'wellness' ? 'white' : 'transparent',
              color: activeTab === 'wellness' ? '#1a1a1a' : '#6b7280',
              fontWeight: activeTab === 'wellness' ? '600' : '500',
              cursor: 'pointer',
              transition: 'all 0.2s ease',
              boxShadow: activeTab === 'wellness' ? '0 2px 4px rgba(0,0,0,0.1)' : 'none'
            }}
          >
            <BiSpa size={16} style={{ marginRight: '8px', verticalAlign: 'middle' }} />
            Wellness
          </button>
          <button
            onClick={() => setActiveTab('escorts')}
            style={{
              flex: 1,
              padding: '12px 16px',
              borderRadius: '8px',
              border: 'none',
              background: activeTab === 'escorts' ? 'white' : 'transparent',
              color: activeTab === 'escorts' ? '#1a1a1a' : '#6b7280',
              fontWeight: activeTab === 'escorts' ? '600' : '500',
              cursor: 'pointer',
              transition: 'all 0.2s ease',
              boxShadow: activeTab === 'escorts' ? '0 2px 4px rgba(0,0,0,0.1)' : 'none'
            }}
          >
            <MdDiamond size={16} style={{ marginRight: '8px', verticalAlign: 'middle' }} />
            Escorts
          </button>
        </div>

        {/* Search and Filter Bar */}
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
                style={{ position: 'absolute', left: '12px' }}
              />
              <input
                type="text"
                placeholder={activeTab === 'match' ? 'Search matches...' : 'Search providers...'}
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
            onClick={handleMapView}
            style={{
              background: '#3b82f6',
              color: 'white',
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
            <IoLocation size={20} />
          </button>
          <button
            onClick={handleFilter}
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

      {/* Content Area */}
      <div style={{
        padding: '20px 16px'
      }}>
        <div style={{
          display: 'grid',
          gridTemplateColumns: 'repeat(auto-fill, minmax(300px, 1fr))',
          gap: '20px',
          maxWidth: '100%'
        }}>
          {providers.map((provider) => (
            <div key={provider.id} style={{
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
                  src={provider.avatar}
                  alt={provider.name}
                  onClick={() => handleProfileClick(provider.id)}
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
                      {provider.name}
                    </span>
                    {provider.verified && (
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
                    {/* <IoLocationOutline size={14} /> */}
                    <span>{provider.location} • {provider.distance}</span>
                  </div>

                </div>
              </div>

              {/* Main Image */}
              <div style={{
                position: 'relative',
                height: '350px'
              }}>
                <img
                  src={provider.avatar}
                  alt={provider.name}
                  style={{
                    width: '100%',
                    height: '100%',
                    objectFit: 'cover'
                  }}
                />
                
                {/* Online Status */}
                {provider.online && (
                  <div style={{
                    position: 'absolute',
                    top: '12px',
                    right: '12px',
                    background: '#10b981',
                    color: 'white',
                    padding: '4px 8px',
                    borderRadius: '12px',
                    fontSize: '12px',
                    fontWeight: '600'
                  }}>
                    ONLINE
                  </div>
                )}
              </div>

              {/* Like and Save Icons Below Image */}
              <div style={{
                padding: '12px 16px',
                display: 'flex',
                gap: '16px',
                alignItems: 'center'
              }}>
                <button
                  onClick={() => toggleSave(provider.id)}
                  style={{
                    background: 'none',
                    border: 'none',
                    cursor: 'pointer',
                    display: 'flex',
                    alignItems: 'center',
                    justifyContent: 'center',
                    color: savedProviders.has(provider.id) ? '#ef4444' : '#6b7280',
                    transition: 'all 0.2s ease',
                    padding: '8px'
                  }}
                >
                  {savedProviders.has(provider.id) ? (
                    <FaHeart size={26} />
                  ) : (
                    <FaRegHeart size={26} />
                  )}
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

              {/* Provider Details */}
              <div style={{
                padding: '0 16px 16px 16px'
              }}>

                {/* Detailed Information for Wellness and Escorts */}
                {activeTab !== 'match' && (
                  <>
                    {/* Age and Rating */}
                    <div style={{
                      marginBottom: '16px',
                      fontSize: '14px',
                      color: '#6b7280',
                      display: 'flex',
                      alignItems: 'center',
                      gap: '12px'
                    }}>
                      <span>Age: {provider.age} years</span>
                      <div style={{
                        display: 'flex',
                        alignItems: 'center',
                        gap: '4px'
                      }}>
                        <FaStar size={12} color="#fbbf24" />
                        <span>{provider.rating}</span>
                      </div>
                    </div>

                    {/* Sexual Orientation - Green Highlighted */}
                    <div style={{
                      marginBottom: '16px',
                      fontSize: '14px'
                    }}>
                      <span style={{
                        background: '#dcfce7',
                        color: '#166534',
                        padding: '4px 8px',
                        borderRadius: '8px',
                        fontSize: '12px',
                        fontWeight: '600'
                      }}>
                        {provider.orientation}
                      </span>
                    </div>

                    {/* About */}
                    <div style={{
                      marginBottom: '16px',
                      fontSize: '14px',
                      color: '#6b7280',
                      lineHeight: '1.4'
                    }}>
                      {provider.description}
                    </div>

                    {/* Services */}
                    <div style={{
                      marginBottom: '12px'
                    }}>
                      <div style={{
                        fontSize: '14px',
                        fontWeight: '600',
                        color: '#1a1a1a',
                        marginBottom: '6px'
                      }}>
                        Services:
                      </div>
                      <div style={{
                        display: 'flex',
                        flexWrap: 'wrap',
                        gap: '4px'
                      }}>
                        {provider.services.slice(0, activeTab === 'escorts' ? 6 : 3).map((service, index) => {
                          // Highlight sexual services for escort providers
                          const isSexualService = activeTab === 'escorts' && [
                            'Normal Sex', 'Blowjob', 'Anal Sex', 'Anal Fingering', 'Anal Toys', 
                            'Rimming', 'Prostate Massage', 'Threesomes', 'Group Sex', 'Pegging', 
                            'Double Penetration', 'Fisting', 'Roleplay', 'Nipple Play', 'Submission', 
                            'Handjob', 'Fingering', 'Mutual Masturbation', 'Massage with Happy Ending', 
                            'Girlfriend Experience', 'Strap-on Play', 'Couple'
                          ].includes(service);
                          
                          // Highlight massage services for wellness providers
                          const isMassageService = activeTab === 'wellness' && [
                            'Body to Body Massage', 'Scrub Massage', 'Waxing Services', 'Nuru Massage', 
                            'Tantra Massage', 'Happy Ending Massage', 'Four Hands Massage', 'Sensual Massage', 
                            'Erotic Massage', 'Couples Massage', 'Prostate Massage', 'Breast Massage', 
                            'Foot Fetish Massage', 'BDSM Massage', 'Roleplay Massage'
                          ].includes(service);
                          
                          return (
                            <span key={index} style={{
                              background: (isSexualService || isMassageService) ? '#dbeafe' : '#f3f4f6',
                              color: (isSexualService || isMassageService) ? '#1e40af' : '#6b7280',
                              padding: '2px 6px',
                              borderRadius: '8px',
                              fontSize: '11px',
                              fontWeight: (isSexualService || isMassageService) ? '600' : '400'
                            }}>
                              {service}
                            </span>
                          );
                        })}
                        {provider.services.length > (activeTab === 'escorts' ? 6 : 3) && (
                          <span style={{
                            background: '#f3f4f6',
                            color: '#6b7280',
                            padding: '2px 6px',
                            borderRadius: '8px',
                            fontSize: '11px'
                          }}>
                            +{provider.services.length - (activeTab === 'escorts' ? 6 : 3)} more
                          </span>
                        )}
                      </div>
                    </div>

                    {/* Languages */}
                    <div style={{
                      marginBottom: '16px',
                      fontSize: '14px',
                      color: '#6b7280'
                    }}>
                      <span>Languages: {provider.languages.join(', ')}</span>
                    </div>

                    {/* Price */}
                    <div style={{
                      marginBottom: '16px',
                      fontSize: '16px',
                      color: '#1a1a1a'
                    }}>
                      <span style={{ fontWeight: '700', color: '#3b82f6' }}>Tsh {provider.price}</span>
                      <span style={{ fontWeight: '400', color: '#6b7280' }}> / {provider.priceType}</span>
                    </div>
                  </>
                )}

                {/* Match-specific content */}
                {activeTab === 'match' && (
                  <>
                    {/* Age, Sex, Height */}
                    <div style={{
                      marginBottom: '16px',
                      marginTop: '20px',
                      fontSize: '14px',
                      color: '#6b7280'
                    }}>
                      <span>Age: {provider.age} • Sex: {provider.sex} • Height: {provider.height}</span>
                    </div>

                    {/* Sexual Orientation - Highlighted */}
                    <div style={{
                      marginBottom: '16px',
                      fontSize: '14px'
                    }}>
                      <span style={{
                        background: '#dcfce7',
                        color: '#166534',
                        padding: '4px 8px',
                        borderRadius: '8px',
                        fontSize: '12px',
                        fontWeight: '600'
                      }}>
                        {provider.orientation}
                      </span>
                    </div>

                    {/* About */}
                    <div style={{
                      marginBottom: '16px',
                      fontSize: '14px',
                      color: '#6b7280',
                      lineHeight: '1.4'
                    }}>
                      {provider.about}
                    </div>

                    {/* Services and Hobbies for Match */}
                    <div style={{
                      marginBottom: '12px'
                    }}>
                      <div style={{
                        display: 'flex',
                        flexWrap: 'wrap',
                        gap: '4px'
                      }}>
                        {/* Dating Services */}
                        {provider.services.slice(0, 3).map((service, index) => {
                          // Highlight dating services for match providers
                          const isDatingService = [
                            'Dating', 'Relationship', 'Companionship', 'Travel Partner', 'Dinner Date', 
                            'Movie Night', 'Coffee Meet', 'Weekend Getaway', 'Long-term Relationship', 
                            'Marriage', 'Family Planning', 'Shared Interests', 'Emotional Support', 
                            'Life Partner', 'Soulmate'
                          ].includes(service);
                          
                          return (
                            <span key={index} style={{
                              background: isDatingService ? '#dbeafe' : '#f3f4f6',
                              color: isDatingService ? '#1e40af' : '#6b7280',
                              padding: '2px 6px',
                              borderRadius: '8px',
                              fontSize: '11px',
                              fontWeight: isDatingService ? '600' : '400'
                            }}>
                              {service}
                            </span>
                          );
                        })}
                        
                        {/* Hobbies */}
                        {provider.hobbies.map((hobby, index) => (
                          <span key={`hobby-${index}`} style={{
                            background: '#dbeafe',
                            color: '#1e40af',
                            padding: '2px 6px',
                            borderRadius: '8px',
                            fontSize: '11px',
                            fontWeight: '600'
                          }}>
                            {hobby}
                          </span>
                        ))}
                        
                        {provider.services.length > 3 && (
                          <span style={{
                            background: '#f3f4f6',
                            color: '#6b7280',
                            padding: '2px 6px',
                            borderRadius: '8px',
                            fontSize: '11px'
                          }}>
                            +{provider.services.length - 3} more
                          </span>
                        )}
                      </div>
                    </div>

                    {/* Languages */}
                    <div style={{
                      marginBottom: '16px',
                      fontSize: '14px',
                      color: '#6b7280'
                    }}>
                      <span>Languages: {provider.languages.join(', ')}</span>
                    </div>
                  </>
                )}

                {/* Booking Button */}
                <div style={{
                  display: 'flex',
                  justifyContent: 'flex-end',
                  marginTop: '16px'
                }}>
                  <button
                    onClick={() => {
                      if (acceptedBookings.has(provider.id)) {
                        // Navigate to messages page with this conversation
                        navigate('/messages', { state: { activeChat: provider.id } });
                      } else if (bookedProviders.has(provider.id)) {
                        // Change to pending state
                        const newBookedProviders = new Set(bookedProviders);
                        newBookedProviders.delete(provider.id);
                        setBookedProviders(newBookedProviders);
                        
                        const newAcceptedBookings = new Set(acceptedBookings);
                        newAcceptedBookings.add(provider.id);
                        setAcceptedBookings(newAcceptedBookings);
                      } else {
                        // Initial booking
                        const newBookedProviders = new Set(bookedProviders);
                        newBookedProviders.add(provider.id);
                        setBookedProviders(newBookedProviders);
                      }
                    }}
                    style={{
                      padding: '12px 24px',
                      borderRadius: '8px',
                      border: 'none',
                      fontWeight: '600',
                      cursor: 'pointer',
                      transition: 'all 0.2s ease',
                      ...(acceptedBookings.has(provider.id) ? {
                        backgroundColor: '#10b981',
                        color: 'white'
                      } : bookedProviders.has(provider.id) ? {
                        backgroundColor: '#f59e0b',
                        color: 'white'
                      } : {
                        backgroundColor: '#3b82f6',
                        color: 'white'
                      })
                    }}
                  >
                    {acceptedBookings.has(provider.id) ? 'Message' : 
                     bookedProviders.has(provider.id) ? 'Pending' : 
                     activeTab === 'match' ? 'Connect' : 'Book Now'}
                  </button>
                </div>
              </div>
            </div>
          ))}
        </div>
      </div>

      {/* Map Modal */}
      {showMapModal && (
        <div style={{
          position: 'fixed',
          top: 0,
          left: 0,
          right: 0,
          bottom: 0,
          backgroundColor: 'rgba(0, 0, 0, 0.8)',
          zIndex: 1000,
          display: 'flex',
          alignItems: 'center',
          justifyContent: 'center'
        }}>
          <div style={{
            backgroundColor: 'white',
            borderRadius: '20px',
            padding: '24px',
            width: '95%',
            maxWidth: '600px',
            maxHeight: '90vh',
            overflow: 'hidden',
            position: 'relative'
          }}>
            {/* Header */}
            <div style={{
              display: 'flex',
              justifyContent: 'space-between',
              alignItems: 'center',
              marginBottom: '20px'
            }}>
              <h2 style={{
                fontSize: '20px',
                fontWeight: '600',
                color: '#1a1a1a',
                margin: 0
              }}>
                People Nearby
              </h2>
              <button
                onClick={closeMapModal}
                style={{
                  background: 'none',
                  border: 'none',
                  cursor: 'pointer',
                  padding: '8px',
                  borderRadius: '50%',
                  display: 'flex',
                  alignItems: 'center',
                  justifyContent: 'center',
                  color: '#6b7280'
                }}
              >
                <IoClose size={24} />
              </button>
            </div>

            {/* OpenStreetMap iframe */}
            <div style={{
              width: '100%',
              height: '400px',
              borderRadius: '16px',
              overflow: 'hidden',
              marginBottom: '20px',
              border: '1px solid #e5e7eb',
              position: 'relative'
            }}>
              <iframe
                src="https://www.openstreetmap.org/export/embed.html?bbox=35.25,35.29,-6.22,-6.19&layer=mapnik&marker=-6.2088,35.2692"
                width="100%"
                height="100%"
                style={{ border: 'none' }}
                title="OpenStreetMap"
              />
              
              {/* Overlay with nearby people avatars */}
              <div style={{
                position: 'absolute',
                top: 0,
                left: 0,
                right: 0,
                bottom: 0,
                pointerEvents: 'none'
              }}>
                {providers.slice(0, 8).map((provider, index) => {
                  const angle = (index * 45) * (Math.PI / 180);
                  const radius = 80;
                  const centerX = 150;
                  const centerY = 150;
                  const x = centerX + radius * Math.cos(angle);
                  const y = centerY + radius * Math.sin(angle);

                  return (
                    <div
                      key={provider.id}
                      style={{
                        position: 'absolute',
                        left: `${x}px`,
                        top: `${y}px`,
                        transform: 'translate(-50%, -50%)',
                        pointerEvents: 'auto',
                        cursor: 'pointer',
                        transition: 'all 0.3s ease'
                      }}
                      onClick={() => {
                        closeMapModal();
                        navigate(`/service-provider/${provider.id}`);
                      }}
                    >
                      <div style={{
                        width: '50px',
                        height: '50px',
                        borderRadius: '50%',
                        border: '3px solid white',
                        boxShadow: '0 4px 8px rgba(0, 0, 0, 0.2)',
                        overflow: 'hidden',
                        position: 'relative',
                        backgroundColor: 'white'
                      }}>
                        <img
                          src={provider.avatar}
                          alt={provider.name}
                          style={{
                            width: '100%',
                            height: '100%',
                            objectFit: 'cover'
                          }}
                        />
                        {provider.online && (
                          <div style={{
                            position: 'absolute',
                            bottom: '2px',
                            right: '2px',
                            width: '12px',
                            height: '12px',
                            backgroundColor: '#10b981',
                            borderRadius: '50%',
                            border: '2px solid white'
                          }} />
                        )}
                      </div>
                      <div style={{
                        position: 'absolute',
                        top: '60px',
                        left: '50%',
                        transform: 'translateX(-50%)',
                        background: 'rgba(0, 0, 0, 0.8)',
                        color: 'white',
                        padding: '4px 8px',
                        borderRadius: '8px',
                        fontSize: '10px',
                        whiteSpace: 'nowrap',
                        opacity: 0,
                        transition: 'opacity 0.3s ease',
                        pointerEvents: 'none'
                      }}
                      onMouseEnter={(e) => {
                        e.currentTarget.style.opacity = '1';
                      }}
                      onMouseLeave={(e) => {
                        e.currentTarget.style.opacity = '0';
                      }}
                      >
                        {provider.name}
                      </div>
                    </div>
                  );
                })}

                {/* Center location pin */}
                <div style={{
                  position: 'absolute',
                  left: '50%',
                  top: '50%',
                  transform: 'translate(-50%, -50%)',
                  width: '20px',
                  height: '20px',
                  backgroundColor: '#ef4444',
                  borderRadius: '50%',
                  border: '3px solid white',
                  boxShadow: '0 2px 4px rgba(0, 0, 0, 0.3)',
                  pointerEvents: 'none'
                }} />
              </div>
            </div>

            {/* Stats */}
            <div style={{
              display: 'flex',
              justifyContent: 'space-between',
              alignItems: 'center',
              padding: '16px',
              backgroundColor: '#f9fafb',
              borderRadius: '12px'
            }}>
              <div>
                <div style={{
                  fontSize: '14px',
                  color: '#6b7280'
                }}>
                  People nearby
                </div>
                <div style={{
                  fontSize: '18px',
                  fontWeight: '600',
                  color: '#1a1a1a'
                }}>
                  {providers.length}
                </div>
              </div>
              <div>
                <div style={{
                  fontSize: '14px',
                  color: '#6b7280'
                }}>
                  Online now
                </div>
                <div style={{
                  fontSize: '18px',
                  fontWeight: '600',
                  color: '#10b981'
                }}>
                  {providers.filter(p => p.online).length}
                </div>
              </div>
              <div>
                <div style={{
                  fontSize: '14px',
                  color: '#6b7280'
                }}>
                  Average distance
                </div>
                <div style={{
                  fontSize: '18px',
                  fontWeight: '600',
                  color: '#3b82f6'
                }}>
                  0.5km
                </div>
              </div>
            </div>
          </div>
        </div>
      )}

      {/* Filter Modal */}
      {showFilterModal && (
        <div style={{
          position: 'fixed',
          top: 0,
          left: 0,
          right: 0,
          bottom: 0,
          backgroundColor: 'rgba(0, 0, 0, 0.8)',
          zIndex: 1000,
          display: 'flex',
          alignItems: 'center',
          justifyContent: 'center'
        }}>
          <div style={{
            backgroundColor: 'white',
            borderRadius: '20px',
            padding: '24px',
            width: '90%',
            maxWidth: '400px',
            maxHeight: '80vh',
            overflow: 'auto',
            position: 'relative'
          }}>
            {/* Header */}
            <div style={{
              display: 'flex',
              justifyContent: 'space-between',
              alignItems: 'center',
              marginBottom: '20px',
              borderBottom: '1px solid #e5e7eb',
              paddingBottom: '16px'
            }}>
              <h2 style={{
                fontSize: '20px',
                fontWeight: '600',
                color: '#1a1a1a',
                margin: 0
              }}>
                Filters - {activeTab.charAt(0).toUpperCase() + activeTab.slice(1)}
              </h2>
              <button
                onClick={closeFilterModal}
                style={{
                  background: 'none',
                  border: 'none',
                  cursor: 'pointer',
                  padding: '8px',
                  borderRadius: '50%',
                  display: 'flex',
                  alignItems: 'center',
                  justifyContent: 'center',
                  color: '#6b7280'
                }}
              >
                <IoClose size={24} />
              </button>
            </div>

            {/* Filter Content */}
            <div style={{ marginBottom: '20px' }}>
              {/* Price Range */}
              <div style={{ marginBottom: '20px' }}>
                <h3 style={{
                  fontSize: '16px',
                  fontWeight: '600',
                  marginBottom: '12px',
                  color: '#1a1a1a'
                }}>
                  Price Range (Tsh)
                </h3>
                <div style={{
                  display: 'flex',
                  gap: '12px',
                  alignItems: 'center'
                }}>
                  <input
                    type="number"
                    placeholder="Min"
                    value={filters.priceRange[0]}
                    onChange={(e) => setFilters({
                      ...filters,
                      priceRange: [parseInt(e.target.value) || 0, filters.priceRange[1]]
                    })}
                    style={{
                      width: '80px',
                      padding: '8px 12px',
                      border: '1px solid #d1d5db',
                      borderRadius: '8px',
                      fontSize: '14px'
                    }}
                  />
                  <span style={{ color: '#6b7280' }}>to</span>
                  <input
                    type="number"
                    placeholder="Max"
                    value={filters.priceRange[1]}
                    onChange={(e) => setFilters({
                      ...filters,
                      priceRange: [filters.priceRange[0], parseInt(e.target.value) || 1000]
                    })}
                    style={{
                      width: '80px',
                      padding: '8px 12px',
                      border: '1px solid #d1d5db',
                      borderRadius: '8px',
                      fontSize: '14px'
                    }}
                  />
                </div>
              </div>

              {/* Distance */}
              <div style={{ marginBottom: '20px' }}>
                <h3 style={{
                  fontSize: '16px',
                  fontWeight: '600',
                  marginBottom: '12px',
                  color: '#1a1a1a'
                }}>
                  Distance (km)
                </h3>
                <input
                  type="range"
                  min="1"
                  max="50"
                  value={filters.distance}
                  onChange={(e) => setFilters({
                    ...filters,
                    distance: parseInt(e.target.value)
                  })}
                  style={{
                    width: '100%',
                    height: '6px',
                    borderRadius: '3px',
                    background: '#e5e7eb',
                    outline: 'none'
                  }}
                />
                <div style={{
                  display: 'flex',
                  justifyContent: 'space-between',
                  fontSize: '12px',
                  color: '#6b7280',
                  marginTop: '4px'
                }}>
                  <span>1km</span>
                  <span>{filters.distance}km</span>
                  <span>50km</span>
                </div>
              </div>

              {/* Age Range */}
              <div style={{ marginBottom: '20px' }}>
                <h3 style={{
                  fontSize: '16px',
                  fontWeight: '600',
                  marginBottom: '12px',
                  color: '#1a1a1a'
                }}>
                  Age Range
                </h3>
                <div style={{
                  display: 'flex',
                  gap: '12px',
                  alignItems: 'center'
                }}>
                  <input
                    type="number"
                    placeholder="Min Age"
                    value={filters.ageRange[0]}
                    onChange={(e) => setFilters({
                      ...filters,
                      ageRange: [parseInt(e.target.value) || 18, filters.ageRange[1]]
                    })}
                    style={{
                      width: '80px',
                      padding: '8px 12px',
                      border: '1px solid #d1d5db',
                      borderRadius: '8px',
                      fontSize: '14px'
                    }}
                  />
                  <span style={{ color: '#6b7280' }}>to</span>
                  <input
                    type="number"
                    placeholder="Max Age"
                    value={filters.ageRange[1]}
                    onChange={(e) => setFilters({
                      ...filters,
                      ageRange: [filters.ageRange[0], parseInt(e.target.value) || 60]
                    })}
                    style={{
                      width: '80px',
                      padding: '8px 12px',
                      border: '1px solid #d1d5db',
                      borderRadius: '8px',
                      fontSize: '14px'
                    }}
                  />
                </div>
              </div>

              {/* Services Filter */}
              {activeTab === 'wellness' && (
                <div style={{ marginBottom: '20px' }}>
                  <h3 style={{
                    fontSize: '16px',
                    fontWeight: '600',
                    marginBottom: '12px',
                    color: '#1a1a1a'
                  }}>
                    Services
                  </h3>
                  <div style={{
                    display: 'flex',
                    flexWrap: 'wrap',
                    gap: '8px'
                  }}>
                    {['Body to Body Massage', 'Scrub Massage', 'Waxing Services', 'Nuru Massage', 'Tantra Massage'].map((service) => (
                      <label key={service} style={{
                        display: 'flex',
                        alignItems: 'center',
                        gap: '6px',
                        cursor: 'pointer'
                      }}>
                        <input
                          type="checkbox"
                          checked={filters.services.includes(service)}
                          onChange={(e) => {
                            if (e.target.checked) {
                              setFilters({
                                ...filters,
                                services: [...filters.services, service]
                              });
                            } else {
                              setFilters({
                                ...filters,
                                services: filters.services.filter(s => s !== service)
                              });
                            }
                          }}
                        />
                        <span style={{ fontSize: '12px' }}>{service}</span>
                      </label>
                    ))}
                  </div>
                </div>
              )}

              {activeTab === 'escorts' && (
                <div style={{ marginBottom: '20px' }}>
                  <h3 style={{
                    fontSize: '16px',
                    fontWeight: '600',
                    marginBottom: '12px',
                    color: '#1a1a1a'
                  }}>
                    Services
                  </h3>
                  <div style={{
                    display: 'flex',
                    flexWrap: 'wrap',
                    gap: '8px'
                  }}>
                    {['Normal Sex', 'Blowjob', 'Anal Sex', 'Anal Fingering', 'Anal Toys', 'Rimming', 'Prostate Massage', 'Threesomes', 'Group Sex', 'Pegging', 'Double Penetration', 'Fisting', 'Roleplay', 'Nipple Play', 'Submission', 'Handjob', 'Fingering', 'Mutual Masturbation', 'Massage with Happy Ending', 'Girlfriend Experience', 'Strap-on Play', 'Couple'].map((service) => (
                      <label key={service} style={{
                        display: 'flex',
                        alignItems: 'center',
                        gap: '6px',
                        cursor: 'pointer'
                      }}>
                        <input
                          type="checkbox"
                          checked={filters.services.includes(service)}
                          onChange={(e) => {
                            if (e.target.checked) {
                              setFilters({
                                ...filters,
                                services: [...filters.services, service]
                              });
                            } else {
                              setFilters({
                                ...filters,
                                services: filters.services.filter(s => s !== service)
                              });
                            }
                          }}
                        />
                        <span style={{ fontSize: '12px' }}>{service}</span>
                      </label>
                    ))}
                  </div>
                </div>
              )}

              {activeTab === 'match' && (
                <div style={{ marginBottom: '20px' }}>
                  <h3 style={{
                    fontSize: '16px',
                    fontWeight: '600',
                    marginBottom: '12px',
                    color: '#1a1a1a'
                  }}>
                    Interests
                  </h3>
                  <div style={{
                    display: 'flex',
                    flexWrap: 'wrap',
                    gap: '8px'
                  }}>
                    {['Dating', 'Relationship', 'Companionship', 'Travel Partner', 'Coffee Meet'].map((interest) => (
                      <label key={interest} style={{
                        display: 'flex',
                        alignItems: 'center',
                        gap: '6px',
                        cursor: 'pointer'
                      }}>
                        <input
                          type="checkbox"
                          checked={filters.services.includes(interest)}
                          onChange={(e) => {
                            if (e.target.checked) {
                              setFilters({
                                ...filters,
                                services: [...filters.services, interest]
                              });
                            } else {
                              setFilters({
                                ...filters,
                                services: filters.services.filter(s => s !== interest)
                              });
                            }
                          }}
                        />
                        <span style={{ fontSize: '12px' }}>{interest}</span>
                      </label>
                    ))}
                  </div>
                </div>
              )}

              {/* Orientation Filter */}
              <div style={{ marginBottom: '20px' }}>
                <h3 style={{
                  fontSize: '16px',
                  fontWeight: '600',
                  marginBottom: '12px',
                  color: '#1a1a1a'
                }}>
                  Orientation
                </h3>
                <div style={{
                  display: 'flex',
                  flexWrap: 'wrap',
                  gap: '8px'
                }}>
                  {['Straight', 'Lesbian', 'Bisexual'].map((orientation) => (
                    <label key={orientation} style={{
                      display: 'flex',
                      alignItems: 'center',
                      gap: '6px',
                      cursor: 'pointer'
                    }}>
                      <input
                        type="checkbox"
                        checked={filters.orientation.includes(orientation)}
                        onChange={(e) => {
                          if (e.target.checked) {
                            setFilters({
                              ...filters,
                              orientation: [...filters.orientation, orientation]
                            });
                          } else {
                            setFilters({
                              ...filters,
                              orientation: filters.orientation.filter(o => o !== orientation)
                            });
                          }
                        }}
                      />
                      <span style={{ fontSize: '12px' }}>{orientation}</span>
                    </label>
                  ))}
                </div>
              </div>

              {/* Rating Filter */}
              <div style={{ marginBottom: '20px' }}>
                <h3 style={{
                  fontSize: '16px',
                  fontWeight: '600',
                  marginBottom: '12px',
                  color: '#1a1a1a'
                }}>
                  Minimum Rating
                </h3>
                <div style={{
                  display: 'flex',
                  gap: '8px',
                  alignItems: 'center'
                }}>
                  {[1, 2, 3, 4, 5].map((star) => (
                    <button
                      key={star}
                      onClick={() => setFilters({ ...filters, rating: star })}
                      style={{
                        background: 'none',
                        border: 'none',
                        cursor: 'pointer',
                        color: filters.rating >= star ? '#fbbf24' : '#d1d5db',
                        fontSize: '20px'
                      }}
                    >
                      ★
                    </button>
                  ))}
                  <span style={{ fontSize: '12px', color: '#6b7280' }}>
                    {filters.rating}+ stars
                  </span>
                </div>
              </div>

              {/* Additional Filters */}
              <div style={{ marginBottom: '20px' }}>
                <h3 style={{
                  fontSize: '16px',
                  fontWeight: '600',
                  marginBottom: '12px',
                  color: '#1a1a1a'
                }}>
                  Additional Filters
                </h3>
                <div style={{
                  display: 'flex',
                  flexDirection: 'column',
                  gap: '12px'
                }}>
                  <label style={{
                    display: 'flex',
                    alignItems: 'center',
                    gap: '8px',
                    cursor: 'pointer'
                  }}>
                    <input
                      type="checkbox"
                      checked={filters.onlineOnly}
                      onChange={(e) => setFilters({
                        ...filters,
                        onlineOnly: e.target.checked
                      })}
                    />
                    <span>Online only</span>
                  </label>
                  <label style={{
                    display: 'flex',
                    alignItems: 'center',
                    gap: '8px',
                    cursor: 'pointer'
                  }}>
                    <input
                      type="checkbox"
                      checked={filters.verifiedOnly}
                      onChange={(e) => setFilters({
                        ...filters,
                        verifiedOnly: e.target.checked
                      })}
                    />
                    <span>Verified only</span>
                  </label>
                </div>
              </div>
            </div>

            {/* Action Buttons */}
            <div style={{
              display: 'flex',
              gap: '12px',
              borderTop: '1px solid #e5e7eb',
              paddingTop: '16px'
            }}>
              <button
                onClick={resetFilters}
                style={{
                  flex: 1,
                  padding: '12px',
                  border: '1px solid #d1d5db',
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
                  padding: '12px',
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

export default Erotic; 