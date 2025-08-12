import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DatingRegistrationPage extends StatefulWidget {
  const DatingRegistrationPage({super.key});

  @override
  State<DatingRegistrationPage> createState() => _DatingRegistrationPageState();
}

class _DatingRegistrationPageState extends State<DatingRegistrationPage> {
  final Map<String, dynamic> _formData = {
    'name': '',
    'age': '',
    'sex': '',
    'location': '',
    'about': '',
    'whatSheNeeds': '',
    'hobbies': <String>[],
    'services': <String>[],
    'languages': '',
    'phone': '',
    'email': '',
    'orientation': '',
    'height': ''
  };

  final List<String> _datingServices = [
    'Dating', 'Relationship', 'Companionship', 'Travel Partner', 'Dinner Date', 
    'Movie Night', 'Coffee Meet', 'Weekend Getaway', 'Long-term Relationship', 
    'Marriage', 'Family Planning', 'Shared Interests', 'Emotional Support', 
    'Life Partner', 'Soulmate'
  ];

  final List<String> _hobbyOptions = [
    'Travel', 'Photography', 'Yoga', 'Cooking', 'Reading', 'Hiking', 'Art', 
    'Music', 'Painting', 'Dancing', 'Adventure', 'Fitness', 'Rock Climbing', 
    'Meditation', 'Swimming', 'Cycling', 'Gaming', 'Writing', 'Gardening'
  ];

  final List<String> _sexOptions = ['Male', 'Female'];
  final List<String> _orientationOptions = ['Straight', 'Lesbian', 'Bisexual'];

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

  void _handleHobbyToggle(String hobby) {
    setState(() {
      if (_formData['hobbies'].contains(hobby)) {
        _formData['hobbies'].remove(hobby);
      } else {
        _formData['hobbies'].add(hobby);
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
      const SnackBar(content: Text('Dating registration submitted for review.')),
    );
    context.go('/registration-submitted?type=Dating');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Dating Registration',
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

            const SizedBox(height: 20),
            const Text(
              'About You',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Color(0xFF1a1a1a),
              ),
            ),
            const SizedBox(height: 20),

            _buildInputField('About Me', 'about', _formData['about'], maxLines: 3),
            _buildInputField('What I\'m Looking For', 'whatSheNeeds', _formData['whatSheNeeds'], maxLines: 3),
            _buildInputField('Languages', 'languages', _formData['languages']),

            const SizedBox(height: 20),
            const Text(
              'Dating Services',
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
              children: _datingServices.map((service) => _buildServiceChip(service)).toList(),
            ),

            const SizedBox(height: 20),
            const Text(
              'Hobbies & Interests',
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
              children: _hobbyOptions.map((hobby) => _buildHobbyChip(hobby)).toList(),
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
                  backgroundColor: const Color(0xFFec4899),
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
                borderSide: const BorderSide(color: Color(0xFFec4899)),
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
                borderSide: const BorderSide(color: Color(0xFFec4899)),
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
              if (value == null) {
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
      selectedColor: const Color(0xFFec4899).withValues(alpha: 0.2),
      checkmarkColor: const Color(0xFFec4899),
      labelStyle: TextStyle(
        color: isSelected ? const Color(0xFFec4899) : const Color(0xFF6b7280),
        fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
      ),
      side: BorderSide(
        color: isSelected ? const Color(0xFFec4899) : const Color(0xFFd1d5db),
      ),
    );
  }

  Widget _buildHobbyChip(String hobby) {
    final isSelected = _formData['hobbies'].contains(hobby);
    
    return FilterChip(
      label: Text(hobby),
      selected: isSelected,
      onSelected: (selected) => _handleHobbyToggle(hobby),
      selectedColor: const Color(0xFFec4899).withValues(alpha: 0.2),
      checkmarkColor: const Color(0xFFec4899),
      labelStyle: TextStyle(
        color: isSelected ? const Color(0xFFec4899) : const Color(0xFF6b7280),
        fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
      ),
      side: BorderSide(
        color: isSelected ? const Color(0xFFec4899) : const Color(0xFFd1d5db),
      ),
    );
  }
}
