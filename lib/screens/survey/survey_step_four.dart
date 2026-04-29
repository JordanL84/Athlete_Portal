import 'package:flutter/material.dart';
import '../../widgets/survey/checkbox_tile.dart';

class SurveyStepFour extends StatefulWidget {
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

  @override
  State<SurveyStepFour> createState() => _SurveyStepFourState();
}

class _SurveyStepFourState extends State<SurveyStepFour> {
  late TextEditingController controller;

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

  @override
  void initState() {
    super.initState();
    controller = TextEditingController(text: widget.careerGoal);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void toggle(String option) {
    final updated = List<String>.from(widget.selected);

    if (updated.contains(option)) {
      updated.remove(option);
    } else {
      updated.add(option);
    }

    widget.onChanged(updated);
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ...options.map(
          (option) => CheckboxTile(
            label: option,
            isSelected: widget.selected.contains(option),
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
          onChanged: widget.onGoalChanged,
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