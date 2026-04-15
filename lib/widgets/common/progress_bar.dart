import 'package:flutter/material.dart';

class ProgressBar extends StatelessWidget {
  final double value;
  final double height;
  final String? label;
  final String? trailingText;
  final BorderRadius? borderRadius;

  const ProgressBar({
    super.key,
    required this.value,
    this.height = 10,
    this.label,
    this.trailingText,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final clampedValue = value.clamp(0.0, 1.0);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null || trailingText != null)
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Row(
              children: [
                if (label != null)
                  Expanded(
                    child: Text(
                      label!,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                if (trailingText != null)
                  Text(
                    trailingText!,
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
              ],
            ),
          ),
        ClipRRect(
          borderRadius: borderRadius ?? BorderRadius.circular(999),
          child: LinearProgressIndicator(
            value: clampedValue,
            minHeight: height,
            backgroundColor: theme.colorScheme.surfaceContainerHighest,
          ),
        ),
      ],
    );
  }
}