import 'package:flutter/material.dart';
import '../../models/skill_node_model.dart';

class SkillNodeCard extends StatelessWidget {
  final SkillNodeModel skill;
  final VoidCallback onTap;

  const SkillNodeCard({
    super.key,
    required this.skill,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: skill.isUnlocked ? onTap : null,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(
            color: skill.isCompleted
                ? Colors.green
                : skill.isUnlocked
                    ? Colors.transparent
                    : Colors.grey.shade300,
          ),
        ),
        child: Row(
          children: [
            Container(
              width: 28,
              height: 28,
              decoration: BoxDecoration(
                color: skill.isCompleted ? Colors.green : Colors.transparent,
                shape: BoxShape.circle,
                border: Border.all(
                  color: skill.isUnlocked
                      ? (skill.isCompleted ? Colors.green : Colors.black54)
                      : Colors.grey,
                  width: 2,
                ),
              ),
              child: skill.isCompleted
                  ? const Icon(
                      Icons.check,
                      size: 18,
                      color: Colors.white,
                    )
                  : skill.isUnlocked
                      ? null
                      : const Icon(
                          Icons.lock,
                          size: 14,
                          color: Colors.grey,
                        ),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    skill.title,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: skill.isUnlocked ? Colors.black : Colors.grey,
                    ),
                  ),
                  if (skill.description != null) ...[
                    const SizedBox(height: 4),
                    Text(
                      skill.description!,
                      style: TextStyle(
                        color: skill.isUnlocked ? Colors.black87 : Colors.grey,
                      ),
                    ),
                  ],
                  const SizedBox(height: 6),
                  Text(
                    skill.isCompleted
                        ? 'Completed • +10 XP'
                        : skill.isUnlocked
                            ? 'Unlocked'
                            : 'Locked until prerequisites are complete',
                    style: TextStyle(
                      fontSize: 13,
                      color: skill.isCompleted
                          ? Colors.green
                          : skill.isUnlocked
                              ? Colors.black54
                              : Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}