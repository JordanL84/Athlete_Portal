import 'package:flutter/material.dart';
import '../../data/dummy/dummy_skill_trees.dart';
import '../../models/career_model.dart';
import '../../models/skill_node_model.dart';
import '../../widgets/careers/skill_level_banner.dart';
import '../../widgets/careers/skill_node_card.dart';
import '../../widgets/careers/skill_tree_legend.dart';
import '../../widgets/careers/xp_header.dart';

class CareerDetailScreen extends StatefulWidget {
  static const String routeName = '/career-detail';

  const CareerDetailScreen({super.key});

  @override
  State<CareerDetailScreen> createState() => _CareerDetailScreenState();
}

class _CareerDetailScreenState extends State<CareerDetailScreen> {
  late CareerModel career;
  late List<SkillNodeModel> skills;
  bool _initialized = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (!_initialized) {
      final args = ModalRoute.of(context)?.settings.arguments;
      career = args as CareerModel? ?? dummyCareersSkillTreeFallbackCareer;
      skills = dummySkillTrees[career.id]
              ?.map((skill) => skill.copyWith())
              .toList() ??
          [];
      _initialized = true;
      refreshUnlockedSkills();
    }
  }

  bool canUnlock(SkillNodeModel skill) {
    if (skill.prerequisiteIds.isEmpty) return true;

    return skill.prerequisiteIds.every((prereqId) {
      final prereq = skills.firstWhere(
        (item) => item.id == prereqId,
        orElse: () => const SkillNodeModel(
          id: '',
          title: '',
          level: '',
        ),
      );
      return prereq.isCompleted;
    });
  }

  void refreshUnlockedSkills() {
    skills = skills.map((skill) {
      if (!skill.isCompleted && canUnlock(skill)) {
        return skill.copyWith(isUnlocked: true);
      }
      return skill;
    }).toList();
  }

  void toggleSkill(String skillId) {
    setState(() {
      skills = skills.map((skill) {
        if (skill.id == skillId && skill.isUnlocked && !skill.isCompleted) {
          return skill.copyWith(isCompleted: true);
        }
        return skill;
      }).toList();

      refreshUnlockedSkills();
    });
  }

  int get completedCount => skills.where((skill) => skill.isCompleted).length;

  int get totalXP => completedCount * 10;

  List<String> get levels {
    final uniqueLevels = skills.map((e) => e.level).toSet().toList();
    return uniqueLevels;
  }

  @override
  Widget build(BuildContext context) {
    final progress = skills.isEmpty ? 0.0 : completedCount / skills.length;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Career Path'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top summary card
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    career.title,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(career.description),
                  const SizedBox(height: 16),
                  XPHeader(
                    xp: totalXP,
                    progress: progress,
                  ),
                  const SizedBox(height: 8),
                  Text('$completedCount of ${skills.length} skills completed'),
                ],
              ),
            ),

            const SizedBox(height: 20),

            const Text(
              'Skill Roadmap',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Complete unlocked skills to earn XP. New skills unlock automatically when prerequisites are completed.',
            ),

            const SizedBox(height: 16),

            const SkillTreeLegend(),

            const SizedBox(height: 20),

            ...levels.map((level) {
              final levelSkills =
                  skills.where((skill) => skill.level == level).toList();

              return Padding(
                padding: const EdgeInsets.only(bottom: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SkillLevelBanner(title: level),
                    const SizedBox(height: 12),
                    ...levelSkills.map(
                      (skill) => Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: SkillNodeCard(
                          skill: skill,
                          onTap: () => toggleSkill(skill.id),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}

final CareerModel dummyCareersSkillTreeFallbackCareer = CareerModel(
  id: 'business_analytics',
  title: 'Business & Analytics',
  description:
      'Blend strategy, business knowledge, and data skills to solve real-world problems.',
  matchPercent: 95,
  tags: const ['Analytics', 'Strategy', 'Problem Solving'],
);