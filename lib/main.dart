import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:line_icons/line_icons.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ionicons/ionicons.dart';
import './pages/erotic_page.dart';
import './pages/home_page.dart';
import './pages/reels_page.dart';
import './pages/entertainment_page.dart';
import './pages/create_post_page.dart';
import './components/bottom_nav.dart';
import './components/sidebar.dart';
import './pages/notifications_page.dart';
import './pages/messages_page.dart';
import './pages/explore_page.dart';
import './pages/discover_page.dart';
import './pages/movies_page.dart';
import './pages/movie_watch_page.dart';
import './pages/bookmarks_page.dart';
import './pages/premium_page.dart';
import './pages/settings_page.dart';
import './pages/profile_page.dart';
import './pages/edit_profile_page.dart';
import './pages/professional_page.dart';
import './pages/erotic_registration_page.dart';
import './pages/accommodation_registration_page.dart';
import './pages/adventure_registration_page.dart';
import './pages/car_rental_registration_page.dart';
import './pages/registration_submitted_page.dart';
import './pages/dating_registration_page.dart';
import './pages/massage_registration_page.dart';
import './pages/escort_registration_page.dart';
import './pages/group_details_page.dart';
import './pages/post_details_page.dart';
import './pages/service_form_page.dart';
import './services/database_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Test database connection
  try {
    await DatabaseService.instance.testConnection();
    print('🚀 Database connection test completed successfully!');
  } catch (e) {
    print('❌ Database connection test failed: $e');
  }
  
  runApp(const OmifyApp());
}

class OmifyApp extends StatelessWidget {
  const OmifyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Set system UI overlay style to white
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: Colors.white,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
    );
    
    final router = GoRouter(
      initialLocation: '/',
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => const MainNavigationPage(),
        ),
        GoRoute(
          path: '/erotic',
          builder: (context, state) => const MainNavigationPage(),
        ),
        GoRoute(
          path: '/reels',
          builder: (context, state) => const MainNavigationPage(),
        ),
        GoRoute(
          path: '/entertainment',
          builder: (context, state) => const MainNavigationPage(),
        ),
        GoRoute(
          path: '/create',
          builder: (context, state) => const MainNavigationPage(),
        ),
        GoRoute(
          path: '/notifications',
          builder: (context, state) => const NotificationsPage(),
        ),
        GoRoute(
          path: '/messages',
          builder: (context, state) => const MessagesPage(),
        ),
        GoRoute(
          path: '/group/:id',
          builder: (context, state) {
            final groupId = state.pathParameters['id']!;
            final groupName = state.uri.queryParameters['name'] ?? 'Group';
            return GroupDetailsPage(
              groupId: groupId,
              groupName: groupName,
            );
          },
        ),

        GoRoute(
          path: '/explore',
          builder: (context, state) => const ExplorePage(),
        ),
        GoRoute(
          path: '/discover',
          builder: (context, state) => const DiscoverPage(),
        ),
        GoRoute(
          path: '/movies',
          builder: (context, state) => const MoviesPage(),
        ),
        GoRoute(
          path: '/movie/:id',
          builder: (context, state) => MovieWatchPage(
            movieId: state.pathParameters['id']!,
          ),
        ),
        GoRoute(
          path: '/bookmarks',
          builder: (context, state) => const BookmarksPage(),
        ),
        GoRoute(
          path: '/premium',
          builder: (context, state) => const PremiumPage(),
        ),
        GoRoute(
          path: '/settings',
          builder: (context, state) => const SettingsPage(),
        ),
        GoRoute(
          path: '/profile',
          builder: (context, state) => const ProfilePage(),
        ),
        GoRoute(
          path: '/edit-profile',
          builder: (context, state) => const EditProfilePage(),
        ),
        GoRoute(
          path: '/professional',
          builder: (context, state) => const ProfessionalPage(),
        ),
        GoRoute(
          path: '/erotic-registration',
          builder: (context, state) => const EroticRegistrationPage(),
        ),
        GoRoute(
          path: '/accommodation-registration',
          builder: (context, state) => const AccommodationRegistrationPage(),
        ),
        GoRoute(
          path: '/adventure-registration',
          builder: (context, state) => const AdventureRegistrationPage(),
        ),
        GoRoute(
          path: '/car-rental-registration',
          builder: (context, state) => const CarRentalRegistrationPage(),
        ),
        GoRoute(
          path: '/registration-submitted',
          builder: (context, state) => const RegistrationSubmittedPage(),
        ),
        GoRoute(
          path: '/dating-registration',
          builder: (context, state) => const DatingRegistrationPage(),
        ),
        GoRoute(
          path: '/massage-registration',
          builder: (context, state) => const MassageRegistrationPage(),
        ),
        GoRoute(
          path: '/escort-registration',
          builder: (context, state) => const EscortRegistrationPage(),
        ),
        GoRoute(
          path: '/post-details',
          builder: (context, state) => const PostDetailsPage(),
        ),
        GoRoute(
          path: '/service-form',
          builder: (context, state) => const ServiceFormPage(),
        ),
      ],
    );
    
    return Container(
      color: Colors.white,
      child: MaterialApp.router(
        title: 'Omify',
        theme: ThemeData(
          useMaterial3: false,
          primarySwatch: Colors.blue,
          primaryColor: const Color(0xFF0095F6),
          scaffoldBackgroundColor: Colors.white,
          fontFamily: '-apple-system, BlinkMacSystemFont, "Segoe UI", "Roboto", "Helvetica", "Arial", sans-serif',
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.white,
            foregroundColor: Color(0xFF262626),
            elevation: 0,
            centerTitle: true,
            surfaceTintColor: Colors.white,
            scrolledUnderElevation: 0,
          ),
        ),
        routerConfig: router,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

class ChatBubblePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFF262626)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.5;

    final fillPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    // Draw the main chat bubble (rounded rectangle)
    final bubbleRect = RRect.fromRectAndRadius(
      Rect.fromLTWH(2, 2, size.width - 4, size.height - 6),
      const Radius.circular(8),
    );

    // Fill with white
    canvas.drawRRect(bubbleRect, fillPaint);
    // Draw border
    canvas.drawRRect(bubbleRect, paint);

    // Draw the tail (small triangle at bottom)
    final path = Path();
    path.moveTo(size.width * 0.3, size.height - 6);
    path.lineTo(size.width * 0.4, size.height - 2);
    path.lineTo(size.width * 0.5, size.height - 6);
    path.close();

    // Fill tail with white
    canvas.drawPath(path, fillPaint);
    // Draw tail border
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class MainNavigationPage extends StatefulWidget {
  const MainNavigationPage({super.key});

  @override
  State<MainNavigationPage> createState() => _MainNavigationPageState();
}

