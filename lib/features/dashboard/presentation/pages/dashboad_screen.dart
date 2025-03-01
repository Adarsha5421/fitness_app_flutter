import 'package:flutter/material.dart';
import 'package:gym_tracker_app/features/calculator/presentation/pages/calculator_screen.dart';
import 'package:gym_tracker_app/features/home/presentation/pages/home_screen.dart';
import 'package:gym_tracker_app/features/profile/presentation/pages/profile_screen.dart';
import 'package:gym_tracker_app/features/workout/presentation/pages/work_out_screen.dart';
import 'package:gym_tracker_app/view/bottom_navigation_screens/notification_view.dart';

class MyDashboardScreen extends StatefulWidget {
  const MyDashboardScreen({super.key});

  @override
  State<MyDashboardScreen> createState() => _MyDashboardScreenState();
}

class _MyDashboardScreenState extends State<MyDashboardScreen> {
  int _selectedIndex = 0;
  List<Widget> lstBOttomScreen = [
    const HomeScreen(), // const HomePage(),
    const WorkOutScreen(), // const GymScreen(),
    const CalculatorScreen(),
    const ProfileScreen(),
    const NotificationScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Dashboard',
          ),
          backgroundColor: const Color.fromARGB(255, 255, 55, 0),
          centerTitle: true,
        ),
        body: lstBOttomScreen[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.white,
          backgroundColor: const Color.fromARGB(255, 255, 55, 0),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.run_circle_sharp),
              label: 'Workout',
            ),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.group_sharp,
                ),
                label: 'Group'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.person,
                ),
                label: 'Profile'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.notification_add_outlined,
                ),
                label: 'Notification'),
          ],
          currentIndex: _selectedIndex,
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
        ),
      ),
    );
  }
}
