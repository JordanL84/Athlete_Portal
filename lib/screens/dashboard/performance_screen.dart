import 'package:flutter/material.dart';

import '../../state/app_session.dart';
import '../../widgets/dashboard/profile_header.dart';

class PerformanceScreen extends StatelessWidget {
  static const String routeName = '/performance';

  const PerformanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                selectedTab: ProfileHeaderTab.performance,
              ),
              const SizedBox(height: 28),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(22),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(18),
                  border: Border.all(
                    color: const Color(0xFFFFC400),
                    width: 1.5,
                  ),
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Performance',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Performance tracking will live here.',
                      style: TextStyle(
                        color: Color(0xFF6B7280),
                        fontSize: 16,
                        height: 1.4,
                      ),
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
