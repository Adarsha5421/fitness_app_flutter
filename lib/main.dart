import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gym_tracker_app/common/app_theme/app_theme.dart';
import 'package:gym_tracker_app/view/splash_screen_view.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: getApplicationTheme(),
      home: const SplashScreen(),
      // initialRoute: '/',
      // routes: {
      //   '/': (context) => const SplashScreen(),
      //   '/onboarding': (context) => const OnboardingScreen(),
      //   '/signup': (context) => const SignupPage(),
      //   '/login': (context) => const LoginPage(),
      //   '/home': (context) => const MyDashboardView(),
      // },
    );
  }
}
