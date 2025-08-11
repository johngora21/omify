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
import './pages/notifications_page.dart';
import './pages/messages_page.dart';
import './pages/explore_page.dart';

void main() {
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
          path: '/explore',
          builder: (context, state) => const ExplorePage(),
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
        currentPage = HomePage(key: _homePageKey);
    }
    
    return Scaffold(
      body: currentPage,
      bottomNavigationBar: location == '/create' 
          ? null 
          : BottomNav(
              onHomeTabPressed: () => _homePageKey.currentState?.scrollToTop(),
              onEroticTabPressed: () => _eroticPageKey.currentState?.scrollToTop(),
            ),
    );
  }
}


