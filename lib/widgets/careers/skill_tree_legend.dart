import 'package:flutter/material.dart';

class SkillTreeLegend extends StatelessWidget {
  const SkillTreeLegend({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 16,
      runSpacing: 8,
      children: const [
        _LegendItem(
          icon: Icons.check_circle,
          color: Colors.green,
          label: 'Completed',
        ),
        _LegendItem(
          icon: Icons.radio_button_unchecked,
          color: Colors.black54,
          label: 'Unlocked',
        ),
        _LegendItem(
          icon: Icons.lock,
          color: Colors.grey,
          label: 'Locked',
        ),
      ],
    );
  }
}

class _LegendItem extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String label;

  const _LegendItem({
    required this.icon,
    required this.color,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 18, color: color),
        const SizedBox(width: 6),
        Text(label),
      ],
    );
  }
}