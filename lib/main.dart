import 'package:flutter/material.dart';
import 'package:gym_tracker_app/view/homepage_view.dart';
import 'package:gym_tracker_app/view/login_view.dart';
import 'package:gym_tracker_app/view/onboarding_view.dart';
import 'package:gym_tracker_app/view/signup_view.dart';
import 'package:gym_tracker_app/view/splash_screen_view.dart';

void main() {
  runApp(GymTrackerApp());
}

class GymTrackerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),
        '/onboarding': (context) => OnboardingScreen(),
        '/signup': (context) => SignupPage(),
        '/login': (context) => LoginPage(),
        '/home': (context) => HomePage(),
      },
    );
  }
}