class _MainNavigationPageState extends State<MainNavigationPage> {
  final GlobalKey<EroticPageState> _eroticPageKey = GlobalKey<EroticPageState>();
  final GlobalKey<HomePageState> _homePageKey = GlobalKey<HomePageState>();
  bool _sidebarOpen = false;

  void _openSidebar() {
    setState(() {
      _sidebarOpen = true;
    });
  }

  void _closeSidebar() {
    setState(() {
      _sidebarOpen = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final location = GoRouterState.of(context).uri.path;
    
    Widget currentPage;
    switch (location) {
      case '/erotic':
        currentPage = EroticPage(key: _eroticPageKey);
        break;
      case '/reels':
        currentPage = const ReelsPage();
        break;
      case '/entertainment':
        currentPage = const EntertainmentPage();
        break;
      case '/create':
        currentPage = const CreatePostPage();
        break;
      case '/notifications':
        currentPage = const NotificationsPage();
        break;
      case '/messages':
        currentPage = const MessagesPage();
        break;
      default:
        currentPage = HomePage(
          key: _homePageKey,
          onOpenSidebar: _openSidebar,
        );
    }
    
    return Stack(
      children: [
        Scaffold(
          body: currentPage,
          bottomNavigationBar: location == '/create' 
              ? null 
              : BottomNav(
                  onHomeTabPressed: () => _homePageKey.currentState?.scrollToTop(),
                  onEroticTabPressed: () => _eroticPageKey.currentState?.scrollToTop(),
                ),
        ),
        
        // Sidebar - positioned above everything including bottom navigation
        Sidebar(
          isOpen: _sidebarOpen,
          onClose: _closeSidebar,
        ),
      ],
    );
  }
}


