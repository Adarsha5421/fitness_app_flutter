import 'package:flutter/material.dart';
import 'package:gym_tracker_app/features/calculator/presentation/pages/calculator_screen.dart';
import 'package:gym_tracker_app/features/calculator/presentation/widgets/common/calculator_card.dart';
import 'package:gym_tracker_app/features/calculator/presentation/widgets/common/dropdown.dart';
import 'package:gym_tracker_app/features/calculator/presentation/widgets/common/tf.dart';

class CalorieCalculatorTab extends StatelessWidget {
  const CalorieCalculatorTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const CalculatorCard(title: 'Calorie Calculator', fields: [
      CustomTextField(label: 'Weight (kg)'),
      CustomTextField(label: 'Height (cm)'),
      CustomTextField(label: 'Age'),
      CustomDropdownField(label: 'Gender', items: ['Male', 'Female']),
      CustomDropdownField(label: 'Activity Level', items: ['Sedentary', 'Lightly Active', 'Active']),
    ]);
  }
}
