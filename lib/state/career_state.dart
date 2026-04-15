import '../models/skill_node_model.dart';

class CareerState {
  List<SkillNodeModel> skills = [];

  void setSkills(List<SkillNodeModel> skillList) {
    skills = skillList;
  }

  bool canUnlock(SkillNodeModel skill) {
    if (skill.prerequisiteIds.isEmpty) return true;

    return skill.prerequisiteIds.every((prereqId) {
      final prereq = skills.firstWhere(
        (s) => s.id == prereqId,
        orElse: () => SkillNodeModel(
          id: '',
          title: '',
          level: '',
        ),
      );
      return prereq.isCompleted;
    });
  }

  void unlockSkills() {
    skills = skills.map((skill) {
      if (!skill.isCompleted && canUnlock(skill)) {
        return skill.copyWith(isUnlocked: true);
      }
      return skill;
    }).toList();
  }

  void completeSkill(String skillId) {
    skills = skills.map((skill) {
      if (skill.id == skillId && skill.isUnlocked && !skill.isCompleted) {
        return skill.copyWith(isCompleted: true);
      }
      return skill;
    }).toList();

    unlockSkills();
  }

  int get completedCount {
    return skills.where((s) => s.isCompleted).length;
  }

  int get totalXP {
    return completedCount * 10;
  }

  double get progress {
    if (skills.isEmpty) return 0;
    return completedCount / skills.length;
  }
}