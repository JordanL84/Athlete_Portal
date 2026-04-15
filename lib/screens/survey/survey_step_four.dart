import 'package:flutter/material.dart';
import '../../widgets/survey/checkbox_tile.dart';

class SurveyStepFour extends StatelessWidget {
  final List<String> selected;
  final String careerGoal;
  final Function(List<String>) onChanged;
  final Function(String) onGoalChanged;

  const SurveyStepFour({
    super.key,
    required this.selected,
    required this.careerGoal,
    required this.onChanged,
    required this.onGoalChanged,
  });

  static const List<String> options = [
    'Team-based collaborative environment',
    'Independent work',
    'Mix of both',
    'Fast-paced environment',
    'Structured / routine work',
    'Creative / flexible work',
    'Helping others directly',
    'Working with data / numbers',
    'Leading people / projects',
    'Public-facing communication work',
  ];

  void toggle(String option) {
    final updated = List<String>.from(selected);
    if (updated.contains(option)) {
      updated.remove(option);
    } else {
      updated.add(option);
    }
    onChanged(updated);
  }

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController(text: careerGoal);
    controller.selection = TextSelection.fromPosition(
      TextPosition(offset: controller.text.length),
    );

    return ListView(
      children: [
        ...options.map(
          (option) => CheckboxTile(
            label: option,
            isSelected: selected.contains(option),
            onTap: () => toggle(option),
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          'Career Goals',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        TextField(
          controller: controller,
          maxLines: 5,
          onChanged: onGoalChanged,
          decoration: InputDecoration(
            hintText:
                'Describe your dream job, career goals, or industries you want to explore.',
            filled: true,
            fillColor: Colors.white,
            contentPadding: const EdgeInsets.all(16),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(color: Colors.grey.shade300),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(color: Colors.grey.shade300),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(color: Colors.black),
            ),
          ),
        ),
      ],
    );
  }
}