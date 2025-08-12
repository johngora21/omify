import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ServiceFormPage extends StatefulWidget {
  const ServiceFormPage({super.key});

  @override
  State<ServiceFormPage> createState() => _ServiceFormPageState();
}

class _ServiceFormPageState extends State<ServiceFormPage> {
  final TextEditingController _serviceTitleController = TextEditingController();
  final TextEditingController _serviceDescriptionController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _durationController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _contactInfoController = TextEditingController();
  final TextEditingController _requirementsController = TextEditingController();
  
  String _selectedServiceCategory = 'Beauty & Wellness';
  String _selectedServiceType = 'In-Person';
  String _selectedCurrency = 'USD';
  String _selectedDurationUnit = 'Hours';
  bool _isNegotiable = false;
  bool _requiresDeposit = false;
  String _selectedAvailability = 'Available Now';
  
  final List<String> _serviceCategories = [
    'Beauty & Wellness',
    'Fitness & Training',
    'Education & Tutoring',
    'Technology & IT',
    'Creative & Design',
    'Business & Consulting',
    'Health & Medical',
    'Legal & Financial',
    'Home & Maintenance',
    'Transportation',
    'Entertainment & Events',
    'Food & Catering',
    'Fashion & Styling',
    'Photography & Videography',
    'Music & Arts',
    'Sports & Recreation',
    'Travel & Tourism',
    'Pet Services',
    'Childcare & Elderly Care',
    'Other'
  ];
  
  final List<String> _serviceTypes = [
    'In-Person',
    'Online',
    'Hybrid',
    'Home Visit',
    'Mobile'
  ];
  
  final List<String> _currencies = [
    'USD', 'EUR', 'GBP', 'TZS', 'KES', 'UGX', 'NGN', 'ZAR', 'INR', 'CNY', 'AUD'
  ];
  
  final List<String> _durationUnits = [
    'Minutes',
    'Hours',
    'Days',
    'Weeks',
    'Months'
  ];
  
  final List<String> _availabilityOptions = [
    'Available Now',
    'Available This Week',
    'Available Next Week',
    'Available This Month',
    'By Appointment Only',
    'Limited Availability'
  ];

