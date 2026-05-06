import '../../data/dummy/dummy_careers.dart';
import '../../data/dummy/dummy_skill_trees.dart';
import '../../models/career_model.dart';
import '../../models/skill_node_model.dart';

class CareerRepository {
  List<CareerModel> getCareers() {
    return dummyCareers;
  }

  List<SkillNodeModel> getSkillTree(String careerId) {
    return dummySkillTrees[careerId]
            ?.map((skill) => skill.copyWith())
            .toList() ??
        [];
  }
}