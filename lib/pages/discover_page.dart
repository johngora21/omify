import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DiscoverPage extends StatefulWidget {
  const DiscoverPage({super.key});

  @override
  State<DiscoverPage> createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage> {
  String _activeTab = 'hotels';
  String _searchQuery = '';
  bool _showFilterModal = false;
  bool _showMapModal = false;

  Map<String, dynamic> _filters = {
    'priceRange': [0.0, 1000.0],
    'distance': 10.0,
    'rating': 0.0,
    'verifiedOnly': false,
    'propertyType': '',
    'starRating': 0,
    'amenities': <String>[],
    'locationSpecific': <String>[],
    'vehicleType': '',
    'features': <String>[],
    'adventureType': '',
    'groupSize': '',
    'duration': '',
    'services': <String>[]
  };

  final List<Map<String, dynamic>> _hotels = [
    {
      'id': '1',
      'name': 'Serengeti Safari Lodge',
      'providerName': 'Serengeti Lodge Group',
      'providerAvatar': 'https://images.unsplash.com/photo-1566073771259-6a8506099945?w=400&h=300&fit=crop',
      'avatar': 'https://images.unsplash.com/photo-1566073771259-6a8506099945?w=400&h=300&fit=crop',
      'rating': 4.8,
      'price': '150,000',
      'priceType': 'night',
      'location': 'Serengeti National Park',
      'amenities': ['WiFi', 'Pool', 'Restaurant', 'Spa'],
      'verified': true,
      'description': 'Luxury safari lodge with stunning views of the Serengeti plains.'
    },
    {
      'id': '2',
      'name': 'Zanzibar Beach Resort',
      'providerName': 'Zanzibar Resorts Ltd',
      'providerAvatar': 'https://images.unsplash.com/photo-1571896349842-33c89424de2d?w=400&h=300&fit=crop',
      'avatar': 'https://images.unsplash.com/photo-1571896349842-33c89424de2d?w=400&h=300&fit=crop',
      'rating': 4.6,
      'price': '120,000',
      'priceType': 'night',
      'location': 'Zanzibar Island',
      'amenities': ['Beach Access', 'Spa', 'Restaurant', 'Water Sports'],
      'verified': true,
      'description': 'Beachfront resort with pristine white sand beaches.'
    }
  ];

  final List<Map<String, dynamic>> _carRentals = [
    {
      'id': '1',
      'name': 'Toyota Land Cruiser 4x4',
      'providerName': 'Safari Car Rentals',
      'providerAvatar': 'https://images.unsplash.com/photo-1549317661-bd32c8ce0db2?w=400&h=300&fit=crop',
      'avatar': 'https://images.unsplash.com/photo-1549317661-bd32c8ce0db2?w=400&h=300&fit=crop',
      'rating': 4.7,
      'price': '80,000',
      'priceType': 'day',
      'location': 'Arusha',
      'amenities': ['4x4', 'AC', 'GPS', 'Insurance'],
      'verified': true,
      'description': 'Perfect for safari adventures and off-road exploration.'
    },
    {
      'id': '2',
      'name': 'Economy Sedan',
      'providerName': 'City Car Rentals',
      'providerAvatar': 'https://images.unsplash.com/photo-1552519507-da3b142c6e3d?w=400&h=300&fit=crop',
      'avatar': 'https://images.unsplash.com/photo-1552519507-da3b142c6e3d?w=400&h=300&fit=crop',
      'rating': 4.3,
      'price': '45,000',
      'priceType': 'day',
      'location': 'Dar es Salaam',
      'amenities': ['AC', 'GPS', 'Fuel Efficient'],
      'verified': false,
      'description': 'Affordable city transportation with great fuel economy.'
    }
  ];

  final List<Map<String, dynamic>> _adventures = [
    {
      'id': '1',
      'name': 'Serengeti Safari Tour',
      'providerName': 'Wildlife Adventures',
      'providerAvatar': 'https://images.unsplash.com/photo-1559827260-dc66d52bef19?w=400&h=300&fit=crop',
      'avatar': 'https://images.unsplash.com/photo-1559827260-dc66d52bef19?w=400&h=300&fit=crop',
      'rating': 4.9,
      'price': '250,000',
      'priceType': 'person',
      'location': 'Serengeti National Park',
      'amenities': ['Guide', 'Transport', 'Accommodation', 'Meals'],
      'verified': true,
      'description': '3-day safari experience with professional wildlife guides.'
    },
    {
      'id': '2',
      'name': 'Kilimanjaro Climbing',
      'providerName': 'Mountain Expeditions',
      'providerAvatar': 'https://images.unsplash.com/photo-1506905925346-21bda4d32df4?w=400&h=300&fit=crop',
      'avatar': 'https://images.unsplash.com/photo-1506905925346-21bda4d32df4?w=400&h=300&fit=crop',
      'rating': 4.8,
      'price': '800,000',
      'priceType': 'person',
      'location': 'Mount Kilimanjaro',
      'amenities': ['Equipment', 'Guide', 'Accommodation', 'Permits'],
      'verified': true,
      'description': '7-day climbing expedition to Africa\'s highest peak.'
    }
  ];

  List<Map<String, dynamic>> get _currentItems {
    switch (_activeTab) {
      case 'hotels':
        return _hotels;
      case 'cars':
        return _carRentals;
      case 'adventures':
        return _adventures;
      default:
        return _hotels;
    }
  }

  void handleMapView() {
    setState(() {
      _showMapModal = true;
    });
  }

  void closeMapModal() {
    setState(() {
      _showMapModal = false;
    });
  }

  void handleFilter() {
    setState(() {
      _showFilterModal = true;
    });
  }

  void closeFilterModal() {
    setState(() {
      _showFilterModal = false;
    });
  }

  void resetFilters() {
    setState(() {
      _filters = {
        'priceRange': [0.0, 1000.0],
        'distance': 10.0,
        'rating': 0.0,
        'verifiedOnly': false,
        'propertyType': '',
        'starRating': 0,
        'amenities': <String>[],
        'locationSpecific': <String>[],
        'vehicleType': '',
        'features': <String>[],
        'adventureType': '',
        'groupSize': '',
        'duration': '',
        'services': <String>[]
      };
    });
  }

  void applyFilters() {
    // Apply filters logic here
    print('Applied filters: $_filters');
    closeFilterModal();
  }

  void handleProfileClick(String itemId) {
    // Navigate to item profile
    print('Navigate to profile: $itemId');
    // You can add navigation logic here later
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      body: Stack(
        children: [
          SafeArea(
            child: Column(
              children: [
                // Header with Back Button and Title
                Container(
                  color: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () => context.go('/'),
                        child: Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Icon(Icons.arrow_back, size: 20, color: Colors.black87),
                        ),
                      ),
                      const Spacer(),
                      const Text(
                        'Explore',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      const Spacer(),
                    ],
                  ),
                ),

                // Tabs
                Container(
                  color: Colors.white,
                  padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: const Color(0xFFF3F4F6),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: const EdgeInsets.all(4),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              _buildTabButton(
                                'hotels',
                                'Accommodation',
                                Icons.hotel,
                                _activeTab == 'hotels',
                              ),
                              _buildTabButton(
                                'cars',
                                'Cars',
                                Icons.directions_car,
                                _activeTab == 'cars',
                              ),
                              _buildTabButton(
                                'adventures',
                                'Adventures',
                                Icons.explore,
                                _activeTab == 'adventures',
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      
                      // Search and Filter Bar
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                color: const Color(0xFFF9FAFB),
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(color: const Color(0xFFE5E7EB)),
                              ),
                              child: TextField(
                                onChanged: (value) {
                                  setState(() {
                                    _searchQuery = value;
                                  });
                                },
                                decoration: const InputDecoration(
                                  hintText: 'Search hotels, cars, adventures...',
                                  hintStyle: TextStyle(color: Color(0xFF9CA3AF)),
                                  prefixIcon: Icon(Icons.search, color: Color(0xFF9CA3AF)),
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),
                          GestureDetector(
                            onTap: handleMapView,
                            child: Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: const Color(0xFF667EEA),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: const Icon(
                                Icons.location_on,
                                color: Colors.white,
                                size: 20,
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),
                          GestureDetector(
                            onTap: handleFilter,
                            child: Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: const Color(0xFFF3F4F6),
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(color: const Color(0xFFE5E7EB)),
                              ),
                              child: const Icon(
                                Icons.tune,
                                color: Color(0xFF6B7280),
                                size: 20,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                // Content
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    itemCount: _currentItems.length,
                    itemBuilder: (context, index) {
                      final item = _currentItems[index];
                      return _buildItemCard(item);
                    },
                  ),
                ),
              ],
            ),
          ),
          
          // Filter Modal
          if (_showFilterModal) _buildFilterModal(),
          
          // Map Modal
          if (_showMapModal) _buildMapModal(),
        ],
      ),
    );
  }

  Widget _buildFilterModal() {
    return Stack(
      children: [
        ModalBarrier(
          dismissible: true,
          color: Colors.black.withValues(alpha: 0.8),
          onDismiss: closeFilterModal,
        ),
        Center(
          child: Container(
            margin: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            constraints: const BoxConstraints(
              maxWidth: 400,
              maxHeight: 600,
            ),
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Filter ${_activeTab == 'hotels' ? 'Accommodation' : _activeTab == 'cars' ? 'Car Rentals' : 'Adventures'}',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF1A1A1A),
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.close, color: Color(0xFF6B7280)),
                        onPressed: closeFilterModal,
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),

                  // Price Range
                  _buildFilterSection(
                    'Price Range (TSh)',
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                              hintText: 'Min',
                              border: OutlineInputBorder(),
                              contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                            ),
                            onChanged: (value) {
                              final min = double.tryParse(value) ?? 0.0;
                              setState(() {
                                _filters['priceRange'] = [min, _filters['priceRange'][1]];
                              });
                            },
                          ),
                        ),
                        const SizedBox(width: 12),
                        const Text('-'),
                        const SizedBox(width: 12),
                        Expanded(
                          child: TextField(
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                              hintText: 'Max',
                              border: OutlineInputBorder(),
                              contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                            ),
                            onChanged: (value) {
                              final max = double.tryParse(value) ?? 1000.0;
                              setState(() {
                                _filters['priceRange'] = [_filters['priceRange'][0], max];
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Rating Filter
                  _buildFilterSection(
                    'Minimum Rating',
                    Wrap(
                      spacing: 8,
                      children: [0, 1, 2, 3, 4, 5].map((rating) {
                        final isSelected = _filters['rating'] == rating;
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              _filters['rating'] = rating;
                            });
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                            decoration: BoxDecoration(
                              color: isSelected ? const Color(0xFF667EEA) : Colors.white,
                              border: Border.all(color: const Color(0xFFE5E7EB)),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              rating == 0 ? 'Any' : '$rating+',
                              style: TextStyle(
                                color: isSelected ? Colors.white : const Color(0xFF6B7280),
                                fontSize: 14,
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),

                  // Verified Only
                  _buildFilterSection(
                    'Verification',
                    Row(
                      children: [
                        Checkbox(
                          value: _filters['verifiedOnly'],
                          onChanged: (value) {
                            setState(() {
                              _filters['verifiedOnly'] = value ?? false;
                            });
                          },
                        ),
                        const Text(
                          'Verified providers only',
                          style: TextStyle(
                            fontSize: 14,
                            color: Color(0xFF6B7280),
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Hotels Specific Filters
                  if (_activeTab == 'hotels') ...[
                    // Property Type
                    _buildFilterSection(
                      'Property Type',
                      Wrap(
                        spacing: 8,
                        children: ['Hotel', 'BnB', 'Lodge', 'Resort', 'Camp'].map((type) {
                          final isSelected = _filters['propertyType'] == type;
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                _filters['propertyType'] = _filters['propertyType'] == type ? '' : type;
                              });
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                              decoration: BoxDecoration(
                                color: isSelected ? const Color(0xFF667EEA) : Colors.white,
                                border: Border.all(color: const Color(0xFFE5E7EB)),
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Text(
                                type,
                                style: TextStyle(
                                  color: isSelected ? Colors.white : const Color(0xFF6B7280),
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),

                    // Star Rating
                    _buildFilterSection(
                      'Star Rating',
                      Wrap(
                        spacing: 8,
                        children: [0, 1, 2, 3, 4, 5].map((stars) {
                          final isSelected = _filters['starRating'] == stars;
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                _filters['starRating'] = _filters['starRating'] == stars ? 0 : stars;
                              });
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                              decoration: BoxDecoration(
                                color: isSelected ? const Color(0xFF667EEA) : Colors.white,
                                border: Border.all(color: const Color(0xFFE5E7EB)),
                                borderRadius: BorderRadius.circular(8),
                            ),
                              child: Text(
                                stars == 0 ? 'Any' : '$stars★',
                                style: TextStyle(
                                  color: isSelected ? Colors.white : const Color(0xFF6B7280),
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),

                    // Amenities
                    _buildFilterSection(
                      'Amenities',
                      Wrap(
                        spacing: 8,
                        children: ['WiFi', 'Pool', 'Restaurant', 'Spa', 'Airport Transfer', 'Breakfast', 'Parking', 'AC/Heating', 'Pet Friendly', 'Family Rooms'].map((amenity) {
                          final isSelected = (_filters['amenities'] as List<String>).contains(amenity);
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                final amenities = List<String>.from(_filters['amenities']);
                                if (amenities.contains(amenity)) {
                                  amenities.remove(amenity);
                                } else {
                                  amenities.add(amenity);
                                }
                                _filters['amenities'] = amenities;
                              });
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                              decoration: BoxDecoration(
                                color: isSelected ? const Color(0xFF667EEA) : Colors.white,
                                border: Border.all(color: const Color(0xFFE5E7EB)),
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Text(
                                amenity,
                                style: TextStyle(
                                  color: isSelected ? Colors.white : const Color(0xFF6B7280),
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),

                    // Location Specific
                    _buildFilterSection(
                      'Location Features',
                      Wrap(
                        spacing: 8,
                        children: ['Near Safari Parks', 'Beach Access', 'City Center', 'Airport Proximity'].map((location) {
                          final isSelected = (_filters['locationSpecific'] as List<String>).contains(location);
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                final locations = List<String>.from(_filters['locationSpecific']);
                                if (locations.contains(location)) {
                                  locations.remove(location);
                                } else {
                                  locations.add(location);
                                }
                                _filters['locationSpecific'] = locations;
                              });
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                              decoration: BoxDecoration(
                                color: isSelected ? const Color(0xFF667EEA) : Colors.white,
                                border: Border.all(color: const Color(0xFFE5E7EB)),
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Text(
                                location,
                                style: TextStyle(
                                  color: isSelected ? Colors.white : const Color(0xFF6B7280),
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ],

                  // Cars Specific Filters
                  if (_activeTab == 'cars') ...[
                    // Vehicle Type
                    _buildFilterSection(
                      'Vehicle Type',
                      Wrap(
                        spacing: 8,
                        children: ['4x4/SUV', 'Sedan', 'Economy', 'Luxury', 'Van/Minibus', 'Truck'].map((type) {
                          final isSelected = _filters['vehicleType'] == type;
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                _filters['vehicleType'] = _filters['vehicleType'] == type ? '' : type;
                              });
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                              decoration: BoxDecoration(
                                color: isSelected ? const Color(0xFF3B82F6) : Colors.white,
                                border: Border.all(color: const Color(0xFFE5E7EB)),
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Text(
                                type,
                                style: TextStyle(
                                  color: isSelected ? Colors.white : const Color(0xFF6B7280),
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),

                    // Features
                    _buildFilterSection(
                      'Features',
                      Wrap(
                        spacing: 8,
                        children: ['AC', 'GPS', 'Insurance', 'Unlimited Mileage', 'Driver Optional', 'Airport Pickup', 'Hotel Delivery', '24/7 Support', 'One-way Rental'].map((feature) {
                          final isSelected = (_filters['features'] as List<String>).contains(feature);
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                final features = List<String>.from(_filters['features']);
                                if (features.contains(feature)) {
                                  features.remove(feature);
                                } else {
                                  features.add(feature);
                                }
                                _filters['features'] = features;
                              });
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                              decoration: BoxDecoration(
                                color: isSelected ? const Color(0xFF3B82F6) : Colors.white,
                                border: Border.all(color: const Color(0xFFE5E7EB)),
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Text(
                                feature,
                                style: TextStyle(
                                  color: isSelected ? Colors.white : const Color(0xFF6B7280),
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ],

                  // Adventures Specific Filters
                  if (_activeTab == 'adventures') ...[
                    // Adventure Type
                    _buildFilterSection(
                      'Adventure Type',
                      Wrap(
                        spacing: 8,
                        children: ['Safari', 'Climbing', 'Cultural', 'Water Sports', 'Hiking', 'Beach', 'Historical'].map((type) {
                          final isSelected = _filters['adventureType'] == type;
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                _filters['adventureType'] = _filters['adventureType'] == type ? '' : type;
                              });
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                              decoration: BoxDecoration(
                                color: isSelected ? const Color(0xFF3B82F6) : Colors.white,
                                border: Border.all(color: const Color(0xFFE5E7EB)),
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Text(
                                type,
                                style: TextStyle(
                                  color: isSelected ? Colors.white : const Color(0xFF6B7280),
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),

                    // Group Size
                    _buildFilterSection(
                      'Group Size',
                      Wrap(
                        spacing: 8,
                        children: ['Private', 'Small Group', 'Large Group', 'Custom'].map((size) {
                          final isSelected = _filters['groupSize'] == size;
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                _filters['groupSize'] = _filters['groupSize'] == size ? '' : size;
                              });
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                              decoration: BoxDecoration(
                                color: isSelected ? const Color(0xFF3B82F6) : Colors.white,
                                border: Border.all(color: const Color(0xFFE5E7EB)),
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Text(
                                size,
                                style: TextStyle(
                                  color: isSelected ? Colors.white : const Color(0xFF6B7280),
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),

                    // Duration
                    _buildFilterSection(
                      'Duration',
                      Wrap(
                        spacing: 8,
                        children: ['Half Day', 'Full Day', '2-3 Days', '4-7 Days', '1+ Weeks'].map((duration) {
                          final isSelected = _filters['duration'] == duration;
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                _filters['duration'] = _filters['duration'] == duration ? '' : duration;
                              });
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                              decoration: BoxDecoration(
                                color: isSelected ? const Color(0xFF3B82F6) : Colors.white,
                                border: Border.all(color: const Color(0xFFE5E7EB)),
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Text(
                                duration,
                                style: TextStyle(
                                  color: isSelected ? Colors.white : const Color(0xFF6B7280),
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),

                    // Services
                    _buildFilterSection(
                      'Services Included',
                      Wrap(
                        spacing: 8,
                        children: ['Accommodation', 'Meals', 'Transport', 'Guide', 'Equipment', 'Park Fees', 'Insurance'].map((service) {
                          final isSelected = (_filters['services'] as List<String>).contains(service);
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                final services = List<String>.from(_filters['services']);
                                if (services.contains(service)) {
                                  services.remove(service);
                                } else {
                                  services.add(service);
                                }
                                _filters['services'] = services;
                              });
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                              decoration: BoxDecoration(
                                color: isSelected ? const Color(0xFF3B82F6) : Colors.white,
                                border: Border.all(color: const Color(0xFFE5E7EB)),
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Text(
                                service,
                                style: TextStyle(
                                  color: isSelected ? Colors.white : const Color(0xFF6B7280),
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ],

                  const SizedBox(height: 24),

                  // Action Buttons
                  Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: resetFilters,
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            decoration: BoxDecoration(
                              border: Border.all(color: const Color(0xFFE5E7EB)),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: const Center(
                              child: Text(
                                'Reset',
                                style: TextStyle(
                                  color: Color(0xFF6B7280),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: GestureDetector(
                          onTap: applyFilters,
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            decoration: BoxDecoration(
                              color: const Color(0xFF3B82F6),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: const Center(
                              child: Text(
                                'Apply Filters',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildFilterSection(String title, Widget content) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Color(0xFF1A1A1A),
            ),
          ),
          const SizedBox(height: 8),
          content,
        ],
      ),
    );
  }

  Widget _buildTabButton(String tab, String label, IconData icon, bool isActive) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _activeTab = tab;
        });
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 2),
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
        decoration: BoxDecoration(
          color: isActive ? Colors.white : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
          boxShadow: isActive ? [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.1),
              blurRadius: 4,
              offset: const Offset(0, 2),
            )
          ] : null,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 16,
              color: isActive ? const Color(0xFF3B82F6) : const Color(0xFF6B7280),
            ),
            const SizedBox(width: 6),
            Text(
              label,
              style: TextStyle(
                fontSize: 13,
                color: isActive ? const Color(0xFF1A1A1A) : const Color(0xFF6B7280),
                fontWeight: isActive ? FontWeight.w600 : FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMapModal() {
    return Stack(
      children: [
        ModalBarrier(
          dismissible: true,
          color: Colors.black.withValues(alpha: 0.5),
          onDismiss: closeMapModal,
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          child: Material(
            color: Colors.white,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.8,
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  // Handle bar
                  Container(
                    width: 40,
                    height: 4,
                    decoration: BoxDecoration(
                      color: const Color(0xFFD1D5DB),
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                  const SizedBox(height: 20),
                  
                  // Header
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Services Nearby',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF1A1A1A),
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.close, color: Color(0xFF6B7280)),
                        onPressed: closeMapModal,
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  
                  // Map content
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: const Color(0xFFF3F4F6),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.map,
                            size: 48,
                            color: Color(0xFF9CA3AF),
                          ),
                          SizedBox(height: 16),
                          Text(
                            'Map View',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF6B7280),
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Interactive map showing nearby services',
                            style: TextStyle(
                              fontSize: 14,
                              color: Color(0xFF9CA3AF),
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildItemCard(Map<String, dynamic> item) {
    return GestureDetector(
      onTap: () => handleProfileClick(item['id']),
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.1),
              blurRadius: 10,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
              child: Stack(
                children: [
                  Image.network(
                    item['avatar'],
                    width: double.infinity,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                  // Verified badge
                  if (item['verified'])
                    Positioned(
                      top: 12,
                      right: 12,
                      child: Container(
                        padding: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Icon(
                          Icons.verified,
                          color: Colors.white,
                          size: 16,
                        ),
                      ),
                    ),
                  // Price badge
                  Positioned(
                    bottom: 12,
                    left: 12,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: Colors.black.withValues(alpha: 0.8),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Text(
                        'TSh ${item['price']}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            
            // Content
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title and rating
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          item['name'],
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Colors.black87,
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.star,
                            color: Colors.amber,
                            size: 16,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            item['rating'].toString(),
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Colors.black87,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  
                  const SizedBox(height: 8),
                  
                  // Provider info
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 12,
                        backgroundImage: NetworkImage(item['providerAvatar']),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          item['providerName'],
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ],
                  ),
                  
                  const SizedBox(height: 8),
                  
                  // Location
                  Row(
                    children: [
                      const Icon(
                        Icons.location_on,
                        color: Colors.grey,
                        size: 16,
                      ),
                      const SizedBox(width: 4),
                      Expanded(
                        child: Text(
                          item['location'],
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ],
                  ),
                  
                  const SizedBox(height: 8),
                  
                  // Amenities
                  Wrap(
                    spacing: 8,
                    runSpacing: 4,
                    children: (item['amenities'] as List<dynamic>).take(3).map<Widget>((amenity) {
                      return Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: Colors.grey[100],
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          amenity.toString(),
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                  
                  const SizedBox(height: 12),
                  
                  // Description
                  Text(
                    item['description'],
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                      height: 1.4,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
