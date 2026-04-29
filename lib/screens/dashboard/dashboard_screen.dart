import 'package:flutter/material.dart';
import '../../models/achievement_model.dart';
import '../../models/course_model.dart';
import '../../models/schedule_item_model.dart';
import '../../data/dummy/dummy_achievements.dart';
import '../../data/dummy/dummy_user.dart';
import '../../state/app_session.dart';
import '../../widgets/dashboard/academic_progress_card.dart';
import '../../widgets/dashboard/achievement_tile.dart';
import '../../widgets/dashboard/career_development_card.dart';
import '../../widgets/dashboard/help_option_tile.dart';
import '../../widgets/dashboard/profile_header.dart';
import '../../widgets/dashboard/schedule_card.dart';
import '../careers/careers_screen.dart';

class DashboardScreen extends StatelessWidget {
  static const String routeName = '/dashboard';

  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const polishedSchedule = [
      ScheduleItemModel(
        id: '1',
        title: 'Team Practice',
        day: 'Monday',
        time: '6:00 AM - 8:00 AM',
        type: 'athletic',
      ),
      ScheduleItemModel(
        id: '2',
        title: 'KNES 285: Intro to Sport Management',
        day: 'Monday',
        time: '10:00 AM - 11:15 AM',
        type: 'academic',
      ),
      ScheduleItemModel(
        id: '3',
        title: 'BMGT 230: Business Statistics',
        day: 'Monday',
        time: '2:00 PM - 3:15 PM',
        type: 'academic',
      ),
      ScheduleItemModel(
        id: '4',
        title: 'Mandatory Study Hall',
        day: 'Monday',
        time: '7:00 PM - 9:00 PM',
        type: 'study',
      ),
    ];

    const polishedCourses = [
      CourseModel(id: '1', name: 'KNES 285', grade: 'A-'),
      CourseModel(id: '2', name: 'BMGT 230', grade: 'B+'),
      CourseModel(id: '3', name: 'COMM 107', grade: 'A'),
      CourseModel(id: '4', name: 'ENGL 101', grade: 'B'),
    ];

    final topCareer = AppSession.matchedCareers.isNotEmpty
        ? AppSession.matchedCareers.first.title
        : 'Business & Analytics';

    final polishedAchievements = [
      ...dummyAchievements,
      const AchievementModel(
        id: '4',
        title: "Dean's List",
        description: 'Fall 2025 semester',
      ),
      const AchievementModel(
        id: '5',
        title: 'Player of the Week',
        description: 'Week of March 24',
      ),
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFF8F7F5),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 28),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProfileHeader(name: dummyUser.name),
              const SizedBox(height: 20),
              const Text(
                'Welcome Back, Jordan!',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                  height: 1.15,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "Here's your schedule and academic progress for this week.",
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xFF6B7280),
                  height: 1.45,
                ),
              ),
              const SizedBox(height: 22),
              const ScheduleCard(schedule: polishedSchedule),
              const SizedBox(height: 22),
              const AcademicProgressCard(
                courses: polishedCourses,
                progress: 0.72,
              ),
              const SizedBox(height: 22),
              CareerDevelopmentCard(
                title: topCareer,
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    CareersScreen.routeName,
                  );
                },
              ),
              const SizedBox(height: 22),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(26),
                  border: Border.all(color: const Color(0xFFE7E7E7)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Row(
                      children: [
                        Icon(
                          Icons.workspace_premium_outlined,
                          color: Color(0xFFF2C200),
                          size: 26,
                        ),
                        SizedBox(width: 10),
                        Text(
                          'Recent Achievements',
                          style: TextStyle(
                            fontSize: 21,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 18),
                    ...polishedAchievements.map(
                      (achievement) => Padding(
                        padding: const EdgeInsets.only(bottom: 14),
                        child: AchievementTile(
                          achievement: achievement,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 22),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(26),
                  border: Border.all(color: const Color(0xFFE7E7E7)),
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Need Help?',
                      style: TextStyle(
                        fontSize: 21,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: 18),
                    HelpOptionTile(
                      icon: Icons.mail_outline,
                      title: 'Academic Advisor',
                    ),
                    HelpOptionTile(
                      icon: Icons.work_outline,
                      title: 'Career Counselor',
                    ),
                    HelpOptionTile(
                      icon: Icons.emoji_events_outlined,
                      title: 'Strength Coach',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}