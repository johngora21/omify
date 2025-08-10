import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Welcome Section
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: AppTheme.cardDecoration,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '🎉 OMIFY MOBILE APP IS WORKING! 🎉',
                      style: AppTheme.heading1,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Discover amazing services and connect with professionals',
                      style: AppTheme.bodyText.copyWith(
                        color: AppTheme.textMutedColor,
                      ),
                    ),
                  ],
                ),
              ),
              
              const SizedBox(height: 24),
              
              // Service Categories
              Text(
                'Service Categories',
                style: AppTheme.heading2,
              ),
              
              const SizedBox(height: 16),
              
              GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 1.2,
                children: [
                  _buildServiceCard(
                    context,
                    'Erotic Services',
                    Icons.spa,
                    '/erotic',
                    AppTheme.omifyGradient,
                  ),
                  _buildServiceCard(
                    context,
                    'Massage',
                    Icons.health_and_safety,
                    '/massage',
                    AppTheme.instagramGradient,
                  ),
                  _buildServiceCard(
                    context,
                    'Entertainment',
                    Icons.music_note,
                    '/entertainment',
                    AppTheme.omifyGradient,
                  ),
                  _buildServiceCard(
                    context,
                    'Sports',
                    Icons.sports_soccer,
                    '/sports',
                    AppTheme.instagramGradient,
                  ),
                ],
              ),
              
              const SizedBox(height: 24),
              
              // Featured Section
              Text(
                'Featured Services',
                style: AppTheme.heading2,
              ),
              
              const SizedBox(height: 16),
              
              // Featured service cards
              _buildFeaturedCard(
                context,
                'Premium Massage Therapy',
                'Professional massage services with certified therapists',
                '\$80/hour',
                4.8,
                'assets/images/massage.jpg',
              ),
              
              const SizedBox(height: 16),
              
              _buildFeaturedCard(
                context,
                'Luxury Car Rental',
                'High-end vehicles for special occasions',
                '\$150/day',
                4.9,
                'assets/images/car.jpg',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildServiceCard(
    BuildContext context,
    String title,
    IconData icon,
    String route,
    LinearGradient gradient,
  ) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, route),
      child: Container(
        decoration: BoxDecoration(
          gradient: gradient,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 32,
                color: Colors.white,
              ),
              const SizedBox(height: 8),
              Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFeaturedCard(
    BuildContext context,
    String title,
    String description,
    String price,
    double rating,
    String imagePath,
  ) {
    return Container(
      decoration: AppTheme.cardDecoration,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            // Placeholder for image
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: AppTheme.primaryColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(
                Icons.image,
                color: AppTheme.primaryColor,
                size: 32,
              ),
            ),
            
            const SizedBox(width: 16),
            
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: AppTheme.heading3,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    description,
                    style: AppTheme.bodyTextSmall.copyWith(
                      color: AppTheme.textMutedColor,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        size: 16,
                        color: Colors.amber,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        rating.toString(),
                        style: AppTheme.bodyTextSmall,
                      ),
                      const Spacer(),
                      Text(
                        price,
                        style: AppTheme.bodyText.copyWith(
                          fontWeight: FontWeight.w600,
                          color: AppTheme.primaryColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
