import 'package:flutter/material.dart';
import '../../models/achievement_model.dart';

class AchievementTile extends StatelessWidget {
  final AchievementModel achievement;

  const AchievementTile({
    super.key,
    required this.achievement,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          achievement.isUnlocked
              ? Icons.emoji_events
              : Icons.emoji_events_outlined,
          color: achievement.isUnlocked ? Colors.orange : Colors.grey,
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                achievement.title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: achievement.isUnlocked
                      ? Colors.black
                      : Colors.grey,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                achievement.description,
                style: TextStyle(
                  fontSize: 13,
                  color: achievement.isUnlocked
                      ? Colors.black54
                      : Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}