import '../../models/achievement_model.dart';

const List<AchievementModel> dummyAchievements = [
  AchievementModel(
    id: '1',
    title: 'Survey Completed',
    description: 'You completed your onboarding survey.',
    isUnlocked: true,
  ),
  AchievementModel(
    id: '2',
    title: 'First Skill Unlocked',
    description: 'You unlocked your first career skill.',
    isUnlocked: true,
  ),
  AchievementModel(
    id: '3',
    title: 'Career Explorer',
    description: 'You viewed your first career path.',
    isUnlocked: false,
  ),
  AchievementModel(
    id: '4',
    title: "Dean's List",
    description: 'Fall 2025 semester',
    isUnlocked: true,
  ),
  AchievementModel(
    id: '5',
    title: 'Player of the Week',
    description: 'Week of March 24',
    isUnlocked: true,
  ),
];