import 'package:flutter/material.dart';

class XPHeader extends StatelessWidget {
  final int xp;
  final double progress;

  const XPHeader({
    super.key,
    required this.xp,
    required this.progress,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: LinearProgressIndicator(
              value: progress,
              minHeight: 10,
            ),
          ),
        ),
        const SizedBox(width: 12),
        Text(
          '$xp XP',
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}