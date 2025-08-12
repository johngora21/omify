import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final Map<String, dynamic> _profileData = {
    'firstName': 'Sarah',
    'lastName': 'Johnson',
    'username': 'sarah_johnson',
    'bio': 'Professional massage therapist with 5+ years of experience. Specializing in Swedish, deep tissue, and hot stone massage. Passionate about helping clients relax and rejuvenate.',
    'email': 'sarah.johnson@email.com',
    'phone': '+1 (555) 123-4567',
    'location': 'New York, NY',
    'website': 'www.sarahjohnson.com',
    'instagram': '@sarahjohnson_massage',
    'profileImage': 'https://images.unsplash.com/photo-1494790108755-2616b612b786?w=150&h=150&fit=crop&crop=face'
  };

  bool _isEditingImage = false;

  void _handleInputChange(String field, String value) {
    setState(() {
      _profileData[field] = value;
    });
  }

  void _handleSave() {
    // Here you would typically save to backend
    print('Saving profile: $_profileData');
    context.go('/profile');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFf8f9fa),
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Container(
              color: Colors.white,
              padding: EdgeInsets.fromLTRB(
                MediaQuery.of(context).size.width * 0.04, // 4% of screen width
                MediaQuery.of(context).padding.top + 8, // Status bar height + 8px
                MediaQuery.of(context).size.width * 0.04,
                16,
              ),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () => context.go('/profile'),
                    icon: const Icon(Icons.arrow_back, size: 24, color: Color(0xFF1a1a1a)),
                    padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.02), // 2% of screen width
                  ),
                  const Expanded(
                    child: Text(
                      'Edit Profile',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF1a1a1a),
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: _handleSave,
                    style: TextButton.styleFrom(
                      backgroundColor: const Color(0xFF667EEA),
                      foregroundColor: Colors.white,
                      padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * 0.04,
                        vertical: 8,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                    child: const Text(
                      'Save',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Content
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    // Profile Image Section
                    Container(
                      margin: const EdgeInsets.only(bottom: 32),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          CircleAvatar(
                            radius: 50,
                            backgroundImage: NetworkImage(_profileData['profileImage']),
                            backgroundColor: Colors.grey[300],
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: Container(
                              decoration: BoxDecoration(
                                color: const Color(0xFF667EEA),
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.2),
                                    blurRadius: 8,
                                    offset: const Offset(0, 2),
                                  ),
                                ],
                              ),
                              child: IconButton(
                                onPressed: () => setState(() => _isEditingImage = true),
                                icon: const Icon(Icons.camera_alt, size: 16, color: Colors.white),
                                padding: const EdgeInsets.all(8),
                                constraints: const BoxConstraints(minWidth: 32, minHeight: 32),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Form Sections
                    Column(
                      children: [
                        // Personal Information
                        _buildFormSection(
                          'Personal Information',
                          [
                            _buildInputRow([
                              _buildInputField('First Name', 'firstName', _profileData['firstName']),
                              _buildInputField('Last Name', 'lastName', _profileData['lastName']),
                            ]),
                            _buildInputField('Username', 'username', _profileData['username']),
                            _buildInputField('Bio', 'bio', _profileData['bio'], maxLines: 3),
                          ],
                        ),

                        const SizedBox(height: 24),

                        // Contact Information
                        _buildFormSection(
                          'Contact Information',
                          [
                            _buildInputField('Email', 'email', _profileData['email']),
                            _buildInputField('Phone', 'phone', _profileData['phone']),
                            _buildInputField('Location', 'location', _profileData['location']),
                          ],
                        ),

                        const SizedBox(height: 24),

                        // Social Media
                        _buildFormSection(
                          'Social Media',
                          [
                            _buildInputField('Website', 'website', _profileData['website']),
                            _buildInputField('Instagram', 'instagram', _profileData['instagram']),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFormSection(String title, List<Widget> children) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFe5e7eb)),
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Color(0xFF1a1a1a),
            ),
          ),
          const SizedBox(height: 16),
          ...children,
        ],
      ),
    );
  }

  Widget _buildInputRow(List<Widget> children) {
    return Row(
      children: children.map((child) => Expanded(child: child)).toList(),
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
                borderSide: const BorderSide(color: Color(0xFF667EEA)),
              ),
              contentPadding: const EdgeInsets.all(12),
            ),
            style: const TextStyle(fontSize: 14),
          ),
        ],
      ),
    );
  }
}
