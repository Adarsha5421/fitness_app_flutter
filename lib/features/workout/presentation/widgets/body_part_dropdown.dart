import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gym_tracker_app/features/workout/presentation/cubit/workout_cubit.dart';
import 'package:gym_tracker_app/features/workout/presentation/cubit/workout_state.dart';

class BodyPartDropdown extends StatefulWidget {
  final WorkOutState state;
  const BodyPartDropdown({super.key, required this.state});

  @override
  State<BodyPartDropdown> createState() => _BodyPartDropdownState();
}

class _BodyPartDropdownState extends State<BodyPartDropdown> {
  String? selectedValue;
  // [
  //   'Item 1',
  //   'Item 2',
  //   'Item 3',
  //   'Item 4',
  //   'Item 5',
  // ];

  @override
  Widget build(BuildContext context) {
    final List<String> items = widget.state.workOutBodyPartsList;
    return Container(
      height: 100,
      padding: const EdgeInsets.all(16.0),
      child: DropdownButtonFormField<String>(
        decoration: InputDecoration(
          labelText: 'Select Body Type',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        ),
        value: selectedValue,
        icon: const Icon(Icons.keyboard_arrow_down),
        isExpanded: true,
        hint: const Text('Choose Body Type'),
        items: items.map((String item) {
          return DropdownMenuItem(
            value: item,
            child: Text(item),
          );
        }).toList(),
        onChanged: (String? value) {
          setState(() {
            selectedValue = value;
            context.read<WorkoutCubit>().filterBodyParts(value!);
          });
          // You can add your logic here for when a selection changes
          print('Selected: $value');
        },
      ),
    );
  }
}
