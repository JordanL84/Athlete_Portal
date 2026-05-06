import 'package:flutter/material.dart';

import 'overview_styles.dart';

class SkillResource {
  final String title;
  final String description;

  const SkillResource({required this.title, required this.description});
}

class BuildSkillsSection extends StatelessWidget {
  final List<SkillResource> items;

  const BuildSkillsSection({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: OverviewStyles.card(const Color(0xFFFFC9D2)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Icon(Icons.menu_book_outlined, color: OverviewStyles.red),
              SizedBox(width: 8),
              Text(
                'Build Your Skills',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
              ),
            ],
          ),
          const SizedBox(height: 8),
          const Text(
            'Courses, clubs, and activities to develop your expertise',
            style: TextStyle(color: OverviewStyles.muted, height: 1.35),
          ),
          const SizedBox(height: 16),
          const _Tabs(),
          const SizedBox(height: 16),
          for (final item in items)
            Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: _ResourceTile(item: item),
            ),
        ],
      ),
    );
  }
}

class _Tabs extends StatelessWidget {
  const _Tabs();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 34,
      decoration: BoxDecoration(
        color: const Color(0xFFE8E8ED),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        children: const [
          Expanded(child: _TabLabel('Courses (5)')),
          Expanded(child: _TabLabel('Clubs (4)', selected: true)),
          Expanded(child: _TabLabel('Activities (4)')),
        ],
      ),
    );
  }
}

class _TabLabel extends StatelessWidget {
  final String label;
  final bool selected;

  const _TabLabel(this.label, {this.selected = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.all(3),
      decoration: BoxDecoration(
        color: selected ? Colors.white : Colors.transparent,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Text(
        label,
        style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 12),
      ),
    );
  }
}

class _ResourceTile extends StatelessWidget {
  final SkillResource item;

  const _ResourceTile({required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: OverviewStyles.purpleSoft,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color(0xFFD9B8FF)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 34,
            height: 34,
            decoration: BoxDecoration(
              color: OverviewStyles.purple,
              borderRadius: BorderRadius.circular(7),
            ),
            child: const Icon(
              Icons.groups_outlined,
              color: Colors.white,
              size: 18,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.title,
                  style: const TextStyle(
                    color: OverviewStyles.text,
                    fontWeight: FontWeight.w900,
                    fontSize: 13,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  item.description,
                  style: const TextStyle(
                    color: OverviewStyles.muted,
                    fontSize: 11,
                    height: 1.35,
                  ),
                ),
                const SizedBox(height: 8),
                Align(
                  alignment: Alignment.centerRight,
                  child: OutlinedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.open_in_new, size: 13),
                    label: const Text('Join'),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.black,
                      minimumSize: const Size(0, 30),
                      padding: const EdgeInsets.symmetric(horizontal: 9),
                      textStyle: const TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
