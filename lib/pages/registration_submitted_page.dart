import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RegistrationSubmittedPage extends StatelessWidget {
  const RegistrationSubmittedPage({super.key});

  @override
  Widget build(BuildContext context) {
    final uri = GoRouterState.of(context).uri;
    final type = uri.queryParameters['type'] ?? 'service';
    final category = uri.queryParameters['category'];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text('Application Submitted', style: TextStyle(color: Color(0xFF1a1a1a))),
        leading: IconButton(
          onPressed: () => context.go('/profile'),
          icon: const Icon(Icons.arrow_back, color: Color(0xFF6b7280)),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Thanks! Your ${category != null ? '$type ($category)' : type} registration has been submitted.',
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w700, color: Color(0xFF1a1a1a)),
            ),
            const SizedBox(height: 12),
            const Text(
              'Our team will review your application to verify eligibility. You will be notified once the review is complete. You can edit your details anytime.',
              style: TextStyle(fontSize: 14, color: Color(0xFF6b7280), height: 1.5),
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => context.go('/profile'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF667EEA),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                child: const Text('Back to Profile', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
