import 'package:flutter/material.dart';
import 'package:gym_tracker_app/view/bottom_navigation_screens/group_view.dart';
import 'package:gym_tracker_app/view/bottom_navigation_screens/notification_view.dart';
import 'package:gym_tracker_app/view/bottom_navigation_screens/profile_view.dart';
import 'package:gym_tracker_app/view/bottom_navigation_screens/workout_view.dart';
import 'package:gym_tracker_app/view/homepage_view.dart';

class MyDashboardView extends StatefulWidget {
  const MyDashboardView({super.key});

  @override
  State<MyDashboardView> createState() => _MyDashboardViewState();
}

class _MyDashboardViewState extends State<MyDashboardView> {
  int _selectedIndex = 0;
  List<Widget> lstBOttomScreen = [
    const HomePage(),
    const GymScreen(),
    const GroupScreen(),
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
