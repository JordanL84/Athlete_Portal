import '../../models/achievement_model.dart';

final List<AchievementModel> dummyAchievements = [
  const AchievementModel(
    id: '1',
    title: 'Survey Completed',
    description: 'You completed your onboarding survey.',
    isUnlocked: true,
  ),
  const AchievementModel(
    id: '2',
    title: 'First Skill Unlocked',
    description: 'You unlocked your first career skill.',
    isUnlocked: true,
  ),
  const AchievementModel(
    id: '3',
    title: 'Career Explorer',
    description: 'You viewed your first career path.',
    isUnlocked: false,
  ),
];