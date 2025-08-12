import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProfessionalPage extends StatefulWidget {
  const ProfessionalPage({super.key});

  @override
  State<ProfessionalPage> createState() => _ProfessionalPageState();
}

class _ProfessionalPageState extends State<ProfessionalPage> {
  String _selectedService = '';

  final List<Map<String, dynamic>> _serviceTypes = [
    {
      'id': 'accommodation',
      'title': 'Accommodation',
      'icon': Icons.bed,
      'description': 'Hotels, BnBs, vacation rentals',
      'color': const Color(0xFF667EEA)
    },
    {
      'id': 'adventure',
      'title': 'Adventures & Safaris',
      'icon': Icons.location_on,
      'description': 'Tours, safaris, travel experiences',
      'color': const Color(0xFF10b981)
    },
    {
      'id': 'car-rental',
      'title': 'Car Rental',
      'icon': Icons.directions_car,
      'description': 'Vehicle rentals and transport',
      'color': const Color(0xFFf59e0b)
    },
    {
      'id': 'erotic',
      'title': 'Erotic Services',
      'icon': Icons.favorite,
      'description': 'Wellness, massage, adult entertainment',
      'color': const Color(0xFFef4444)
    }
  ];

  void _handleServiceSelect(String serviceId) {
    setState(() {
      _selectedService = serviceId;
    });
    
    // Navigate to the appropriate registration page based on service type
    switch (serviceId) {
      case 'erotic':
        context.go('/erotic-registration');
        break;
      case 'accommodation':
        context.go('/accommodation-registration');
        break;
      case 'adventure':
        context.go('/adventure-registration');
        break;
      case 'car-rental':
        context.go('/car-rental-registration');
        break;
      default:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Professional',
          style: TextStyle(color: Color(0xFF1a1a1a)),
        ),
        leading: IconButton(
          onPressed: () => context.go('/profile'),
          icon: const Icon(Icons.arrow_back, color: Color(0xFF6b7280)),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'What type of service do you provide?',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Color(0xFF1a1a1a),
              ),
            ),
            const SizedBox(height: 20),
            
            // Service Cards Grid - exactly as in webapp
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 1.2,
                ),
                itemCount: _serviceTypes.length,
                itemBuilder: (context, index) {
                  final service = _serviceTypes[index];
                  final isSelected = _selectedService == service['id'];
                  
                  return GestureDetector(
                    onTap: () => _handleServiceSelect(service['id']),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: isSelected ? service['color'] : const Color(0xFFe5e7eb),
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(16),
                        color: isSelected ? service['color'].withOpacity(0.1) : Colors.white,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            service['icon'],
                            size: 32,
                            color: service['color'],
                          ),
                          const SizedBox(height: 12),
                          Text(
                            service['title'],
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF1a1a1a),
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
