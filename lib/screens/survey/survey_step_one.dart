import 'package:flutter/material.dart';
import '../../widgets/survey/checkbox_tile.dart';

class SurveyStepOne extends StatelessWidget {
  final List<String> selected;
  final Function(List<String>) onChanged;

  const SurveyStepOne({
    super.key,
    required this.selected,
    required this.onChanged,
  });

  static const List<String> options = [
    'Leadership roles (team captain, club leader)',
    'Team-based activities',
    'Volunteer work',
    'Research projects',
    'Event planning',
    'Mentoring / tutoring',
    'Content creation (social media, video)',
    'Data / analytics projects',
    'Tech / coding projects',
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