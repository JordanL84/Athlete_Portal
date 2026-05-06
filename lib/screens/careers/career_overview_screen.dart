import 'package:flutter/material.dart';

import '../../data/dummy/dummy_skill_trees.dart';
import '../../models/career_model.dart';
import '../../models/skill_node_model.dart';
import '../../widgets/careers/career_overview/athlete_header.dart';
import '../../widgets/careers/career_overview/build_skills_section.dart';
import '../../widgets/careers/career_overview/career_intro_section.dart';
import '../../widgets/careers/career_overview/info_section.dart';
import '../../widgets/careers/career_overview/recommended_skills_section.dart';
import 'career_detail_screen.dart';

class CareerOverviewScreen extends StatelessWidget {
  static const String routeName = '/career-overview';

  const CareerOverviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments;
    final career = args as CareerModel? ?? _fallbackCareer;
    final skills = _skillsFor(career);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            const AthleteHeader(),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(16, 36, 16, 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextButton.icon(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(Icons.arrow_back),
                      label: const Text('Your Career Matches'),
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.black,
                        padding: EdgeInsets.zero,
                      ),
                    ),
                    const SizedBox(height: 24),
                    CareerIntroSection(career: career),
                    const SizedBox(height: 18),
                    CareerStatsRow(stats: _stats),
                    const SizedBox(height: 18),
                    RecommendedSkillsSection(
                      skills: skills,
                      onViewRoadmap: () {
                        Navigator.pushNamed(
                          context,
                          CareerDetailScreen.routeName,
                          arguments: career,
                        );
                      },
                    ),
                    const SizedBox(height: 18),
                    BuildSkillsSection(items: _clubItems),
                    const SizedBox(height: 18),
                    const InfoSection(contacts: _contacts),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<SkillNodeModel> _skillsFor(CareerModel career) {
    final skillTree = dummySkillTrees[career.id];
    if (career.id == 'sports_management' || skillTree == null) {
      return _sportsManagementSkills;
    }
    return skillTree;
  }
}

const _fallbackCareer = CareerModel(
  id: 'sports_management',
  title: 'Sports Management',
  description:
      'Lead athletic programs, manage facilities, and coordinate sports organizations.',
  matchPercent: 90,
  tags: ['Leadership', 'Teamwork', 'Operations'],
);

const _sportsManagementSkills = [
  SkillNodeModel(
    id: 'budget_financial_planning',
    title: 'Budget & Financial Planning',
    level: 'Foundation',
    description:
        'Create budgets, manage revenue streams, and control operational costs',
    isCompleted: true,
    isUnlocked: true,
  ),
  SkillNodeModel(
    id: 'leadership_management',
    title: 'Leadership & Management',
    level: 'Foundation',
    description: 'Lead teams, make strategic decisions, and manage resources',
    isCompleted: true,
    isUnlocked: true,
  ),
  SkillNodeModel(
    id: 'event_planning_operations',
    title: 'Event Planning & Operations',
    level: 'Foundation',
    description:
        'Organize tournaments, manage game day operations, and coordinate logistics',
    isCompleted: true,
    isUnlocked: true,
  ),
  SkillNodeModel(
    id: 'contract_negotiation',
    title: 'Contract Negotiation',
    level: 'Intermediate',
    description:
        'Negotiate sponsorships, vendor contracts, and partnership agreements',
    isUnlocked: true,
  ),
  SkillNodeModel(
    id: 'facility_management',
    title: 'Facility Management',
    level: 'Intermediate',
    description: 'Oversee venue operations, maintenance, and safety protocols',
    isUnlocked: true,
  ),
  SkillNodeModel(
    id: 'marketing_promotions',
    title: 'Marketing & Promotions',
    level: 'Intermediate',
    description:
        'Promote programs, engage fans, and build community relationships',
    isUnlocked: true,
  ),
  SkillNodeModel(
    id: 'legal_compliance',
    title: 'Legal & Compliance',
    level: 'Bonus',
    description:
        'Understand NCAA regulations, Title IX, and sports law fundamentals',
  ),
  SkillNodeModel(
    id: 'crisis_management',
    title: 'Crisis Management',
    level: 'Bonus',
    description:
        'Handle emergencies, media relations, and unexpected challenges',
  ),
];

const _stats = [
  CareerStat(
    icon: Icons.school_outlined,
    label: 'Recommended GPA',
    value: '3.0+',
    detail: 'Leadership experience valued highly',
  ),
  CareerStat(
    icon: Icons.trending_up,
    label: 'Avg. Starting Salary',
    value: r'$45K',
    detail: r'Directors can earn $80K-$150K+',
  ),
  CareerStat(
    icon: Icons.workspace_premium_outlined,
    label: 'Job Growth',
    value: '8%',
    detail: 'Steady growth through 2030',
  ),
];

const _clubItems = [
  SkillResource(
    title: 'UMD Sports Business Club',
    description:
        'Network with sports industry professionals and learn business fundamentals',
  ),
  SkillResource(
    title: 'Sport Management Association',
    description:
        'Professional development for aspiring sports administrators and managers',
  ),
  SkillResource(
    title: 'Entrepreneurship Association',
    description:
        'Develop business skills and learn to launch sports-related ventures',
  ),
  SkillResource(
    title: 'Student-Athlete Advisory Committee (SAAC)',
    description:
        'Voice of student-athletes with leadership and event planning opportunities',
  ),
];

const _contacts = [
  CareerContact(
    name: 'Dr. David Martinez',
    role: 'Sports Management Program Director',
    email: 'dmartinez@umd.edu',
    hours: 'Office Hours: Tuesdays & Thursdays, 1:00-2:30 PM',
  ),
  CareerContact(
    name: 'Lisa Thompson',
    role: 'Associate Athletic Director - Operations',
    email: 'lthompson@umd.edu',
    hours: 'Office Hours: By appointment',
  ),
  CareerContact(
    name: 'Kevin Anderson',
    role: 'Senior Event Manager - Maryland Athletics',
    email: 'kanderson@umd.edu',
    hours: 'Office Hours: Wednesdays, 2:00-4:00 PM',
  ),
];