  @override
  void dispose() {
    _serviceTitleController.dispose();
    _serviceDescriptionController.dispose();
    _priceController.dispose();
    _durationController.dispose();
    _locationController.dispose();
    _contactInfoController.dispose();
    _requirementsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAFAFA),
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
            onPressed: () => context.go('/post-details'),
            iconSize: 20,
            padding: const EdgeInsets.all(8),
          ),
        ),
        title: const Text(
          'Service Details',
          style: TextStyle(
            color: Color(0xFF262626),
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          Container(
            margin: const EdgeInsets.all(8),
            child: ElevatedButton(
              onPressed: _publishService,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF10B981),
                foregroundColor: Colors.white,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              ),
              child: const Text(
                'Publish Service',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 16),
            
            // Basic Service Information
            _buildSection(
              'Basic Information',
              [
                _buildTextFieldItem(
                  icon: Icons.title,
                  title: 'Service Title',
                  controller: _serviceTitleController,
                  hintText: 'Enter your service title',
                  maxLines: 1,
                ),
                _buildDropdownItem(
                  icon: Icons.category,
                  title: 'Service Category',
                  subtitle: _selectedServiceCategory,
                  onTap: () => _showServiceCategoryDialog(),
                ),
                _buildDropdownItem(
                  icon: Icons.location_on,
                  title: 'Service Type',
                  subtitle: _selectedServiceType,
                  onTap: () => _showServiceTypeDialog(),
                ),
                _buildTextFieldItem(
                  icon: Icons.description,
                  title: 'Service Description',
                  controller: _serviceDescriptionController,
                  hintText: 'Describe your service in detail',
                  maxLines: 4,
                ),
              ],
            ),
            
            const SizedBox(height: 16),
            
            // Pricing & Duration
            _buildSection(
              'Pricing & Duration',
              [
                Row(
                  children: [
                    Expanded(
                      child: _buildTextFieldItem(
                        icon: Icons.attach_money,
                        title: 'Price',
                        controller: _priceController,
                        hintText: '0.00',
                        maxLines: 1,
                      ),
                    ),
                    Container(
                      width: 100,
                      margin: const EdgeInsets.only(right: 16),
                      child: _buildDropdownItem(
                        icon: Icons.currency_exchange,
                        title: 'Currency',
                        subtitle: _selectedCurrency,
                        onTap: () => _showCurrencyDialog(),
                      ),
                    ),
                  ],
                ),
                _buildSwitchItem(
                  icon: Icons.handshake,
                  title: 'Price Negotiable',
                  subtitle: 'Allow price negotiation',
                  value: _isNegotiable,
                  onChanged: (value) => setState(() => _isNegotiable = value),
                ),
                Row(
                  children: [
                    Expanded(
                      child: _buildTextFieldItem(
                        icon: Icons.timer,
                        title: 'Duration',
                        controller: _durationController,
                        hintText: '1',
                        maxLines: 1,
                      ),
                    ),
                    Container(
                      width: 120,
                      margin: const EdgeInsets.only(right: 16),
                      child: _buildDropdownItem(
                        icon: Icons.schedule,
                        title: 'Unit',
                        subtitle: _selectedDurationUnit,
                        onTap: () => _showDurationUnitDialog(),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            
            const SizedBox(height: 16),
            
            // Location & Contact
            _buildSection(
              'Location & Contact',
              [
                _buildTextFieldItem(
                  icon: Icons.location_on,
                  title: 'Service Location',
                  controller: _locationController,
                  hintText: 'Enter service location or area',
                  maxLines: 2,
                ),
                _buildTextFieldItem(
                  icon: Icons.contact_phone,
                  title: 'Contact Information',
                  controller: _contactInfoController,
                  hintText: 'Phone, email, or preferred contact method',
                  maxLines: 2,
                ),
                _buildDropdownItem(
                  icon: Icons.access_time,
                  title: 'Availability',
                  subtitle: _selectedAvailability,
                  onTap: () => _showAvailabilityDialog(),
                ),
              ],
            ),
            
            const SizedBox(height: 16),
            
            // Additional Details
            _buildSection(
              'Additional Details',
              [
                _buildTextFieldItem(
                  icon: Icons.checklist,
                  title: 'Requirements',
                  controller: _requirementsController,
                  hintText: 'What clients need to provide or prepare',
                  maxLines: 3,
                ),
                _buildSwitchItem(
                  icon: Icons.payment,
                  title: 'Requires Deposit',
                  subtitle: 'Ask for deposit before service',
                  value: _requiresDeposit,
                  onChanged: (value) => setState(() => _requiresDeposit = value),
                ),
              ],
            ),
            
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  Widget _buildSection(String title, List<Widget> items) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Color(0xFF262626),
              ),
            ),
          ),
          ...items,
        ],
      ),
    );
  }

  Widget _buildTextFieldItem({
    required IconData icon,
    required String title,
    required TextEditingController controller,
    required String hintText,
    required int maxLines,
  }) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.grey.withValues(alpha: 0.1),
            width: 0.5,
          ),
        ),
      ),
      child: ListTile(
        leading: Icon(
          icon,
          color: const Color(0xFF667EEA),
          size: 24,
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Color(0xFF262626),
          ),
        ),
        subtitle: TextField(
          controller: controller,
          maxLines: maxLines,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(
              color: Colors.grey[400],
              fontSize: 14,
            ),
            border: InputBorder.none,
            contentPadding: EdgeInsets.zero,
          ),
          style: const TextStyle(
            fontSize: 14,
            color: Color(0xFF262626),
          ),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      ),
    );
  }

  Widget _buildDropdownItem({
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.grey.withValues(alpha: 0.1),
            width: 0.5,
          ),
        ),
      ),
      child: ListTile(
        leading: Icon(
          icon,
          color: const Color(0xFF667EEA),
          size: 24,
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Color(0xFF262626),
          ),
        ),
        subtitle: Text(
          subtitle,
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey[600],
          ),
        ),
        trailing: const Icon(
          Icons.chevron_right,
          color: Colors.grey,
        ),
        onTap: onTap,
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      ),
    );
  }

  Widget _buildSwitchItem({
    required IconData icon,
    required String title,
    required String subtitle,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.grey.withValues(alpha: 0.1),
            width: 0.5,
          ),
        ),
      ),
      child: ListTile(
        leading: Icon(
          icon,
          color: const Color(0xFF667EEA),
          size: 24,
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Color(0xFF262626),
          ),
        ),
        subtitle: Text(
          subtitle,
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey[600],
          ),
        ),
        trailing: Switch(
          value: value,
          onChanged: onChanged,
          activeColor: const Color(0xFF10B981),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      ),
    );
  }

  void _showServiceCategoryDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Select Service Category'),
        content: SizedBox(
          width: double.maxFinite,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: _serviceCategories.length,
            itemBuilder: (context, index) {
              final category = _serviceCategories[index];
              return ListTile(
                title: Text(category),
                trailing: _selectedServiceCategory == category
                    ? const Icon(Icons.check, color: Color(0xFF10B981))
                    : null,
                onTap: () {
                  setState(() {
                    _selectedServiceCategory = category;
                  });
                  Navigator.pop(context);
                },
              );
            },
          ),
        ),
      ),
    );
  }

  void _showServiceTypeDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Select Service Type'),
        content: SizedBox(
          width: double.maxFinite,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: _serviceTypes.length,
            itemBuilder: (context, index) {
              final type = _serviceTypes[index];
              return ListTile(
                title: Text(type),
                trailing: _selectedServiceType == type
                    ? const Icon(Icons.check, color: Color(0xFF10B981))
                    : null,
                onTap: () {
                  setState(() {
                    _selectedServiceType = type;
                  });
                  Navigator.pop(context);
                },
              );
            },
          ),
        ),
      ),
    );
  }

  void _showCurrencyDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Select Currency'),
        content: SizedBox(
          width: double.maxFinite,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: _currencies.length,
            itemBuilder: (context, index) {
              final currency = _currencies[index];
              return ListTile(
                title: Text(currency),
                trailing: _selectedCurrency == currency
                    ? const Icon(Icons.check, color: Color(0xFF10B981))
                    : null,
                onTap: () {
                  setState(() {
                    _selectedCurrency = currency;
                  });
                  Navigator.pop(context);
                },
              );
            },
          ),
        ),
      ),
    );
  }

  void _showDurationUnitDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Select Duration Unit'),
        content: SizedBox(
          width: double.maxFinite,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: _durationUnits.length,
            itemBuilder: (context, index) {
              final unit = _durationUnits[index];
              return ListTile(
                title: Text(unit),
                trailing: _selectedDurationUnit == unit
                    ? const Icon(Icons.check, color: Color(0xFF10B981))
                    : null,
                onTap: () {
                  setState(() {
                    _selectedDurationUnit = unit;
                  });
                  Navigator.pop(context);
                },
              );
            },
          ),
        ),
      ),
    );
  }

  void _showAvailabilityDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Select Availability'),
        content: SizedBox(
          width: double.maxFinite,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: _availabilityOptions.length,
            itemBuilder: (context, index) {
              final availability = _availabilityOptions[index];
              return ListTile(
                title: Text(availability),
                trailing: _selectedAvailability == availability
                    ? const Icon(Icons.check, color: Color(0xFF10B981))
                    : null,
                onTap: () {
                  setState(() {
                    _selectedAvailability = availability;
                  });
                  Navigator.pop(context);
                },
              );
            },
          ),
        ),
      ),
    );
  }

  void _publishService() {
    // TODO: Implement actual service publishing logic
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Service published successfully!'),
        backgroundColor: Color(0xFF10B981),
      ),
    );
    
    // Navigate back to home page
    context.go('/');
  }
}
