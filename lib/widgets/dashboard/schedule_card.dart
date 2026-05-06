import 'package:flutter/material.dart';
import '../../models/schedule_item_model.dart';
import 'schedule_item_card.dart';

class ScheduleCard extends StatefulWidget {
  final List<ScheduleItemModel> schedule;

  const ScheduleCard({super.key, required this.schedule});

  @override
  State<ScheduleCard> createState() => _ScheduleCardState();
}

class _ScheduleCardState extends State<ScheduleCard> {
  bool showWeek = false;

  @override
  Widget build(BuildContext context) {
    final visibleItems = showWeek
        ? widget.schedule
        : widget.schedule.take(2).toList();

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(26),
        border: Border.all(color: const Color(0xFFFFC400), width: 1.5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Icon(
                Icons.calendar_month_outlined,
                color: Color(0xFFE70E2F),
                size: 26,
              ),
              SizedBox(width: 10),
              Text(
                'Schedule',
                style: TextStyle(fontSize: 21, fontWeight: FontWeight.w700),
              ),
            ],
          ),
          const SizedBox(height: 10),
          const Text(
            'Your upcoming practices, games, and classes',
            style: TextStyle(
              fontSize: 15,
              color: Color(0xFF6B7280),
              height: 1.45,
            ),
          ),
          const SizedBox(height: 18),
          Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: const Color(0xFFF1F1F5),
              borderRadius: BorderRadius.circular(28),
            ),
            child: Row(
              children: [
                Expanded(
                  child: _ScheduleTab(
                    label: 'Today',
                    isSelected: !showWeek,
                    onTap: () => setState(() => showWeek = false),
                  ),
                ),
                Expanded(
                  child: _ScheduleTab(
                    label: 'This Week',
                    isSelected: showWeek,
                    onTap: () => setState(() => showWeek = true),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 18),
          ...visibleItems.map(
            (item) => Padding(
              padding: const EdgeInsets.only(bottom: 14),
              child: ScheduleItemCard(item: item),
            ),
          ),
        ],
      ),
    );
  }
}

class _ScheduleTab extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const _ScheduleTab({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        height: 44,
        decoration: BoxDecoration(
          color: isSelected ? Colors.white : Colors.transparent,
          borderRadius: BorderRadius.circular(24),
        ),
        alignment: Alignment.center,
        child: Text(
          label,
          style: TextStyle(
            fontWeight: isSelected ? FontWeight.w700 : FontWeight.w600,
            fontSize: 17,
            color: isSelected
                ? const Color(0xFF6A6A6A)
                : const Color(0xFF77777D),
          ),
        ),
      ),
    );
  }
}
