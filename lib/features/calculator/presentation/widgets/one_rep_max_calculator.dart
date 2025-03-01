import 'package:flutter/material.dart';
import 'package:gym_tracker_app/features/calculator/presentation/pages/calculator_screen.dart';
import 'package:gym_tracker_app/features/calculator/presentation/widgets/common/calculator_card.dart';
import 'package:gym_tracker_app/features/calculator/presentation/widgets/common/tf.dart';

class OneRepMaxCalculatorTab extends StatelessWidget {
  const OneRepMaxCalculatorTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const CalculatorCard(title: 'One-Rep Max Calculator', fields: [
      CustomTextField(label: 'Weight Lifted (kg)'),
      CustomTextField(label: 'Reps Performed'),
    ]);
  }
}
