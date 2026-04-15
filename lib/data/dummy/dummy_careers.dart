import '../../models/career_model.dart';

final List<CareerModel> dummyCareers = [
  const CareerModel(
    id: 'business_analytics',
    title: 'Business & Analytics',
    description:
        'Combine business strategy with data analysis to help organizations make smarter decisions.',
    matchPercent: 95,
    tags: ['Analytics', 'Strategy', 'Problem Solving'],
  ),
  const CareerModel(
    id: 'sports_management',
    title: 'Sports Management',
    description:
        'Work behind the scenes in sports organizations, managing teams, events, and operations.',
    matchPercent: 90,
    tags: ['Leadership', 'Teamwork', 'Operations'],
  ),
  const CareerModel(
    id: 'sports_marketing',
    title: 'Sports Marketing & Media',
    description:
        'Promote athletes, teams, and brands through marketing, media, and content creation.',
    matchPercent: 88,
    tags: ['Marketing', 'Creativity', 'Communication'],
  ),
];