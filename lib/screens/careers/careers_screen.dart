import 'package:flutter/material.dart';
import '../../data/dummy/dummy_careers.dart';
import '../../state/app_session.dart';
import '../../widgets/careers/career_match_card.dart';
import '../dashboard/dashboard_screen.dart';
import 'career_overview_screen.dart';

class CareersScreen extends StatelessWidget {
  static const String routeName = '/careers';

  const CareersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final careers = AppSession.matchedCareers.isNotEmpty
        ? AppSession.matchedCareers
        : dummyCareers;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Career Paths'),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushReplacementNamed(
                        context,
                        DashboardScreen.routeName,
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
                          'Home',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Container(
                    height: 48,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: const Center(
                      child: Text(
                        'Careers',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            const Text(
              'Recommended Career Paths',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'Explore careers matched to your interests, strengths, and work preferences.',
            ),
            const SizedBox(height: 20),
            ...careers.map(
              (career) => Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: CareerMatchCard(
                  career: career,
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      CareerOverviewScreen.routeName,
                      arguments: career,
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}