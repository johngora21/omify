import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class EscortRegistrationPage extends StatefulWidget {
  const EscortRegistrationPage({super.key});

  @override
  State<EscortRegistrationPage> createState() => _EscortRegistrationPageState();
}

class _EscortRegistrationPageState extends State<EscortRegistrationPage> {
  final Map<String, dynamic> _formData = {
    'name': '',
    'age': '',
    'sex': '',
    'location': '',
    'phone': '',
    'email': '',
    'services': <String>[],
    'rates': '',
    'rateType': '',
    'currency': '',
    'availability': '',
    'description': '',
    'height': '',
    'languages': '',
    'orientation': '',
    'incall': false,
    'outcall': false
  };

  final List<String> _escortServices = [
    'Normal Sex', 'Blowjob', 'Anal Sex', 'Anal Fingering', 'Anal Toys', 
    'Rimming', 'Prostate Massage', 'Threesomes', 'Group Sex', 'Pegging', 
    'Double Penetration', 'Fisting', 'Roleplay', 'Nipple Play', 'Submission', 
    'Handjob', 'Fingering', 'Mutual Masturbation', 'Massage with Happy Ending', 
    'Girlfriend Experience', 'Strap-on Play', 'Couple'
  ];

  final List<String> _sexOptions = ['Male', 'Female'];
  final List<String> _orientationOptions = ['Straight', 'Lesbian', 'Bisexual'];
  final List<String> _currencyOptions = ['USD', 'EUR', 'GBP', 'TSh', 'KES', 'NGN', 'ZAR', 'INR', 'CNY', 'JPY'];
  final List<String> _rateTypeOptions = ['Per Round', 'Per Night'];

  void _handleInputChange(String field, dynamic value) {
    setState(() {
      _formData[field] = value;
    });
  }

  void _handleServiceToggle(String service) {
    setState(() {
      if (_formData['services'].contains(service)) {
        _formData['services'].remove(service);
      } else {
        _formData['services'].add(service);
      }
    });
  }

