import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text("Sweat"),
      //   backgroundColor: Colors.red,
      // ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Welcome Back!", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),
              const Text("Today's Workout: Chest and Triceps"),
              // const SizedBox(height: 20),
              // const Card(
              //   elevation: 4,
              //   child: Padding(
              //     padding: EdgeInsets.all(16.0),
              //     child: Row(
              //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //       children: [
              //         Column(
              //           crossAxisAlignment: CrossAxisAlignment.start,
              //           children: [
              //             Text("Total Workouts", style: TextStyle(fontWeight: FontWeight.bold)),
              //             Text("123"),
              //           ],
              //         ),
              //         Icon(Icons.fitness_center, size: 40),
              //       ],
              //     ),
              //   ),
              // ),
              // SvgPicture.network('http://localhost:3000/static/media/muscle-map.8b054866254ba0850f3d50e8d59a501c.svg')
              Container(
                  // color: Colors.amber,
                  child: Image.asset(
                'assets/images/muscle.png',
                width: 500,
                height: 700,
                fit: BoxFit.fitWidth,
              ))
            ],
          ),
        ),
      ),
    );
  }
}
