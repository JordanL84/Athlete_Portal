import 'package:flutter/material.dart';

import '../../../models/skill_node_model.dart';
import 'overview_styles.dart';

class RecommendedSkillsSection extends StatelessWidget {
  final List<SkillNodeModel> skills;
  final VoidCallback onViewRoadmap;

  const RecommendedSkillsSection({
    super.key,
    required this.skills,
    required this.onViewRoadmap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: OverviewStyles.card(OverviewStyles.red),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const _SectionHeading(
            icon: Icons.track_changes,
            title: 'Recommended Skills',
            subtitle:
                'Leadership and business skills for successful sports management careers',
          ),
          const SizedBox(height: 16),
          for (final skill in skills)
            Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: _SkillPreview(skill: skill),
            ),
          SizedBox(
            width: double.infinity,
            child: OutlinedButton.icon(
              onPressed: onViewRoadmap,
              label: const Text('View Your Skill Roadmap'),
              icon: const Icon(Icons.arrow_forward, size: 18),
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.black,
                padding: const EdgeInsets.symmetric(vertical: 13),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6),
                ),
                side: const BorderSide(color: Colors.black),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SkillPreview extends StatelessWidget {
  final SkillNodeModel skill;

  const _SkillPreview({required this.skill});

  @override
  Widget build(BuildContext context) {
    final isEssential = skill.level == 'Foundation';
    final isRecommended = skill.level == 'Intermediate';
    final border = isEssential
        ? OverviewStyles.red
        : isRecommended
        ? OverviewStyles.yellow
        : OverviewStyles.line;
    final background = isEssential
        ? OverviewStyles.redSoft
        : isRecommended
        ? OverviewStyles.yellowSoft
        : const Color(0xFFF8FAFC);
    final label = isEssential
        ? 'Essential'
        : isRecommended
        ? 'Recommended'
        : 'Bonus';

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
            decoration: BoxDecoration(
              color: border,
              borderRadius: BorderRadius.circular(4),
            ),
            child: Text(
              label,
              style: TextStyle(
                color: isRecommended ? Colors.black : Colors.white,
                fontSize: 9,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          const SizedBox(height: 7),
          Text(
            skill.title,
            style: const TextStyle(
              color: OverviewStyles.text,
              fontWeight: FontWeight.w800,
            ),
          ),
          if (skill.description != null) ...[
            const SizedBox(height: 6),
            Text(
              skill.description!,
              style: const TextStyle(
                color: OverviewStyles.muted,
                fontSize: 12,
                height: 1.35,
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class _SectionHeading extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  const _SectionHeading({
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(icon, color: OverviewStyles.red, size: 20),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Text(
          subtitle,
          style: const TextStyle(
            color: OverviewStyles.muted,
            fontSize: 12,
            height: 1.4,
          ),
        ),
      ],
    );
  }
}
