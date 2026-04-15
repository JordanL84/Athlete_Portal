import 'package:flutter/material.dart';
import '../../widgets/survey/checkbox_tile.dart';

class SurveyStepTwo extends StatelessWidget {
  final List<String> selected;
  final Function(List<String>) onChanged;

  const SurveyStepTwo({
    super.key,
    required this.selected,
    required this.onChanged,
  });

  static const List<String> options = [
    'Business & Management',
    'Marketing & Communications',
    'Finance',
    'Data & Analytics',
    'Technology',
    'Health & Wellness',
    'Education & Coaching',
    'Media & Journalism',
    'Psychology / Human Behavior',
    'Sports Administration',
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
    return ListView.builder(
      itemCount: options.length,
      itemBuilder: (context, index) {
        final option = options[index];
        return CheckboxTile(
          label: option,
          isSelected: selected.contains(option),
          onTap: () => toggle(option),
        );
      },
    );
  }
}