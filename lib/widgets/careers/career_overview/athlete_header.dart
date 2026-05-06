import 'package:flutter/material.dart';

import '../../../screens/auth/login_screen.dart';
import '../../../screens/dashboard/dashboard_screen.dart';
import '../../../state/app_session.dart';
import 'overview_styles.dart';

class AthleteHeader extends StatelessWidget {
  const AthleteHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: OverviewStyles.red,
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 14),
      child: Column(
        children: [
          Row(
            children: [
              const CircleAvatar(
                radius: 28,
                backgroundColor: Colors.white,
                child: Icon(Icons.person_outline, color: OverviewStyles.red),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppSession.displayName,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    Text(
                      '${AppSession.sport} • ${AppSession.directoryId}',
                      style: const TextStyle(color: Colors.white, fontSize: 14),
                    ),
                  ],
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.dark_mode_outlined, color: Colors.white),
              ),
            ],
          ),
          const SizedBox(height: 18),
          Row(
            children: [
              TextButton.icon(
                onPressed: () => Navigator.pushReplacementNamed(
                  context,
                  DashboardScreen.routeName,
                ),
                icon: const Icon(Icons.home_outlined),
                label: const Text('Home'),
                style: TextButton.styleFrom(foregroundColor: Colors.white),
              ),
              const SizedBox(width: 18),
              TextButton.icon(
                onPressed: () {
                  AppSession.reset();
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    LoginScreen.routeName,
                    (_) => false,
                  );
                },
                icon: const Icon(Icons.logout),
                label: const Text('Logout'),
                style: TextButton.styleFrom(foregroundColor: Colors.white),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
