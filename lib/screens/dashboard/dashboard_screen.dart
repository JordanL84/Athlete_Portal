import 'package:flutter/material.dart';
import '../../data/dummy/dummy_achievements.dart';
import '../../data/dummy/dummy_courses.dart';
import '../../data/dummy/dummy_schedule.dart';
import '../../data/dummy/dummy_user.dart';
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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Athlete Portal'),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProfileHeader(name: dummyUser.name),

            const SizedBox(height: 20),

            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 48,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: const Center(
                      child: Text(
                        'Home',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        CareersScreen.routeName,
                      );
                    },
                    child: Container(
                      height: 48,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(24),
                        border: Border.all(color: Colors.black12),
                      ),
                      child: const Center(
                        child: Text(
                          'Careers',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 24),

            ScheduleCard(schedule: dummySchedule),

            const SizedBox(height: 24),

            AcademicProgressCard(
              courses: dummyCourses,
              progress: 0.72,
            ),

            const SizedBox(height: 24),

            CareerDevelopmentCard(
              title: 'Business & Analytics',
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  CareersScreen.routeName,
                );
              },
            ),

            const SizedBox(height: 24),

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Achievements',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  ...dummyAchievements.map(
                    (achievement) => Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: AchievementTile(
                        achievement: achievement,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Need Help?',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 12),
                  HelpOptionTile(
                    icon: Icons.person_outline,
                    title: 'Talk to an Advisor',
                  ),
                  HelpOptionTile(
                    icon: Icons.help_outline,
                    title: 'Get Support',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}