import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ionicons/ionicons.dart';

class EroticPage extends StatefulWidget {
  const EroticPage({super.key});

  @override
  State<EroticPage> createState() => EroticPageState();
}

class EroticPageState extends State<EroticPage> {
  String activeTab = 'match';
  String searchQuery = '';
  Set<String> savedProviders = {};
  Set<String> bookedProviders = {};
  Set<String> acceptedBookings = {};
  bool showMapModal = false;
  bool showFilterModal = false;
  
  late ScrollController _scrollController;
  
  Map<String, dynamic> filters = {
    'priceRange': [0, 1000],
    'distance': 10,
    'ageRange': [18, 60],
    'services': <String>[],
    'orientation': <String>[],
    'hobbies': <String>{},
    'rating': 0,
    'onlineOnly': false,
    'verifiedOnly': false
  };

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void scrollToTop() {
    if (_scrollController.hasClients) {
      _scrollController.animateTo(
        0,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }



  final List<Map<String, dynamic>> wellnessProviders = [
    {
      'id': '1',
      'name': 'Emma Thompson',
      'avatar': 'https://images.unsplash.com/photo-1517841905240-472988babdf9?w=400&h=300&fit=crop&crop=face&auto=format',
      'rating': 4.8,
      'reviews': 127,
      'price': '30,000',
      'priceType': 'hour',
      'location': 'Downtown Spa',
      'distance': '0.5km',
      'services': ['Body to Body Massage', 'Scrub Massage', 'Waxing Services', 'Nuru Massage', 'Tantra Massage', 'Happy Ending Massage', 'Four Hands Massage', 'Sensual Massage', 'Erotic Massage', 'Couples Massage', 'Prostate Massage', 'Breast Massage', 'Foot Fetish Massage', 'BDSM Massage', 'Roleplay Massage'],
      'orientation': 'Straight',
      'age': 28,
      'height': '5\'6"',
      'weight': '130 lbs',
      'languages': ['English', 'Spanish'],
      'verified': true,
      'online': true,
      'coordinates': {'lat': 40.7128, 'lng': -74.0060},
      'description': 'Professional massage therapist with 5+ years experience. Specializing in therapeutic and relaxation massages.',
      'availability': 'Mon-Sun 9AM-9PM',
      'incall': true,
      'outcall': true
    },
    {
      'id': '2',
      'name': 'Sophia Chen',
      'avatar': 'https://images.unsplash.com/photo-1494790108755-2616b612b786?w=400&h=300&fit=crop&crop=face&auto=format',
      'rating': 4.9,
      'reviews': 89,
      'price': '35,000',
      'priceType': 'hour',
      'location': 'Uptown Wellness',
      'distance': '1.2km',
      'services': ['Body to Body Massage', 'Scrub Massage', 'Waxing Services', 'Nuru Massage', 'Tantra Massage', 'Happy Ending Massage', 'Four Hands Massage', 'Sensual Massage', 'Erotic Massage', 'Couples Massage', 'Prostate Massage', 'Breast Massage', 'Foot Fetish Massage', 'BDSM Massage', 'Roleplay Massage'],
      'orientation': 'Bisexual',
      'age': 25,
      'height': '5\'4"',
      'weight': '125 lbs',
      'languages': ['English', 'Mandarin'],
      'verified': true,
      'online': false,
      'coordinates': {'lat': 40.7589, 'lng': -73.9851},
      'description': 'Certified massage therapist offering traditional Thai and modern therapeutic techniques.',
      'availability': 'Mon-Sat 10AM-8PM',
      'incall': true,
      'outcall': false
    },
    {
      'id': '3',
      'name': 'Mia Rodriguez',
      'avatar': 'https://images.unsplash.com/photo-1524504388940-b1c1722653e1?w=400&h=300&fit=crop&crop=face&auto=format',
      'rating': 4.7,
      'reviews': 203,
      'price': '25,000',
      'priceType': 'hour',
      'location': 'Mobile Service',
      'distance': '2.1km',
      'services': ['Body to Body Massage', 'Scrub Massage', 'Waxing Services', 'Nuru Massage', 'Tantra Massage', 'Happy Ending Massage', 'Four Hands Massage', 'Sensual Massage', 'Erotic Massage', 'Couples Massage', 'Prostate Massage', 'Breast Massage', 'Foot Fetish Massage', 'BDSM Massage', 'Roleplay Massage'],
      'orientation': 'Lesbian',
      'age': 30,
      'height': '5\'7"',
      'weight': '135 lbs',
      'languages': ['English', 'Portuguese'],
      'verified': true,
      'online': true,
      'coordinates': {'lat': 40.7505, 'lng': -73.9934},
      'description': 'Mobile massage therapist bringing relaxation to your home. Certified with 5+ years experience.',
      'availability': 'Mon-Sun 8AM-10PM',
      'incall': false,
      'outcall': true
    }
  ];

  final List<Map<String, dynamic>> escortProviders = [
    {
      'id': '4',
      'name': 'Luna Black',
      'avatar': 'https://images.unsplash.com/photo-1539571696357-5a69c17a67c6?w=400&h=300&fit=crop&crop=face&auto=format',
      'rating': 4.9,
      'reviews': 156,
      'price': '50,000',
      'priceType': 'round',
      'location': 'Luxury Hotel',
      'distance': '0.8km',
      'services': ['Normal Sex', 'Blowjob', 'Anal Sex', 'Anal Fingering', 'Anal Toys', 'Rimming', 'Prostate Massage', 'Threesomes', 'Group Sex', 'Pegging', 'Double Penetration', 'Fisting', 'Roleplay', 'Nipple Play', 'Submission', 'Handjob', 'Fingering', 'Mutual Masturbation', 'Massage with Happy Ending', 'Girlfriend Experience', 'Strap-on Play', 'Couple'],
      'orientation': 'Straight',
      'age': 26,
      'height': '5\'8"',
      'weight': '120 lbs',
      'languages': ['English', 'French'],
      'verified': true,
      'online': true,
      'coordinates': {'lat': 40.7589, 'lng': -73.9851},
      'description': 'High-class escort offering discreet and professional companionship services.',
      'availability': 'Mon-Sun 24/7',
      'incall': true,
      'outcall': true
    },
    {
      'id': '5',
      'name': 'Isabella Johnson',
      'avatar': 'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?w=400&h=300&fit=crop&crop=face&auto=format',
      'rating': 4.8,
      'reviews': 234,
      'price': '40,000',
      'priceType': 'round',
      'location': 'Private Residence',
      'distance': '1.5km',
      'services': ['Normal Sex', 'Blowjob', 'Anal Sex', 'Anal Fingering', 'Anal Toys', 'Rimming', 'Prostate Massage', 'Threesomes', 'Group Sex', 'Pegging', 'Double Penetration', 'Fisting', 'Roleplay', 'Nipple Play', 'Submission', 'Handjob', 'Fingering', 'Mutual Masturbation', 'Massage with Happy Ending', 'Girlfriend Experience', 'Strap-on Play', 'Couple'],
      'orientation': 'Bisexual',
      'age': 29,
      'height': '5\'5"',
      'weight': '130 lbs',
      'languages': ['English', 'Spanish'],
      'verified': true,
      'online': false,
      'coordinates': {'lat': 40.7589, 'lng': -73.9934},
      'description': 'Experienced escort specializing in intimate services and fantasy fulfillment.',
      'availability': 'Mon-Sat 6PM-2AM',
      'incall': true,
      'outcall': true
    },
    {
      'id': '6',
      'name': 'Aria Martinez',
      'avatar': 'https://images.unsplash.com/photo-1544005313-94ddf0286df2?w=400&h=300&fit=crop&crop=face&auto=format',
      'rating': 4.7,
      'reviews': 189,
      'price': '35,000',
      'priceType': 'round',
      'location': 'Downtown Area',
      'distance': '0.3km',
      'services': ['Normal Sex', 'Blowjob', 'Anal Sex', 'Anal Fingering', 'Anal Toys', 'Rimming', 'Prostate Massage', 'Threesomes', 'Group Sex', 'Pegging', 'Double Penetration', 'Fisting', 'Roleplay', 'Nipple Play', 'Submission', 'Handjob', 'Fingering', 'Mutual Masturbation', 'Massage with Happy Ending', 'Girlfriend Experience', 'Strap-on Play', 'Couple'],
      'orientation': 'Straight',
      'age': 24,
      'height': '5\'6"',
      'weight': '125 lbs',
      'languages': ['English', 'Italian'],
      'verified': true,
      'online': true,
      'coordinates': {'lat': 40.7128, 'lng': -74.0060},
      'description': 'Young and energetic escort offering girlfriend experience and companionship.',
      'availability': 'Mon-Sun 10AM-12AM',
      'incall': true,
      'outcall': true
    }
  ];

  final List<Map<String, dynamic>> matchProfiles = [
    {
      'id': '7',
      'name': 'Sarah Wilson',
      'avatar': 'https://images.unsplash.com/photo-1494790108755-2616b612b786?w=400&h=300&fit=crop&crop=face&auto=format',
      'rating': 4.8,
      'reviews': 45,
      'price': 'Free',
      'priceType': 'dating',
      'location': 'New York, NY',
      'distance': '2.3km',
      'services': ['Dating', 'Relationship', 'Companionship', 'Travel Partner', 'Dinner Date', 'Movie Night', 'Coffee Meet', 'Weekend Getaway', 'Long-term Relationship', 'Marriage', 'Family Planning', 'Shared Interests', 'Emotional Support', 'Life Partner', 'Soulmate'],
      'orientation': 'Straight',
      'age': 27,
      'sex': 'Female',
      'height': '5\'6"',
      'weight': '130 lbs',
      'languages': ['English', 'Spanish'],
      'verified': true,
      'online': true,
      'coordinates': {'lat': 40.7128, 'lng': -74.0060},
      'about': 'Love exploring new places and meeting interesting people. Looking for meaningful connections.',
      'whatSheNeeds': 'Seeking a genuine, caring partner who values communication and shared experiences.',
      'hobbies': ['Travel', 'Photography', 'Yoga', 'Cooking', 'Reading', 'Hiking'],
      'availability': 'Mon-Sun 6PM-10PM',
      'incall': false,
      'outcall': true
    },
    {
      'id': '8',
      'name': 'Jessica Brown',
      'avatar': 'https://images.unsplash.com/photo-1524504388940-b1c1722653e1?w=400&h=300&fit=crop&crop=face&auto=format',
      'rating': 4.9,
      'reviews': 32,
      'price': 'Free',
      'priceType': 'dating',
      'location': 'Brooklyn, NY',
      'distance': '1.8km',
      'services': ['Dating', 'Relationship', 'Companionship', 'Travel Partner', 'Dinner Date', 'Movie Night', 'Coffee Meet', 'Weekend Getaway', 'Long-term Relationship', 'Marriage', 'Family Planning', 'Shared Interests', 'Emotional Support', 'Life Partner', 'Soulmate'],
      'orientation': 'Bisexual',
      'age': 25,
      'sex': 'Female',
      'height': '5\'4"',
      'weight': '125 lbs',
      'languages': ['English', 'French'],
      'verified': true,
      'online': false,
      'coordinates': {'lat': 40.7589, 'lng': -73.9851},
      'about': 'Passionate about art and music. Seeking someone to share adventures with.',
      'whatSheNeeds': 'Looking for someone who appreciates creativity and has a sense of adventure.',
      'hobbies': ['Art', 'Music', 'Hiking', 'Reading', 'Painting', 'Dancing'],
      'availability': 'Mon-Sun 7PM-11PM',
      'incall': false,
      'outcall': true
    },
    {
      'id': '9',
      'name': 'Amanda Davis',
      'avatar': 'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?w=400&h=300&fit=crop&crop=face&auto=format',
      'rating': 4.7,
      'reviews': 28,
      'price': 'Free',
      'priceType': 'dating',
      'location': 'Manhattan, NY',
      'distance': '0.9km',
      'services': ['Dating', 'Relationship', 'Companionship', 'Travel Partner', 'Dinner Date', 'Movie Night', 'Coffee Meet', 'Weekend Getaway', 'Long-term Relationship', 'Marriage', 'Family Planning', 'Shared Interests', 'Emotional Support', 'Life Partner', 'Soulmate'],
      'orientation': 'Straight',
      'age': 28,
      'sex': 'Female',
      'height': '5\'7"',
      'weight': '135 lbs',
      'languages': ['English', 'German'],
      'verified': true,
      'online': true,
      'coordinates': {'lat': 40.7505, 'lng': -73.9934},
      'about': 'Professional by day, adventurer by night. Looking for someone to explore life with. Seeking a partner who balances ambition with fun and values personal growth.',
      'whatSheNeeds': '',
      'hobbies': ['Adventure', 'Fitness', 'Dancing', 'Travel', 'Rock Climbing', 'Meditation'],
      'availability': 'Mon-Sun 6PM-10PM',
      'incall': false,
      'outcall': true
    }
  ];

  void toggleSave(String providerId) {
    setState(() {
      if (savedProviders.contains(providerId)) {
        savedProviders.remove(providerId);
      } else {
        savedProviders.add(providerId);
      }
    });
  }

  void toggleBook(String providerId) {
    setState(() {
      if (bookedProviders.contains(providerId)) {
        bookedProviders.remove(providerId);
        acceptedBookings.remove(providerId);
      } else {
        bookedProviders.add(providerId);
        // Simulate booking acceptance after 2 seconds
        Future.delayed(const Duration(seconds: 2), () {
          if (mounted) {
            setState(() {
              acceptedBookings.add(providerId);
            });
          }
        });
      }
    });
  }

  void handleMessage(String providerId) {
    // Navigate to messages or open chat
    print('Opening chat with provider: $providerId');
  }

  void handleSearch() {
    // Handle search functionality
  }

  void handleFilter() {
    setState(() {
      showFilterModal = true;
    });
  }

  void closeFilterModal() {
    setState(() {
      showFilterModal = false;
    });
  }

  void applyFilters() {
    // Apply filters logic here
    closeFilterModal();
  }

  void resetFilters() {
    setState(() {
      filters = {
        'priceRange': [0, 1000],
        'distance': 10,
        'ageRange': [18, 60],
        'services': <String>[],
        'orientation': <String>[],
        'rating': 0,
        'onlineOnly': false,
        'verifiedOnly': false
      };
    });
  }

  void handleMapView() {
    setState(() {
      showMapModal = true;
    });
  }

  void closeMapModal() {
    setState(() {
      showMapModal = false;
    });
  }

  void handleProfileClick(String providerId) {
    // Navigate to provider profile
    print('Navigate to provider: $providerId');
  }

  List<Map<String, dynamic>> getProviders() {
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
  }





  @override
  Widget build(BuildContext context) {
    final providers = getProviders();
    
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      body: Stack(
        children: [
          CustomScrollView(
            controller: _scrollController,
            slivers: [
              // Fixed Header
              SliverToBoxAdapter(
                child: Container(
                  color: Colors.white,
                  padding: const EdgeInsets.fromLTRB(16, 60, 16, 16),
                  child: Column(
                    children: [
                      // Tabs
                      Container(
                        decoration: BoxDecoration(
                          color: const Color(0xFFF3F4F6),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: const EdgeInsets.all(4),
                        child: Row(
                          children: [
                            Expanded(
                              child: _buildTabButton(
                                'match',
                                'Match',
                                FontAwesomeIcons.heart,
                                activeTab == 'match',
                              ),
                            ),
                            Expanded(
                              child: _buildTabButton(
                                'wellness',
                                'Wellness',
                                Icons.spa,
                                activeTab == 'wellness',
                              ),
                            ),
                            Expanded(
                              child: _buildTabButton(
                                'escorts',
                                'Escorts',
                                Icons.diamond,
                                activeTab == 'escorts',
                              ),
                            ),
                          ],
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
                                    searchQuery = value;
                                  });
                                },
                                decoration: InputDecoration(
                                  hintText: activeTab == 'match' ? 'Search matches...' : 'Search providers...',
                                  hintStyle: const TextStyle(color: Color(0xFF9CA3AF)),
                                  prefixIcon: const Icon(Icons.search, color: Color(0xFF9CA3AF)),
                                  border: InputBorder.none,
                                  contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
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
              ),
              
              // Content
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    final provider = providers[index];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: _buildProviderCard(provider),
                    );
                  },
                  childCount: providers.length,
                ),
              ),
            ],
          ),
          
          // Filter Modal
          if (showFilterModal) _buildFilterModal(),
          
          // Map Modal
          if (showMapModal) _buildMapModal(),
        ],
      ),
    );
  }

  Widget _buildTabButton(String tab, String label, IconData icon, bool isActive) {
    return GestureDetector(
      onTap: () {
        setState(() {
          activeTab = tab;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        decoration: BoxDecoration(
          color: isActive ? Colors.white : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
          boxShadow: isActive ? [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 4,
              offset: const Offset(0, 2),
            )
          ] : null,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 16,
              color: isActive ? const Color(0xFF667EEA) : const Color(0xFF6B7280),
            ),
            const SizedBox(width: 8),
            Text(
              label,
              style: TextStyle(
                color: isActive ? const Color(0xFF1A1A1A) : const Color(0xFF6B7280),
                fontWeight: isActive ? FontWeight.w600 : FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProviderCard(Map<String, dynamic> provider) {
    final isMatch = activeTab == 'match';
    
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 6,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Profile Info Section
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () => handleProfileClick(provider['id']),
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: const Color(0xFFE5E7EB), width: 2),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(24),
                      child: Image.network(
                        provider['avatar'],
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            color: const Color(0xFFE0E0E0),
                            child: const Icon(Icons.person, color: Color(0xFF666666)),
                          );
                        },
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            provider['name'],
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF1A1A1A),
                            ),
                          ),
                          if (provider['verified']) ...[
                            const SizedBox(width: 8),
                            const Icon(Icons.verified, color: Color(0xFF667EEA), size: 16),
                          ],
                        ],
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '${provider['location']} • ${provider['distance']}',
                        style: const TextStyle(
                          fontSize: 14,
                          color: Color(0xFF6B7280),
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.more_horiz, color: Color(0xFF666666)),
                  onPressed: () {},
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                ),
              ],
            ),
          ),

          // Main Image
          Container(
            height: 280,
            width: double.infinity,
            child: Stack(
              children: [
                Image.network(
                  provider['avatar'],
                  width: double.infinity,
                  height: 350,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      color: const Color(0xFFE0E0E0),
                      child: const Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.image_not_supported, color: Color(0xFF666666), size: 48),
                            SizedBox(height: 8),
                            Text('Image not available', style: TextStyle(color: Color(0xFF666666))),
                          ],
                        ),
                      ),
                    );
                  },
                ),
                if (provider['online'])
                  Positioned(
                    top: 12,
                    right: 12,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: const Color(0xFF10B981),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Text(
                        'ONLINE',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),

          // Like and Save Icons
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () => toggleSave(provider['id']),
                  child: Icon(
                    savedProviders.contains(provider['id']) ? FontAwesomeIcons.heart : FontAwesomeIcons.heart,
                    size: 26,
                    color: savedProviders.contains(provider['id']) ? const Color(0xFFEF4444) : const Color(0xFF6B7280),
                  ),
                ),
                const SizedBox(width: 16),
                const Icon(
                  FontAwesomeIcons.bookmark,
                  size: 24,
                  color: Color(0xFF6B7280),
                ),
              ],
            ),
          ),

          // Provider Details
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (!isMatch) ...[
                  // Age and Rating
                  Row(
                    children: [
                      Text(
                        'Age: ${provider['age']} years',
                        style: const TextStyle(
                          fontSize: 14,
                          color: Color(0xFF6B7280),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Row(
                        children: [
                          const Icon(Icons.star, color: Color(0xFFFBBF24), size: 12),
                          const SizedBox(width: 4),
                          Text(
                            '${provider['rating']}',
                            style: const TextStyle(
                              fontSize: 14,
                              color: Color(0xFF6B7280),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),

                  // Sexual Orientation
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: const Color(0xFFDCFCE7),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      provider['orientation'],
                      style: const TextStyle(
                        color: Color(0xFF166534),
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),

                  // About
                  Text(
                    provider['description'],
                    style: const TextStyle(
                      fontSize: 14,
                      color: Color(0xFF6B7280),
                      height: 1.4,
                    ),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),

                  // Services
                  const Text(
                    'Services:',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF1A1A1A),
                    ),
                  ),
                  const SizedBox(height: 6),
                  Wrap(
                    spacing: 4,
                    runSpacing: 4,
                    children: [
                      ...provider['services'].take(activeTab == 'escorts' ? 6 : 3).map((service) {
                        final isSexualService = activeTab == 'escorts' && [
                          'Normal Sex', 'Blowjob', 'Anal Sex', 'Anal Fingering', 'Anal Toys', 
                          'Rimming', 'Prostate Massage', 'Threesomes', 'Group Sex', 'Pegging', 
                          'Double Penetration', 'Fisting', 'Roleplay', 'Nipple Play', 'Submission', 
                          'Handjob', 'Fingering', 'Mutual Masturbation', 'Massage with Happy Ending', 
                          'Girlfriend Experience', 'Strap-on Play', 'Couple'
                        ].contains(service);
                        
                        final isMassageService = activeTab == 'wellness' && [
                          'Body to Body Massage', 'Scrub Massage', 'Waxing Services', 'Nuru Massage', 
                          'Tantra Massage', 'Happy Ending Massage', 'Four Hands Massage', 'Sensual Massage', 
                          'Erotic Massage', 'Couples Massage', 'Prostate Massage', 'Breast Massage', 
                          'Foot Fetish Massage', 'BDSM Massage', 'Roleplay Massage'
                        ].contains(service);
                        
                        return Container(
                          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                          decoration: BoxDecoration(
                            color: (isSexualService || isMassageService) ? const Color(0xFFDBEAFE) : const Color(0xFFF3F4F6),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            service,
                            style: TextStyle(
                              color: (isSexualService || isMassageService) ? const Color(0xFF1E40AF) : const Color(0xFF6B7280),
                              fontSize: 11,
                              fontWeight: (isSexualService || isMassageService) ? FontWeight.w600 : FontWeight.w400,
                            ),
                          ),
                        );
                      }),
                      if (provider['services'].length > (activeTab == 'escorts' ? 6 : 3))
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                          decoration: BoxDecoration(
                            color: const Color(0xFFF3F4F6),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            '+${provider['services'].length - (activeTab == 'escorts' ? 6 : 3)} more',
                            style: const TextStyle(
                              color: Color(0xFF6B7280),
                              fontSize: 11,
                            ),
                          ),
                        ),
                    ],
                  ),
                  const SizedBox(height: 12),

                  // Languages
                  Text(
                    'Languages: ${provider['languages'].join(', ')}',
                    style: const TextStyle(
                      fontSize: 14,
                      color: Color(0xFF6B7280),
                    ),
                  ),
                  const SizedBox(height: 12),

                  // Price
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Tsh ${provider['price']}',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF3B82F6),
                          ),
                        ),
                        TextSpan(
                          text: ' / ${provider['priceType']}',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF6B7280),
                          ),
                        ),
                      ],
                    ),
                  ),
                ] else ...[
                  // Match-specific content
                  const SizedBox(height: 16),
                  
                  // Age, Sex, Height
                  Text(
                    'Age: ${provider['age']} • Sex: ${provider['sex']} • Height: ${provider['height']}',
                    style: const TextStyle(
                      fontSize: 14,
                      color: Color(0xFF6B7280),
                    ),
                  ),
                  const SizedBox(height: 12),

                  // Sexual Orientation
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: const Color(0xFFDCFCE7),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      provider['orientation'],
                      style: const TextStyle(
                        color: Color(0xFF166534),
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),

                  // About
                  Text(
                    provider['about'],
                    style: const TextStyle(
                      fontSize: 14,
                      color: Color(0xFF6B7280),
                      height: 1.4,
                    ),
                  ),
                  const SizedBox(height: 12),

                  // Services and Hobbies
                  Wrap(
                    spacing: 4,
                    runSpacing: 4,
                    children: [
                      ...provider['services'].take(3).map((service) {
                        final isDatingService = [
                          'Dating', 'Relationship', 'Companionship', 'Travel Partner', 'Dinner Date', 
                          'Movie Night', 'Coffee Meet', 'Weekend Getaway', 'Long-term Relationship', 
                          'Marriage', 'Family Planning', 'Shared Interests', 'Emotional Support', 
                          'Life Partner', 'Soulmate'
                        ].contains(service);
                        
                        return Container(
                          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                          decoration: BoxDecoration(
                            color: isDatingService ? const Color(0xFFDBEAFE) : const Color(0xFFF3F4F6),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            service,
                            style: TextStyle(
                              color: isDatingService ? const Color(0xFF1E40AF) : const Color(0xFF6B7280),
                              fontSize: 11,
                              fontWeight: isDatingService ? FontWeight.w600 : FontWeight.w400,
                            ),
                          ),
                        );
                      }),
                      
                      ...provider['hobbies'].map((hobby) => Container(
                        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                        decoration: BoxDecoration(
                          color: const Color(0xFFDBEAFE),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          hobby,
                          style: const TextStyle(
                            color: Color(0xFF1E40AF),
                            fontSize: 11,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      )),
                      
                      if (provider['services'].length > 3)
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                          decoration: BoxDecoration(
                            color: const Color(0xFFF3F4F6),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            '+${provider['services'].length - 3} more',
                            style: const TextStyle(
                              color: Color(0xFF6B7280),
                              fontSize: 11,
                            ),
                          ),
                        ),
                    ],
                  ),
                  const SizedBox(height: 16),

                  // Languages
                  Text(
                    'Languages: ${provider['languages'].join(', ')}',
                    style: const TextStyle(
                      fontSize: 14,
                      color: Color(0xFF6B7280),
                    ),
                  ),
                  const SizedBox(height: 12),
                ],

                // Booking Button
                Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onTap: () {
                      if (acceptedBookings.contains(provider['id'])) {
                        // Navigate to messages page
                        handleMessage(provider['id']);
                      } else if (bookedProviders.contains(provider['id'])) {
                        // Change to pending state
                        toggleBook(provider['id']);
                      } else {
                        // Initial booking
                        toggleBook(provider['id']);
                      }
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                      decoration: BoxDecoration(
                        color: acceptedBookings.contains(provider['id']) 
                          ? const Color(0xFF10B981)
                          : bookedProviders.contains(provider['id'])
                            ? const Color(0xFFF59E0B)
                            : const Color(0xFF3B82F6),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        acceptedBookings.contains(provider['id']) ? 'Message' 
                          : bookedProviders.contains(provider['id']) ? 'Pending' 
                          : isMatch ? 'Connect' : 'Book Now',
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterModal() {
    return Container(
      color: Colors.black.withOpacity(0.8),
      child: SafeArea(
        child: Container(
          margin: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Header
              Container(
                padding: const EdgeInsets.all(24),
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: Color(0xFFE5E7EB)),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Filters - ${activeTab[0].toUpperCase() + activeTab.substring(1)}',
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF1A1A1A),
                      ),
                    ),
                    GestureDetector(
                      onTap: closeFilterModal,
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: const Color(0xFFF3F4F6),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Icon(
                          Icons.close,
                          color: Color(0xFF6B7280),
                          size: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              
              // Filter Content
              Flexible(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Price Range (only for wellness and escorts)
                      if (activeTab == 'wellness' || activeTab == 'escorts')
                        _buildFilterSection(
                          'Price Range',
                          Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('\$${filters['priceRange'][0]}'),
                                  Text('\$${filters['priceRange'][1]}'),
                                ],
                              ),
                              RangeSlider(
                                values: RangeValues(
                                  filters['priceRange'][0].toDouble(),
                                  filters['priceRange'][1].toDouble(),
                                ),
                                min: 0,
                                max: 1000,
                                divisions: 20,
                                labels: RangeLabels(
                                  '\$${filters['priceRange'][0]}',
                                  '\$${filters['priceRange'][1]}',
                                ),
                                onChanged: (values) {
                                  setState(() {
                                    filters['priceRange'] = [values.start.round(), values.end.round()];
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                      
                      // Distance
                      _buildFilterSection(
                        'Distance (km)',
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('0 km'),
                                Text('${filters['distance']} km'),
                              ],
                            ),
                            Slider(
                              value: filters['distance'].toDouble(),
                              min: 1,
                              max: 50,
                              divisions: 49,
                              label: '${filters['distance']} km',
                              onChanged: (value) {
                                setState(() {
                                  filters['distance'] = value.round();
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                      
                      // Age Range
                      _buildFilterSection(
                        'Age Range',
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('${filters['ageRange'][0]} years'),
                                Text('${filters['ageRange'][1]} years'),
                              ],
                            ),
                            RangeSlider(
                              values: RangeValues(
                                filters['ageRange'][0].toDouble(),
                                filters['ageRange'][1].toDouble(),
                              ),
                              min: 18,
                              max: 60,
                              divisions: 42,
                              labels: RangeLabels(
                                '${filters['ageRange'][0]}',
                                '${filters['ageRange'][1]}',
                              ),
                              onChanged: (values) {
                                setState(() {
                                  filters['ageRange'] = [values.start.round(), values.end.round()];
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                      
                      // Services (tab-specific)
                      if (activeTab == 'escorts' || activeTab == 'wellness')
                        _buildFilterSection(
                          'Services',
                          Wrap(
                            spacing: 8,
                            runSpacing: 8,
                            children: _getServicesForTab().map((service) {
                              final isSelected = filters['services'].contains(service);
                              return GestureDetector(
                                onTap: () {
                                  setState(() {
                                    if (isSelected) {
                                      filters['services'].remove(service);
                                    } else {
                                      filters['services'].add(service);
                                    }
                                  });
                                },
                                child: Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                                  decoration: BoxDecoration(
                                    color: isSelected ? const Color(0xFF667EEA) : const Color(0xFFF3F4F6),
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(
                                      color: isSelected ? const Color(0xFF667EEA) : const Color(0xFFE5E7EB),
                                    ),
                                  ),
                                  child: Text(
                                    service,
                                    style: TextStyle(
                                      color: isSelected ? Colors.white : const Color(0xFF6B7280),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                      
                      // Hobbies (for match tab)
                      if (activeTab == 'match')
                        _buildFilterSection(
                          'Hobbies & Interests',
                          Wrap(
                            spacing: 8,
                            runSpacing: 8,
                            children: [
                              'Travel', 'Music', 'Sports', 'Reading', 'Cooking', 'Gaming',
                              'Art', 'Photography', 'Dancing', 'Hiking', 'Movies', 'Fitness',
                              'Technology', 'Fashion', 'Food', 'Pets', 'Nature', 'Fashion'
                            ].map((hobby) {
                              final isSelected = filters['hobbies']?.contains(hobby) ?? false;
                              return GestureDetector(
                                onTap: () {
                                  setState(() {
                                    if (filters['hobbies'] == null) {
                                      filters['hobbies'] = <String>{};
                                    }
                                    if (isSelected) {
                                      filters['hobbies']!.remove(hobby);
                                    } else {
                                      filters['hobbies']!.add(hobby);
                                    }
                                  });
                                },
                                child: Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                                  decoration: BoxDecoration(
                                    color: isSelected ? const Color(0xFF667EEA) : const Color(0xFFF3F4F6),
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(
                                      color: isSelected ? const Color(0xFF667EEA) : const Color(0xFFE5E7EB),
                                    ),
                                  ),
                                  child: Text(
                                    hobby,
                                    style: TextStyle(
                                      color: isSelected ? Colors.white : const Color(0xFF6B7280),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                      
                      // Orientation (for escorts)
                      if (activeTab == 'escorts')
                        _buildFilterSection(
                          'Orientation',
                          Wrap(
                            spacing: 8,
                            runSpacing: 8,
                            children: ['Straight', 'Lesbian', 'Bisexual'].map((orientation) {
                              final isSelected = filters['orientation'].contains(orientation);
                              return GestureDetector(
                                onTap: () {
                                  setState(() {
                                    if (isSelected) {
                                      filters['orientation'].remove(orientation);
                                    } else {
                                      filters['orientation'].add(orientation);
                                    }
                                  });
                                },
                                child: Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                                  decoration: BoxDecoration(
                                    color: isSelected ? const Color(0xFF667EEA) : const Color(0xFFF3F4F6),
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(
                                      color: isSelected ? const Color(0xFF667EEA) : const Color(0xFFE5E7EB),
                                    ),
                                  ),
                                  child: Text(
                                    orientation,
                                    style: TextStyle(
                                      color: isSelected ? Colors.white : const Color(0xFF6B7280),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                      
                      // Rating
                      _buildFilterSection(
                        'Minimum Rating',
                        Row(
                          children: [
                            ...List.generate(5, (index) {
                              final star = index + 1;
                              final isSelected = filters['rating'] >= star;
                              return GestureDetector(
                                onTap: () {
                                  setState(() {
                                    filters['rating'] = star;
                                  });
                                },
                                child: Icon(
                                  Icons.star,
                                  color: isSelected ? const Color(0xFFFBBF24) : const Color(0xFFD1D5DB),
                                  size: 24,
                                ),
                              );
                            }),
                            const SizedBox(width: 12),
                            Text(
                              '${filters['rating']}+ stars',
                              style: const TextStyle(
                                fontSize: 12,
                                color: Color(0xFF6B7280),
                              ),
                            ),
                          ],
                        ),
                      ),
                      
                      // Additional Filters
                      _buildFilterSection(
                        'Additional Filters',
                        Column(
                          children: [
                            _buildCheckboxFilter(
                              'Online only',
                              filters['onlineOnly'],
                              (value) {
                                setState(() {
                                  filters['onlineOnly'] = value;
                                });
                              },
                            ),
                            _buildCheckboxFilter(
                              'Verified only',
                              filters['verifiedOnly'],
                              (value) {
                                setState(() {
                                  filters['verifiedOnly'] = value;
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              
              // Action Buttons
              Container(
                padding: const EdgeInsets.all(24),
                decoration: const BoxDecoration(
                  border: Border(
                    top: BorderSide(color: Color(0xFFE5E7EB)),
                  ),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: resetFilters,
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          decoration: BoxDecoration(
                            border: Border.all(color: const Color(0xFFD1D5DB)),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Text(
                            'Reset',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xFF6B7280),
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
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
                            color: const Color(0xFF667EEA),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Text(
                            'Apply Filters',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMapModal() {
    return Stack(
      children: [
        ModalBarrier(
          dismissible: true,
          color: Colors.black.withOpacity(0.5),
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
                        'People Nearby',
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
                            'Interactive map showing nearby providers',
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
          const SizedBox(height: 12),
          content,
        ],
      ),
    );
  }

  Widget _buildCheckboxFilter(String label, bool value, Function(bool) onChanged) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          Checkbox(
            value: value,
            onChanged: (newValue) => onChanged(newValue ?? false),
                                      activeColor: const Color(0xFF667EEA),
          ),
          Text(
            label,
            style: const TextStyle(
              fontSize: 14,
              color: Color(0xFF1A1A1A),
            ),
          ),
        ],
      ),
    );
  }

  List<String> _getServicesForTab() {
    if (activeTab == 'escorts') {
      return [
        'Normal Sex', 'Blowjob', 'Anal Sex', 'Anal Fingering', 'Anal Toys',
        'Rimming', 'Prostate Massage', 'Threesomes', 'Group Sex', 'Pegging',
        'Double Penetration', 'Fisting', 'Roleplay', 'Nipple Play', 'Submission',
        'Handjob', 'Fingering', 'Mutual Masturbation', 'Massage with Happy Ending',
        'Girlfriend Experience', 'Strap-on Play', 'Couple'
      ];
    } else if (activeTab == 'wellness') {
      return [
        'Body to Body Massage', 'Scrub Massage', 'Waxing Services', 'Nuru Massage',
        'Tantra Massage', 'Happy Ending Massage', 'Four Hands Massage', 'Sensual Massage',
        'Erotic Massage', 'Couples Massage', 'Prostate Massage', 'Breast Massage',
        'Foot Fetish Massage', 'BDSM Massage', 'Roleplay Massage'
      ];
    }
    return [];
  }
}

