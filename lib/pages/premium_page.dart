import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PremiumPage extends StatefulWidget {
  const PremiumPage({super.key});

  @override
  State<PremiumPage> createState() => _PremiumPageState();
}

class _PremiumPageState extends State<PremiumPage> {
  String _selectedPlan = 'monthly';

  List<Map<String, dynamic>> get _plans {
    return [
      {
        'id': 'basic',
        'name': 'Basic',
        'price': _selectedPlan == 'monthly' ? 4.99 : 49.99,
        'period': _selectedPlan == 'monthly' ? 'month' : 'year',
        'features': [
          'Unlimited social networking',
          'Basic dating features',
          'Standard messaging',
          'Entertainment content',
          'Basic professional features',
          'Limited travel bookings',
          'Standard support'
        ],
        'popular': false,
        'icon': Icons.star,
        'iconColor': const Color(0xFF8b5cf6)
      },
      {
        'id': 'premium',
        'name': 'Premium',
        'price': _selectedPlan == 'monthly' ? 9.99 : 99.99,
        'period': _selectedPlan == 'monthly' ? 'month' : 'year',
        'features': [
          'Everything in Basic',
          'Advanced dating features',
          'Priority messaging',
          'Verified badge',
          'Professional dashboard',
          'Unlimited travel bookings',
          'Premium entertainment',
          'Advanced filters',
          'Multiple devices (4)',
          'Priority support'
        ],
        'popular': true,
        'icon': Icons.diamond,
        'iconColor': const Color(0xFFf59e0b)
      },
      {
        'id': 'vip',
        'name': 'VIP',
        'price': _selectedPlan == 'monthly' ? 19.99 : 199.99,
        'period': _selectedPlan == 'monthly' ? 'month' : 'year',
        'features': [
          'Everything in Premium',
          'VIP early access',
          'Exclusive content',
          'Personalized recommendations',
          'Unlimited devices',
          'VIP dating features',
          'Premium travel services',
          'Concierge support',
          'Priority customer support',
          'Exclusive events access'
        ],
        'popular': false,
        'icon': Icons.star,
        'iconColor': const Color(0xFF8b5cf6)
      }
    ];
  }

  final List<Map<String, dynamic>> _appFeatures = [
    {
      'icon': Icons.favorite,
      'iconColor': const Color(0xFFec4899),
      'title': 'Social & Dating',
      'description': 'Advanced matching, unlimited messaging, stories, reels, and social networking'
    },
    {
      'icon': Icons.business,
      'iconColor': const Color(0xFF3b82f6),
      'title': 'Professional Services',
      'description': 'Professional creator accounts, wellness, massage, escort services, and business tools'
    },
    {
      'icon': Icons.movie,
      'iconColor': const Color(0xFF10b981),
      'title': 'Entertainment',
      'description': 'Movies, TV shows, live sports, music, and exclusive entertainment content'
    },
    {
      'icon': Icons.explore,
      'iconColor': const Color(0xFFf59e0b),
      'title': 'Travel & Explore',
      'description': 'Hotels, car rentals, adventures, safaris, and travel booking services'
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFf8f9fa),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Container(
          margin: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.1),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => context.go('/'),
            iconSize: 20,
            padding: const EdgeInsets.all(8),
          ),
        ),
        title: const Text(
          'Premium',
          style: TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [


            // Plan Toggle
            Container(
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Row(
                children: [
                  _buildPlanToggle('monthly', 'Monthly'),
                  _buildPlanToggle('yearly', 'Yearly (Save 20%)'),
                ],
              ),
            ),

            // Plans
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: _plans.map((plan) => _buildPlanCard(plan)).toList(),
              ),
            ),


          ],
        ),
      ),
    );
  }

  Widget _buildPlanToggle(String plan, String label) {
    final isSelected = _selectedPlan == plan;
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            _selectedPlan = plan;
          });
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            color: isSelected ? const Color(0xFF667EEA) : Colors.transparent,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.grey[600],
              fontWeight: FontWeight.w600,
              fontSize: 14,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPlanCard(Map<String, dynamic> plan) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: plan['popular'] == true
            ? Border.all(color: const Color(0xFF667EEA), width: 2)
            : null,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Stack(
        children: [
          if (plan['popular'] == true)
            Positioned(
              top: 16,
              right: 16,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: const Color(0xFF667EEA),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Text(
                  'MOST POPULAR',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      plan['icon'],
                      color: plan['iconColor'],
                      size: 32,
                    ),
                    const SizedBox(width: 16),
                    Text(
                      plan['name'],
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      '\$${plan['price']}',
                      style: const TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF667EEA),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 4),
                      child: Text(
                        '/${plan['period']}',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey[600],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                ...(plan['features'] as List<String>).map((feature) => Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.check_circle,
                            color: Colors.green,
                            size: 20,
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Text(
                              feature,
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey[700],
                              ),
                            ),
                          ),
                        ],
                      ),
                    )),
                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      // Handle subscription
                      print('Subscribe to ${plan['name']}');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: plan['popular'] == true
                          ? const Color(0xFF667EEA)
                          : Colors.grey[200],
                      foregroundColor: plan['popular'] == true
                          ? Colors.white
                          : Colors.grey[700],
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text(
                      'Choose ${plan['name']}',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
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

  Widget _buildFeatureItem(Map<String, dynamic> feature) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: feature['iconColor'].withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              feature['icon'],
              color: feature['iconColor'],
              size: 24,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  feature['title'],
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  feature['description'],
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
