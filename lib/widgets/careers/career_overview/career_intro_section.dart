import 'package:flutter/material.dart';

import '../../../models/career_model.dart';
import 'overview_styles.dart';

class CareerIntroSection extends StatelessWidget {
  final CareerModel career;

  const CareerIntroSection({super.key, required this.career});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 56,
          height: 56,
          decoration: BoxDecoration(
            color: OverviewStyles.redSoft,
            borderRadius: BorderRadius.circular(14),
          ),
          child: const Icon(
            Icons.emoji_events_outlined,
            color: OverviewStyles.red,
            size: 34,
          ),
        ),
        const SizedBox(width: 14),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Text(
              career.description,
              style: const TextStyle(
                color: OverviewStyles.muted,
                fontSize: 14,
                height: 1.5,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class CareerStat {
  final IconData icon;
  final String label;
  final String value;
  final String detail;

  const CareerStat({
    required this.icon,
    required this.label,
    required this.value,
    required this.detail,
  });
}

class CareerStatsRow extends StatelessWidget {
  final List<CareerStat> stats;

  const CareerStatsRow({super.key, required this.stats});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (final stat in stats) ...[
          Expanded(child: _CareerStatCard(stat: stat)),
          if (stat != stats.last) const SizedBox(width: 8),
        ],
      ],
    );
  }
}

class _CareerStatCard extends StatelessWidget {
  final CareerStat stat;

  const _CareerStatCard({required this.stat});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(minHeight: 134),
      padding: const EdgeInsets.all(10),
      decoration: OverviewStyles.card(OverviewStyles.red),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(stat.icon, color: OverviewStyles.red, size: 19),
          const SizedBox(height: 8),
          Text(
            stat.label,
            style: const TextStyle(fontSize: 10, fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 10),
          Text(
            stat.value,
            style: const TextStyle(
              color: OverviewStyles.red,
              fontSize: 20,
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            stat.detail,
            style: const TextStyle(
              color: OverviewStyles.muted,
              fontSize: 10,
              height: 1.25,
            ),
          ),
        ],
      ),
    );
  }
}
