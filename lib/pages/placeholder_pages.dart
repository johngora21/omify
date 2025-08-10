import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

// Placeholder pages for all routes
class EroticPage extends StatelessWidget {
  const EroticPage({super.key});
  @override
  Widget build(BuildContext context) {
    return _buildPlaceholderPage(context, 'Erotic Services');
  }
}

class ReelsPage extends StatelessWidget {
  const ReelsPage({super.key});
  @override
  Widget build(BuildContext context) {
    return _buildPlaceholderPage(context, 'Reels');
  }
}

class EntertainmentPage extends StatelessWidget {
  const EntertainmentPage({super.key});
  @override
  Widget build(BuildContext context) {
    return _buildPlaceholderPage(context, 'Entertainment');
  }
}

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});
  @override
  Widget build(BuildContext context) {
    return _buildPlaceholderPage(context, 'Login');
  }
}

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});
  @override
  Widget build(BuildContext context) {
    return _buildPlaceholderPage(context, 'Register');
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});
  @override
  Widget build(BuildContext context) {
    return _buildPlaceholderPage(context, 'Profile');
  }
}

class PremiumPage extends StatelessWidget {
  const PremiumPage({super.key});
  @override
  Widget build(BuildContext context) {
    return _buildPlaceholderPage(context, 'Premium');
  }
}

class ProfessionalPage extends StatelessWidget {
  const ProfessionalPage({super.key});
  @override
  Widget build(BuildContext context) {
    return _buildPlaceholderPage(context, 'Professional');
  }
}

class BookmarksPage extends StatelessWidget {
  const BookmarksPage({super.key});
  @override
  Widget build(BuildContext context) {
    return _buildPlaceholderPage(context, 'Bookmarks');
  }
}

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});
  @override
  Widget build(BuildContext context) {
    return _buildPlaceholderPage(context, 'Settings');
  }
}

class CreatePostPage extends StatelessWidget {
  const CreatePostPage({super.key});
  @override
  Widget build(BuildContext context) {
    return _buildPlaceholderPage(context, 'Create Post');
  }
}

class MessagesPage extends StatelessWidget {
  const MessagesPage({super.key});
  @override
  Widget build(BuildContext context) {
    return _buildPlaceholderPage(context, 'Messages');
  }
}

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});
  @override
  Widget build(BuildContext context) {
    return _buildPlaceholderPage(context, 'Notifications');
  }
}

class SavedPage extends StatelessWidget {
  const SavedPage({super.key});
  @override
  Widget build(BuildContext context) {
    return _buildPlaceholderPage(context, 'Saved');
  }
}

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({super.key});
  @override
  Widget build(BuildContext context) {
    return _buildPlaceholderPage(context, 'Edit Profile');
  }
}

class ExplorePage extends StatelessWidget {
  const ExplorePage({super.key});
  @override
  Widget build(BuildContext context) {
    return _buildPlaceholderPage(context, 'Explore');
  }
}

class MoviesPage extends StatelessWidget {
  const MoviesPage({super.key});
  @override
  Widget build(BuildContext context) {
    return _buildPlaceholderPage(context, 'Movies');
  }
}

class SportsPage extends StatelessWidget {
  const SportsPage({super.key});
  @override
  Widget build(BuildContext context) {
    return _buildPlaceholderPage(context, 'Sports');
  }
}

class MovieDetailsPage extends StatelessWidget {
  final String movieId;
  const MovieDetailsPage({super.key, required this.movieId});
  @override
  Widget build(BuildContext context) {
    return _buildPlaceholderPage(context, 'Movie Details: $movieId');
  }
}

class ServiceProviderProfilePage extends StatelessWidget {
  final String providerId;
  const ServiceProviderProfilePage({super.key, required this.providerId});
  @override
  Widget build(BuildContext context) {
    return _buildPlaceholderPage(context, 'Provider Profile: $providerId');
  }
}

// Registration pages
class EroticRegistrationPage extends StatelessWidget {
  const EroticRegistrationPage({super.key});
  @override
  Widget build(BuildContext context) {
    return _buildPlaceholderPage(context, 'Erotic Registration');
  }
}

class DatingRegistrationPage extends StatelessWidget {
  const DatingRegistrationPage({super.key});
  @override
  Widget build(BuildContext context) {
    return _buildPlaceholderPage(context, 'Dating Registration');
  }
}

class MassageRegistrationPage extends StatelessWidget {
  const MassageRegistrationPage({super.key});
  @override
  Widget build(BuildContext context) {
    return _buildPlaceholderPage(context, 'Massage Registration');
  }
}

class EscortRegistrationPage extends StatelessWidget {
  const EscortRegistrationPage({super.key});
  @override
  Widget build(BuildContext context) {
    return _buildPlaceholderPage(context, 'Escort Registration');
  }
}

class AccommodationRegistrationPage extends StatelessWidget {
  const AccommodationRegistrationPage({super.key});
  @override
  Widget build(BuildContext context) {
    return _buildPlaceholderPage(context, 'Accommodation Registration');
  }
}

class AdventureRegistrationPage extends StatelessWidget {
  const AdventureRegistrationPage({super.key});
  @override
  Widget build(BuildContext context) {
    return _buildPlaceholderPage(context, 'Adventure Registration');
  }
}

class CarRentalRegistrationPage extends StatelessWidget {
  const CarRentalRegistrationPage({super.key});
  @override
  Widget build(BuildContext context) {
    return _buildPlaceholderPage(context, 'Car Rental Registration');
  }
}

Widget _buildPlaceholderPage(BuildContext context, String title) {
  return Scaffold(
    backgroundColor: AppTheme.backgroundColor,
    body: SafeArea(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.construction,
              size: 64,
              color: AppTheme.primaryColor,
            ),
            const SizedBox(height: 16),
            Text(
              title,
              style: AppTheme.heading1,
            ),
            const SizedBox(height: 8),
            Text(
              'Coming Soon',
              style: AppTheme.bodyText.copyWith(
                color: AppTheme.textMutedColor,
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Go Back'),
            ),
          ],
        ),
      ),
    ),
  );
}
