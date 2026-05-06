import 'package:flutter/material.dart';
import '../../data/dummy/dummy_courses.dart';
import '../../data/dummy/dummy_schedule.dart';
import '../../data/repositories/user_repository.dart';
import '../../state/app_session.dart';
import '../../widgets/dashboard/academic_progress_card.dart';
import '../../widgets/dashboard/career_development_card.dart';
import '../../widgets/dashboard/help_option_tile.dart';
import '../../widgets/dashboard/profile_header.dart';
import '../../widgets/dashboard/schedule_card.dart';
import '../careers/careers_screen.dart';

class DashboardScreen extends StatelessWidget {
  static const String routeName = '/dashboard';

  DashboardScreen({super.key});

  final UserRepository userRepository = UserRepository();

  @override
  Widget build(BuildContext context) {
    userRepository.getCurrentUser();

    final topCareer = AppSession.matchedCareers.isNotEmpty
        ? AppSession.matchedCareers.first.title
        : 'Business & Analytics';
    final firstName = AppSession.displayName.trim().split(' ').first;

    return Scaffold(
      backgroundColor: const Color(0xFFF8F7F5),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 28),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProfileHeader(
                name: AppSession.displayName,
                sport: AppSession.sport,
                directoryId: AppSession.directoryId,
              ),
              const SizedBox(height: 20),
              Text(
                'Welcome Back, $firstName!',
                style: const TextStyle(
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
              const ScheduleCard(schedule: dummySchedule),
              const SizedBox(height: 22),
              const AcademicProgressCard(courses: dummyCourses, progress: 0.72),
              const SizedBox(height: 22),
              CareerDevelopmentCard(
                title: topCareer,
                onPressed: () {
                  Navigator.pushNamed(context, CareersScreen.routeName);
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
