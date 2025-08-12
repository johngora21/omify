import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Sidebar extends StatelessWidget {
  final bool isOpen;
  final VoidCallback onClose;

  const Sidebar({
    super.key,
    required this.isOpen,
    required this.onClose,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Overlay
        if (isOpen)
          Positioned.fill(
            child: GestureDetector(
              onTap: onClose,
              child: Container(
                color: Colors.black.withOpacity(0.5),
              ),
            ),
          ),

        // Sidebar
        AnimatedPositioned(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          left: isOpen ? 0 : -MediaQuery.of(context).size.width,
          top: 0,
          width: MediaQuery.of(context).size.width * 0.7,
          height: MediaQuery.of(context).size.height + MediaQuery.of(context).padding.top,
          child: Material(
            elevation: 16,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.25),
                    blurRadius: 20,
                    offset: const Offset(0, 0),
                  ),
                ],
              ),
              child: Column(
                children: [
                  // User Profile Section
                  GestureDetector(
                    onTap: () {
                      onClose();
                      context.go('/profile');
                    },
                    child: Container(
                      margin: const EdgeInsets.only(top: 8),
                      padding: const EdgeInsets.all(24),
                      decoration: const BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: Color(0xFFE5E7EB),
                            width: 1,
                          ),
                        ),
                      ),
                      child: Row(
                        children: [
                          // Profile Picture
                          Container(
                            margin: const EdgeInsets.only(top: 2),
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              border: Border.all(color: const Color(0xFFE0E0E0), width: 1.5),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(23.5),
                              child: Image.network(
                                'https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?w=150&h=150&fit=crop&crop=face&auto=format',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const SizedBox(width: 20),
                          // Profile Name and Username
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'John Doe',
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xFF1a1a1a),
                                    fontFamily: 'Inter',
                                    letterSpacing: -0.5,
                                  ),
                                ),
                                const SizedBox(height: 6),
                                const Text(
                                  '@johndoe',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xFF6b7280),
                                    fontFamily: 'Inter',
                                    letterSpacing: 0.2,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  
                  // Navigation Menu
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 16, bottom: 20, left: 0, right: 0),
                      child: Column(
                        children: [
                          _buildMenuItem(
                            context,
                            icon: Icons.explore_outlined,
                            label: 'Explore',
                            onTap: () {
                              onClose();
                              context.go('/discover');
                            },
                          ),
                          _buildMenuItem(
                            context,
                            icon: Icons.play_circle_outline,
                            label: 'Movies',
                            onTap: () {
                              onClose();
                              context.go('/movies');
                            },
                          ),
                          _buildMenuItem(
                            context,
                            icon: Icons.bookmark_outline,
                            label: 'Bookmarks',
                            onTap: () {
                              onClose();
                              context.go('/bookmarks');
                            },
                          ),
                          _buildMenuItem(
                            context,
                            icon: Icons.star_outline,
                            label: 'Premium',
                            onTap: () {
                              onClose();
                              context.go('/premium');
                            },
                          ),
                          _buildMenuItem(
                            context,
                            icon: Icons.settings_outlined,
                            label: 'Settings',
                            onTap: () {
                              onClose();
                              context.go('/settings');
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  
                  // Logout Button at Bottom
                  Container(
                    margin: const EdgeInsets.only(bottom: 20, left: 16, right: 16),
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () {
                          onClose();
                          // Add logout logic here
                          context.go('/');
                        },
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.logout,
                                size: 26,
                                color: Color(0xFF6b7280),
                              ),
                              const SizedBox(width: 18),
                              const Text(
                                'Logout',
                                style: TextStyle(
                                  fontSize: 19,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xFF6b7280),
                                  fontFamily: 'Poppins',
                                  letterSpacing: 0.1,
                                ),
                              ),
                            ],
                          ),
                        ),
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

  Widget _buildMenuItem(
    BuildContext context, {
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 3),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(10),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
            child: Row(
              children: [
                Icon(
                  icon,
                  size: 26,
                  color: const Color(0xFF1A1A1A),
                ),
                const SizedBox(width: 18),
                Text(
                  label,
                  style: const TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF1a1a1a),
                    fontFamily: 'Poppins',
                    letterSpacing: 0.1,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
