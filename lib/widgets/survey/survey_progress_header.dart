import 'package:flutter/material.dart';

class SurveyProgressHeader extends StatelessWidget {
  final int currentStep;
  final int totalSteps;
  final String title;
  final String subtitle;

  const SurveyProgressHeader({
    super.key,
    required this.currentStep,
    required this.totalSteps,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    final progress = currentStep / totalSteps;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: LinearProgressIndicator(
            value: progress,
            minHeight: 8,
          ),
        ),
        const SizedBox(height: 20),
        Text(
          'Step $currentStep of $totalSteps',
          style: const TextStyle(
            fontSize: 13,
            color: Colors.black54,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          title,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          subtitle,
          style: const TextStyle(
            fontSize: 15,
            color: Colors.black87,
          ),
        ),
      ],
    );
  }
}