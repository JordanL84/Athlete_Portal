import '../../models/user_model.dart';

final UserModel dummyUser = UserModel(
  id: '1',
  name: 'Jordan',
  email: 'jordan@example.com',

  // These simulate survey answers
  experiences: [
    'Team-based activities',
    'Leadership roles (team captain, club leader)',
  ],
  interests: [
    'Business & Management',
    'Data & Analytics',
  ],
  skills: [
    'Leadership',
    'Teamwork',
    'Analytical Thinking',
  ],
  workPreferences: [
    'Team-based collaborative environment',
    'Fast-paced environment',
  ],
  careerGoal:
      'I want to work in sports analytics or business strategy after graduation.',
);