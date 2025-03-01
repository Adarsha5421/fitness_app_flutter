import 'package:flutter/material.dart';
import 'package:gym_tracker_app/features/calculator/presentation/pages/calculator_screen.dart';
import 'package:gym_tracker_app/features/calculator/presentation/widgets/common/calculator_card.dart';
import 'package:gym_tracker_app/features/calculator/presentation/widgets/common/dropdown.dart';
import 'package:gym_tracker_app/features/calculator/presentation/widgets/common/tf.dart';

class MacroCalculatorTab extends StatelessWidget {
  const MacroCalculatorTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const CalculatorCard(title: 'Macro Calculator', fields: [
      CustomTextField(label: 'Weight (kg)'),
      CustomDropdownField(label: 'Goal', items: ['Maintain', 'Lose Weight', 'Gain Weight']),
    ]);
  }
}
