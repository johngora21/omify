import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../types/index.dart';
import '../theme/app_theme.dart';

class TopBar extends StatelessWidget implements PreferredSizeWidget {
  final User? user;
  final Function(User?) setUser;
  final VoidCallback onMenuClick;

  const TopBar({
    super.key,
    this.user,
    required this.setUser,
    required this.onMenuClick,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: const BoxDecoration(
        color: AppTheme.cardColor,
        border: Border(
          bottom: BorderSide(color: AppTheme.borderColor),
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              // Left Side - Menu Button
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: IconButton(
                  onPressed: onMenuClick,
                  icon: const Icon(
                    Icons.person_outline,
                    size: 24,
                    color: AppTheme.textColor,
                  ),
                  padding: EdgeInsets.zero,
                ),
              ),
              
              const SizedBox(width: 16),
              
              // Center - Omify Brand
              Expanded(
                child: Center(
                  child: GestureDetector(
                    onTap: () => context.go('/'),
                    child: ShaderMask(
                      shaderCallback: (bounds) => AppTheme.omifyGradient.createShader(bounds),
                      child: const Text(
                        'Omify',
                        style: AppTheme.omifyBrand,
                      ),
                    ),
                  ),
                ),
              ),
              
              const SizedBox(width: 16),
              
              // Right Side - Search Button
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: IconButton(
                  onPressed: () => context.go('/explore'),
                  icon: const Icon(
                    Icons.search_outlined,
                    size: 24,
                    color: AppTheme.textColor,
                  ),
                  padding: EdgeInsets.zero,
                ),
              ),
              
              const SizedBox(width: 16),
              
              // Notifications Button
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: IconButton(
                  onPressed: () => context.go('/notifications'),
                  icon: const Icon(
                    Icons.notifications_outlined,
                    size: 24,
                    color: AppTheme.textColor,
                  ),
                  padding: EdgeInsets.zero,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
