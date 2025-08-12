import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../theme/app_theme.dart';

class BottomNav extends StatelessWidget {
  final VoidCallback? onEroticTabPressed;
  final VoidCallback? onHomeTabPressed;
  
  const BottomNav({super.key, this.onEroticTabPressed, this.onHomeTabPressed});

  @override
  Widget build(BuildContext context) {
    final location = GoRouterState.of(context).uri.path;
    
    final navItems = [
      {
        'path': '/',
        'label': 'Home',
        'icon': Icons.home_outlined,
        'activeIcon': Icons.home,
      },
      {
        'path': '/erotic',
        'label': 'Erotic',
        'icon': Icons.spa_outlined,
        'activeIcon': Icons.spa,
      },
      {
        'path': '/reels',
        'label': 'Reels',
        'icon': Icons.video_library_outlined,
        'activeIcon': Icons.video_library,
      },
      {
        'path': '/entertainment',
        'label': 'Entertainment',
        'icon': Icons.radio_outlined,
        'activeIcon': Icons.radio,
      },
    ];

    return Container(
      height: 70,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.95),
        border: Border(
          top: BorderSide(
            color: Colors.grey.shade200.withOpacity(0.3),
          ),
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              // Left side navigation items
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: navItems.take(2).map((item) {
                    final isActive = location == item['path'];
                    final icon = isActive ? item['activeIcon'] : item['icon'];
                    
                    return GestureDetector(
                      onTap: () {
                        if (item['path'] == '/' && location == '/' && onHomeTabPressed != null) {
                          // If already on home page, scroll to top
                          onHomeTabPressed!();
                        } else if (item['path'] == '/erotic' && location == '/erotic' && onEroticTabPressed != null) {
                          // If already on erotic page, scroll to top
                          onEroticTabPressed!();
                        } else {
                          // Navigate to the page
                          context.go(item['path'] as String);
                        }
                      },
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: isActive 
                              ? AppTheme.primaryColor.withOpacity(0.1)
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Icon(
                          icon as IconData,
                          size: 26,
                          color: isActive 
                              ? AppTheme.primaryColor
                              : AppTheme.textMutedColor,
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
              
              // Center Add Post Button
              Container(
                padding: const EdgeInsets.all(8),
                child: GestureDetector(
                  onTap: () => context.go('/create'),
                  child: Container(
                    width: 56,
                    height: 56,
                    decoration: BoxDecoration(
                      gradient: AppTheme.omifyGradient,
                      borderRadius: BorderRadius.circular(28),
                      boxShadow: [
                        BoxShadow(
                          color: AppTheme.primaryColor.withOpacity(0.4),
                          blurRadius: 12,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: const Icon(
                      Icons.add,
                      size: 28,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              
              // Right side navigation items
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: navItems.skip(2).map((item) {
                    final isActive = location == item['path'];
                    final icon = isActive ? item['activeIcon'] : item['icon'];
                    
                    return GestureDetector(
                      onTap: () => context.go(item['path'] as String),
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: isActive 
                              ? AppTheme.primaryColor.withOpacity(0.1)
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Icon(
                          icon as IconData,
                          size: 26,
                          color: isActive 
                              ? AppTheme.primaryColor
                              : AppTheme.textMutedColor,
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