  void _handleSubmit() {
    // Validate required fields
    if (_formData['name'].isEmpty || _formData['age'].isEmpty || _formData['location'].isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill in all required fields.')),
      );
      return;
    }
    
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Escort registration submitted for review.')),
    );
    context.go('/registration-submitted?type=Companionship');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Companionship Registration',
          style: TextStyle(color: Color(0xFF1a1a1a)),
        ),
        leading: IconButton(
          onPressed: () => context.go('/erotic-registration'),
          icon: Container(
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            padding: const EdgeInsets.all(10),
            child: const Icon(Icons.arrow_back, size: 20, color: Color(0xFF1a1a1a)),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Personal Information',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w700,
                color: Color(0xFF1a1a1a),
              ),
            ),
            const SizedBox(height: 20),

            // Basic Information
            _buildInputField('Full Name *', 'name', _formData['name']),
            Row(
              children: [
                Expanded(child: _buildInputField('Age *', 'age', _formData['age'])),
                const SizedBox(width: 16),
                Expanded(child: _buildDropdownField('Sex *', 'sex', _formData['sex'], _sexOptions)),
              ],
            ),
            _buildInputField('Location *', 'location', _formData['location']),
            _buildInputField('Height', 'height', _formData['height']),
            _buildDropdownField('Orientation', 'orientation', _formData['orientation'], _orientationOptions),
            _buildInputField('Languages', 'languages', _formData['languages']),

            const SizedBox(height: 20),
            const Text(
              'Companionship Services',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Color(0xFF1a1a1a),
              ),
            ),
            const SizedBox(height: 20),

            Wrap(
              spacing: 12,
              runSpacing: 12,
              children: _escortServices.map((service) => _buildServiceChip(service)).toList(),
            ),

            const SizedBox(height: 20),
            const Text(
              'Service Details',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Color(0xFF1a1a1a),
              ),
            ),
            const SizedBox(height: 20),

            _buildInputField('Service Description', 'description', _formData['description'], maxLines: 3),
            
            const SizedBox(height: 20),
            const Text(
              'Pricing Information',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Color(0xFF1a1a1a),
              ),
            ),
            const SizedBox(height: 20),

            Row(
              children: [
                Expanded(child: _buildInputField('Rates', 'rates', _formData['rates'])),
                const SizedBox(width: 16),
                Expanded(child: _buildDropdownField('Currency', 'currency', _formData['currency'], _currencyOptions)),
              ],
            ),
            _buildDropdownField('Rate Type', 'rateType', _formData['rateType'], _rateTypeOptions),
            _buildInputField('Availability', 'availability', _formData['availability']),

            const SizedBox(height: 20),
            const Text(
              'Service Options',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Color(0xFF1a1a1a),
              ),
            ),
            const SizedBox(height: 20),

            Row(
              children: [
                Expanded(
                  child: _buildCheckboxTile('Incall Service', 'incall'),
                ),
                Expanded(
                  child: _buildCheckboxTile('Outcall Service', 'outcall'),
                ),
              ],
            ),

            const SizedBox(height: 20),
            const Text(
              'Contact Information',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Color(0xFF1a1a1a),
              ),
            ),
            const SizedBox(height: 20),

            _buildInputField('Phone', 'phone', _formData['phone']),
            _buildInputField('Email', 'email', _formData['email']),

            const SizedBox(height: 40),

            // Submit Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _handleSubmit,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFdc2626),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  'Submit Registration',
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
    );
  }

  Widget _buildInputField(String label, String field, String value, {int maxLines = 1}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Color(0xFF374151),
            ),
          ),
          const SizedBox(height: 6),
          TextField(
            controller: TextEditingController(text: value),
            onChanged: (text) => _handleInputChange(field, text),
            maxLines: maxLines,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: Color(0xFFd1d5db)),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: Color(0xFFd1d5db)),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: Color(0xFFdc2626)),
              ),
              contentPadding: const EdgeInsets.all(12),
            ),
            style: const TextStyle(fontSize: 14),
          ),
        ],
      ),
    );
  }

  Widget _buildDropdownField(String label, String field, String value, List<String> options) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Color(0xFF374151),
            ),
          ),
          const SizedBox(height: 6),
          DropdownButtonFormField<String>(
            value: value.isEmpty ? null : value,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: Color(0xFFd1d5db)),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: Color(0xFFd1d5db)),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: Color(0xFFdc2626)),
              ),
              contentPadding: const EdgeInsets.all(12),
            ),
            items: options.map((String option) {
              return DropdownMenuItem<String>(
                value: option,
                child: Text(option),
              );
            }).toList(),
            onChanged: (String? newValue) {
              _handleInputChange(field, newValue ?? '');
            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please select an option';
              }
              return null;
            },
          ),
        ],
      ),
    );
  }

  Widget _buildServiceChip(String service) {
    final isSelected = _formData['services'].contains(service);
    
    return FilterChip(
      label: Text(service),
      selected: isSelected,
      onSelected: (selected) => _handleServiceToggle(service),
      selectedColor: const Color(0xFFdc2626).withValues(alpha: 0.2),
      checkmarkColor: const Color(0xFFdc2626),
      labelStyle: TextStyle(
        color: isSelected ? const Color(0xFFdc2626) : const Color(0xFF6b7280),
        fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
      ),
      side: BorderSide(
        color: isSelected ? const Color(0xFFdc2626) : const Color(0xFFd1d5db),
      ),
    );
  }

  Widget _buildCheckboxTile(String title, String field) {
    return CheckboxListTile(
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 14,
          color: Color(0xFF374151),
        ),
      ),
      value: _formData[field],
      onChanged: (value) => _handleInputChange(field, value ?? false),
      activeColor: const Color(0xFFdc2626),
      contentPadding: EdgeInsets.zero,
    );
  }
}
