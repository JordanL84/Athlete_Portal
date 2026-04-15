import 'package:flutter/material.dart';
import '../../models/schedule_item_model.dart';

class ScheduleItemCard extends StatelessWidget {
  final ScheduleItemModel item;

  const ScheduleItemCard({
    super.key,
    required this.item,
  });

  Color getAccentColor() {
    switch (item.type) {
      case 'athletic':
        return const Color(0xFFE70E2F);
      case 'academic':
        return const Color(0xFF5B5CEB);
      case 'study':
        return const Color(0xFF16A34A);
      default:
        return const Color(0xFF6B7280);
    }
  }

  Color getSoftColor() {
    switch (item.type) {
      case 'athletic':
        return const Color(0xFFF9E1E5);
      case 'academic':
        return const Color(0xFFE8E9FF);
      case 'study':
        return const Color(0xFFE1F5E8);
      default:
        return const Color(0xFFF3F4F6);
    }
  }

  IconData getIcon() {
    switch (item.type) {
      case 'athletic':
        return Icons.emoji_events_outlined;
      case 'academic':
        return Icons.menu_book_outlined;
      case 'study':
        return Icons.book_outlined;
      default:
        return Icons.event_outlined;
    }
  }

  String getTagLabel() {
    switch (item.type) {
      case 'athletic':
        return 'practice';
      case 'academic':
        return 'class';
      case 'study':
        return 'study-hall';
      default:
        return item.type;
    }
  }

  String getLocation() {
    switch (item.title) {
      case 'Team Practice':
        return 'Xfinity Center';
      case 'KNES 285: Intro to Sport Management':
        return 'SPH Building';
      case 'BMGT 230: Business Statistics':
        return 'Van Munching Hall';
      case 'Mandatory Study Hall':
        return 'Academic Success Center';
      default:
        return 'Campus';
    }
  }

  @override
  Widget build(BuildContext context) {
    final accent = getAccentColor();

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: const Color(0xFFE5E7EB)),
      ),
      child: Row(
        children: [
          Container(
            width: 6,
            height: 156,
            decoration: BoxDecoration(
              color: accent,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(22),
                bottomLeft: Radius.circular(22),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        width: 74,
                        height: 74,
                        decoration: BoxDecoration(
                          color: getSoftColor(),
                          borderRadius: BorderRadius.circular(18),
                        ),
                        child: Icon(
                          getIcon(),
                          color: accent,
                          size: 38,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Text(
                          item.title,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            height: 1.3,
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: accent, width: 2),
                        ),
                        child: Text(
                          getTagLabel(),
                          style: TextStyle(
                            color: accent,
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      const Icon(
                        Icons.access_time,
                        size: 16,
                        color: Color(0xFF6B7280),
                      ),
                      const SizedBox(width: 6),
                      Expanded(
                        child: Text(
                          '${item.day} • ${item.time}',
                          style: const TextStyle(
                            fontSize: 15,
                            color: Color(0xFF6B7280),
                            height: 1.35,
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      const Icon(
                        Icons.location_on_outlined,
                        size: 16,
                        color: Color(0xFF6B7280),
                      ),
                      const SizedBox(width: 4),
                      Expanded(
                        child: Text(
                          getLocation(),
                          textAlign: TextAlign.right,
                          style: const TextStyle(
                            fontSize: 15,
                            color: Color(0xFF6B7280),
                            height: 1.35,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}