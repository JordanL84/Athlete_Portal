import 'package:flutter/material.dart';

class SurveyNavButtons extends StatelessWidget {
  final VoidCallback onNext;
  final VoidCallback? onBack;
  final bool isLastStep;

  const SurveyNavButtons({
    super.key,
    required this.onNext,
    this.onBack,
    this.isLastStep = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (onBack != null)
          Expanded(
            child: OutlinedButton(
              onPressed: onBack,
              style: OutlinedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text('Back'),
            ),
          ),

        if (onBack != null) const SizedBox(width: 10),

        Expanded(
          child: ElevatedButton(
            onPressed: onNext,
            child: Text(isLastStep ? 'Finish' : 'Next'),
          ),
        ),
      ],
    );
  }
}