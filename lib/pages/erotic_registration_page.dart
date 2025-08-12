import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class EroticRegistrationPage extends StatefulWidget {
  const EroticRegistrationPage({super.key});

  @override
  State<EroticRegistrationPage> createState() => _EroticRegistrationPageState();
}

class _EroticRegistrationPageState extends State<EroticRegistrationPage> {
  String _selectedCategory = '';
  bool _isVerified = false;

  final List<Map<String, dynamic>> _categories = [
    {
      'id': 'dating',
      'name': 'Dating',
      'icon': '💕',
      'description': 'Find meaningful connections and relationships',
      'requirements': ['Profile Photos', 'Personal Description', 'Interests & Hobbies', 'Relationship Goals']
    },
    {
      'id': 'massage',
      'name': 'Massage Services',
      'icon': '💆‍♀️',
      'description': 'Professional massage and wellness services',
      'requirements': ['Professional Photos', 'Service Description', 'Pricing Information', 'Certification (Optional)']
    },
    {
      'id': 'escort',
      'name': 'Companionship',
      'icon': '👠',
      'description': 'Companionship and escort services',
      'requirements': ['Professional Photos', 'Service Description', 'Pricing Information', 'Availability Schedule']
    }
  ];

  void _handleRegistration() {
    if (_selectedCategory.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select a category first.')),
      );
      return;
    }
    
    // Navigate to specific registration page based on category
    switch(_selectedCategory) {
      case 'dating':
        context.go('/dating-registration');
        break;
      case 'massage':
        context.go('/massage-registration');
        break;
      case 'escort':
        context.go('/escort-registration');
        break;
      default:
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Invalid category selected.')),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              // Header
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.1),
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      onPressed: () => context.go('/professional'),
                      icon: const Icon(Icons.arrow_back, size: 20, color: Color(0xFF1a1a1a)),
                      padding: const EdgeInsets.all(10),
                      constraints: const BoxConstraints(minWidth: 40, minHeight: 40),
                    ),
                  ),
                  const Spacer(),
                ],
              ),
              const SizedBox(height: 20),

              // Category Selection
              Container(
                margin: const EdgeInsets.only(bottom: 32),
                child: Column(
                  children: [
                    const Text(
                      'Choose Your Category',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF1a1a1a),
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 16),
                    
                    // Categories Grid
                    ..._categories.map((category) => _buildCategoryCard(category)),
                  ],
                ),
              ),

              // Registration Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _handleRegistration,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF667EEA),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'Continue Registration',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryCard(Map<String, dynamic> category) {
    final isSelected = _selectedCategory == category['id'];
    
    return GestureDetector(
      onTap: () => setState(() => _selectedCategory = category['id']),
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFf3f4f6) : Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isSelected ? const Color(0xFF667EEA) : const Color(0xFFe5e7eb),
            width: 2,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  category['icon'],
                  style: const TextStyle(fontSize: 32),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        category['name'],
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF1a1a1a),
                        ),
                      ),
                      Text(
                        category['description'],
                        style: const TextStyle(
                          fontSize: 14,
                          color: Color(0xFF6b7280),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            
            const SizedBox(height: 16),
            
            const Text(
              'Requirements:',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Color(0xFF1a1a1a),
              ),
            ),
            const SizedBox(height: 8),
            
            ...(category['requirements'] as List<String>).map((req) => Padding(
              padding: const EdgeInsets.only(bottom: 4),
              child: Row(
                children: [
                  const Icon(
                    Icons.check_circle,
                    size: 12,
                    color: Color(0xFF10b981),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    req,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Color(0xFF6b7280),
                    ),
                  ),
                ],
              ),
            )),
          ],
        ),
      ),
    );
  }
}
