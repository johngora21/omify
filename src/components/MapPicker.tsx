import React, { useEffect, useRef, useState } from 'react';
import L from 'leaflet';

interface MapPickerProps {
  onLocationSelect: (lat: number, lng: number, address: string) => void;
  initialLat?: number;
  initialLng?: number;
  height?: string;
}

const MapPicker: React.FC<MapPickerProps> = ({ 
  onLocationSelect, 
  initialLat = -1.2921, 
  initialLng = 36.8219, 
  height = '300px' 
}) => {
  const mapRef = useRef<HTMLDivElement>(null);
  const mapInstance = useRef<L.Map | null>(null);
  const markerRef = useRef<L.Marker | null>(null);
  const [selectedLocation, setSelectedLocation] = useState<{lat: number, lng: number} | null>(null);
  const [isLoading, setIsLoading] = useState(false);
  const [error, setError] = useState<string | null>(null);

  // Get current location from device
  const getCurrentLocation = () => {
    setIsLoading(true);
    setError(null);

    if (!navigator.geolocation) {
      setError('Geolocation is not supported by this browser');
      setIsLoading(false);
      return;
    }

    navigator.geolocation.getCurrentPosition(
      async (position) => {
        const { latitude, longitude } = position.coords;
        
        // Update map view to current location
        if (mapInstance.current) {
          mapInstance.current.setView([latitude, longitude], 15);
          
          // Update marker position
          if (markerRef.current) {
            markerRef.current.setLatLng([latitude, longitude]);
          }
        }

        setSelectedLocation({ lat: latitude, lng: longitude });

        // Get address from coordinates using reverse geocoding
        try {
          const response = await fetch(
            `https://nominatim.openstreetmap.org/reverse?format=json&lat=${latitude}&lon=${longitude}&zoom=18&addressdetails=1`
          );
          const data = await response.json();
          const address = data.display_name || `${latitude.toFixed(6)}, ${longitude.toFixed(6)}`;
          
          onLocationSelect(latitude, longitude, address);
        } catch (error) {
          console.error('Error getting address:', error);
          onLocationSelect(latitude, longitude, `${latitude.toFixed(6)}, ${longitude.toFixed(6)}`);
        }

        setIsLoading(false);
      },
      (error) => {
        console.error('Error getting location:', error);
        let errorMessage = 'Unable to get your location';
        
        switch (error.code) {
          case error.PERMISSION_DENIED:
            errorMessage = 'Location permission denied. Please allow location access.';
            break;
          case error.POSITION_UNAVAILABLE:
            errorMessage = 'Location information unavailable.';
            break;
          case error.TIMEOUT:
            errorMessage = 'Location request timed out.';
            break;
        }
        
        setError(errorMessage);
        setIsLoading(false);
      },
      {
        enableHighAccuracy: true,
        timeout: 10000,
        maximumAge: 60000
      }
    );
  };

  useEffect(() => {
    if (!mapRef.current) return;

    // Initialize map
    mapInstance.current = L.map(mapRef.current).setView([initialLat, initialLng], 13);

    // Add OpenStreetMap tiles
    L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
      attribution: '© OpenStreetMap contributors'
    }).addTo(mapInstance.current);

    // Add initial marker
    markerRef.current = L.marker([initialLat, initialLng]).addTo(mapInstance.current);

    // Handle map clicks (fallback for manual selection)
    mapInstance.current.on('click', async (e) => {
      const { lat, lng } = e.latlng;
      
      // Update marker position
      if (markerRef.current) {
        markerRef.current.setLatLng([lat, lng]);
      }

      setSelectedLocation({ lat, lng });

      // Get address from coordinates using reverse geocoding
      try {
        const response = await fetch(
          `https://nominatim.openstreetmap.org/reverse?format=json&lat=${lat}&lon=${lng}&zoom=18&addressdetails=1`
        );
        const data = await response.json();
        const address = data.display_name || `${lat.toFixed(6)}, ${lng.toFixed(6)}`;
        
        onLocationSelect(lat, lng, address);
      } catch (error) {
        console.error('Error getting address:', error);
        onLocationSelect(lat, lng, `${lat.toFixed(6)}, ${lng.toFixed(6)}`);
      }
    });

    return () => {
      if (mapInstance.current) {
        mapInstance.current.remove();
      }
    };
  }, [initialLat, initialLng, onLocationSelect]);

  return (
    <div style={{ marginBottom: '16px' }}>
      <label style={{
        display: 'block',
        fontSize: '14px',
        fontWeight: '500',
        color: '#374151',
        marginBottom: '8px'
      }}>
        Get Your Current Location *
      </label>
      
      {/* Location Button */}
      <button
        onClick={getCurrentLocation}
        disabled={isLoading}
        style={{
          width: '150px',
          padding: '12px',
          background: isLoading ? '#9ca3af' : 'linear-gradient(135deg, #3b82f6, #1d4ed8)',
          color: 'white',
          border: 'none',
          borderRadius: '8px',
          fontSize: '16px',
          fontWeight: '600',
          cursor: isLoading ? 'not-allowed' : 'pointer',
          marginBottom: '12px',
          display: 'flex',
          alignItems: 'center',
          justifyContent: 'center',
          gap: '8px',
          margin: '0 auto 12px'
        }}
      >
        {isLoading ? (
          <>
            <div style={{
              width: '16px',
              height: '16px',
              border: '2px solid #ffffff',
              borderTop: '2px solid transparent',
              borderRadius: '50%',
              animation: 'spin 1s linear infinite'
            }} />
            Getting Location...
          </>
        ) : (
          <>
            📍 Location
          </>
        )}
      </button>

      {/* Error Message */}
      {error && (
        <div style={{
          padding: '8px 12px',
          background: '#fef2f2',
          border: '1px solid #fecaca',
          borderRadius: '6px',
          marginBottom: '12px'
        }}>
          <p style={{ fontSize: '12px', color: '#dc2626', margin: 0 }}>
            ⚠️ {error}
          </p>
        </div>
      )}

      {/* Map */}
      <div 
        ref={mapRef} 
        style={{ 
          width: '100%', 
          height: height,
          border: '1px solid #d1d5db',
          borderRadius: '8px',
          overflow: 'hidden'
        }}
      />
      
      {selectedLocation && (
        <p style={{ fontSize: '12px', color: '#6b7280', marginTop: '8px' }}>
          ✅ Location Selected: {selectedLocation.lat.toFixed(6)}, {selectedLocation.lng.toFixed(6)}
        </p>
      )}
      
      <p style={{ fontSize: '12px', color: '#6b7280', marginTop: '4px' }}>
        Tap the button above to use your device's GPS location, or click on the map to select manually
      </p>
    </div>
  );
};

export default MapPicker; 