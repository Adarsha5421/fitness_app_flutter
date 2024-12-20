import 'package:flutter/material.dart';
import 'package:gym_tracker_app/common/app_theme/app_theme.dart';
import 'package:gym_tracker_app/view/bottom_navigation_screens/dashboard_view.dart';
import 'package:gym_tracker_app/view/login_view.dart';
import 'package:gym_tracker_app/view/onboarding_view.dart';
import 'package:gym_tracker_app/view/signup_view.dart';
import 'package:gym_tracker_app/view/splash_screen_view.dart';

void main() {
  runApp(const GymTrackerApp());
}

class GymTrackerApp extends StatelessWidget {
  const GymTrackerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: getApplicationTheme(),
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/onboarding': (context) => OnboardingScreen(),
        '/signup': (context) => SignupPage(),
        '/login': (context) => LoginPage(),
        '/home': (context) => const MyDashboardView(),
      },
    );
  }
}
