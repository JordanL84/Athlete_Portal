import 'package:flutter/material.dart';
import '../../models/schedule_item_model.dart';

class ScheduleItemCard extends StatelessWidget {
  final ScheduleItemModel item;

  const ScheduleItemCard({
    super.key,
    required this.item,
  });

  IconData getIcon() {
    switch (item.type) {
      case 'athletic':
        return Icons.sports_basketball;
      case 'academic':
        return Icons.school;
      case 'meeting':
        return Icons.calendar_today;
      default:
        return Icons.event;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          getIcon(),
          size: 20,
          color: Colors.black87,
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            item.title,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Text(
          '${item.day} • ${item.time}',
          style: const TextStyle(
            color: Colors.black54,
            fontSize: 13,
          ),
        ),
      ],
    );
  }
}