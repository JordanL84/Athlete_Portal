import 'package:flutter/material.dart';

import '../../data/dummy/dummy_careers.dart';
import '../../state/app_session.dart';
import '../../widgets/careers/career_match_card.dart';
import '../../widgets/careers/career_overview/athlete_header.dart';
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
      backgroundColor: Colors.white,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            const AthleteHeader(),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(18, 22, 18, 28),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Your Career Matches',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      "Based on your survey responses, here are career paths that align with your interests and strengths. Select a field to explore the skills and courses you'll need.",
                      style: TextStyle(color: Color(0xFF596174), height: 1.45),
                    ),
                    const SizedBox(height: 26),
                    const Row(
                      children: [
                        Icon(
                          Icons.emoji_events_outlined,
                          color: Color(0xFFFFC400),
                          size: 20,
                        ),
                        SizedBox(width: 8),
                        Text(
                          'Top Recommendations',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
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
            ),
          ],
        ),
      ),
    );
  }
}
