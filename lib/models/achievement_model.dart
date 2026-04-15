class AchievementModel {
  final String id;
  final String title;
  final String description;
  final bool isUnlocked;

  const AchievementModel({
    required this.id,
    required this.title,
    required this.description,
    this.isUnlocked = true,
  });
}