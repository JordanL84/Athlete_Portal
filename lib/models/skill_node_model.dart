class SkillNodeModel {
  final String id;
  final String title;
  final String level; // Foundation, Intermediate, Advanced, Expert
  final String? description;
  final List<String> prerequisiteIds;

  final bool isUnlocked;
  final bool isCompleted;

  const SkillNodeModel({
    required this.id,
    required this.title,
    required this.level,
    this.description,
    this.prerequisiteIds = const [],
    this.isUnlocked = false,
    this.isCompleted = false,
  });

  SkillNodeModel copyWith({
    String? id,
    String? title,
    String? level,
    String? description,
    List<String>? prerequisiteIds,
    bool? isUnlocked,
    bool? isCompleted,
  }) {
    return SkillNodeModel(
      id: id ?? this.id,
      title: title ?? this.title,
      level: level ?? this.level,
      description: description ?? this.description,
      prerequisiteIds: prerequisiteIds ?? this.prerequisiteIds,
      isUnlocked: isUnlocked ?? this.isUnlocked,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }
}