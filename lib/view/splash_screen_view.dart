import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:gym_tracker_app/core/navigation_services.dart';
import 'package:gym_tracker_app/features/onboarding/presentation/pages/onboarding_screen.dart';
import 'package:gym_tracker_app/view/onboarding_view.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});
  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      // Navigator.pushReplacementNamed(context, OnboardingScreen());
      navigateAndPushReplacement(context: context, screen: const OnboardingScreen());
    });

    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/logo/gym_logo.png', height: 120),
              const SizedBox(height: 20),
              const Text(
                "Gym Tracker",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 225, 55, 0),
                ),
              ),
              const SizedBox(height: 30),
              const SpinKitThreeBounce(color: Colors.white, size: 30),
            ],
          ),
        ),
      ),
    );
  }
}
