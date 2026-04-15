import 'package:flutter/material.dart';
import '../../models/achievement_model.dart';

class AchievementTile extends StatelessWidget {
  final AchievementModel achievement;

  const AchievementTile({
    super.key,
    required this.achievement,
  });

  Color getBgColor() {
    switch (achievement.title) {
      case 'Survey Completed':
        return const Color(0xFFFFF8D9);
      case "Dean's List":
        return const Color(0xFFEAF2FF);
      default:
        return const Color(0xFFFFEEF1);
    }
  }

  Color getIconColor() {
    switch (achievement.title) {
      case 'Survey Completed':
        return const Color(0xFFF2C200);
      case "Dean's List":
        return const Color(0xFF2979FF);
      default:
        return const Color(0xFFE70E2F);
    }
  }

  IconData getIcon() {
    switch (achievement.title) {
      case 'Survey Completed':
        return Icons.emoji_events_outlined;
      case "Dean's List":
        return Icons.menu_book_outlined;
      default:
        return Icons.workspace_premium_outlined;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: getBgColor(),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              color: getIconColor(),
              shape: BoxShape.circle,
            ),
            child: Icon(
              getIcon(),
              color: Colors.white,
              size: 34,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  achievement.title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  achievement.description,
                  style: const TextStyle(
                    fontSize: 15,
                    color: Color(0xFF6B7280),
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