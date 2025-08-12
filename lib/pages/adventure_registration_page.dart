import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AdventureRegistrationPage extends StatefulWidget {
  const AdventureRegistrationPage({super.key});

  @override
  State<AdventureRegistrationPage> createState() => _AdventureRegistrationPageState();
}

class _AdventureRegistrationPageState extends State<AdventureRegistrationPage> {
  final Map<String, dynamic> _formData = {
    'businessName': '',
    'serviceType': '',
    'location': '',
    'phone': '',
    'email': '',
    'businessLicense': '',
  };

  final List<String> _serviceTypes = ['Safari', 'Hiking', 'Rock Climbing', 'Water Sports', 'Cultural Tours', 'Adventure Racing'];

  void _handleInputChange(String field, dynamic value) {
    setState(() {
      _formData[field] = value;
    });
  }

  void _handleSubmit() {
    // Validate required fields
    if (_formData['businessName'].isEmpty || _formData['serviceType'].isEmpty || 
        _formData['location'].isEmpty || _formData['phone'].isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill in all required fields.')),
      );
      return;
    }
    
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Professional account upgrade submitted for review.')),
    );
    context.go('/registration-submitted?type=Adventure');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Adventure Registration',
          style: TextStyle(color: Color(0xFF1a1a1a)),
        ),
        leading: IconButton(
          onPressed: () => context.go('/professional'),
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
            const SizedBox(height: 32),

            // Business Information
            _buildInputField('Business Name *', 'businessName', _formData['businessName']),
            _buildDropdownField('Primary Service Type *', 'serviceType', _formData['serviceType'], _serviceTypes),
            _buildInputField('Business Location *', 'location', _formData['location']),
            
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

            _buildInputField('Phone Number *', 'phone', _formData['phone']),
            _buildInputField('Email', 'email', _formData['email']),
            _buildInputField('Business License Number (Optional)', 'businessLicense', _formData['businessLicense']),

            const SizedBox(height: 40),

            // Submit Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _handleSubmit,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF10b981),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  'Submit for Verification',
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

  Widget _buildInputField(String label, String field, String value) {
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
                borderSide: const BorderSide(color: Color(0xFF10b981)),
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
                borderSide: const BorderSide(color: Color(0xFF10b981)),
              ),
              contentPadding: const EdgeInsets.all(12),
            ),
            items: options.map((option) => DropdownMenuItem(
              value: option,
              child: Text(option),
            )).toList(),
            onChanged: (newValue) => _handleInputChange(field, newValue ?? ''),
          ),
        ],
      ),
    );
  }
}
