import 'package:flutter/material.dart';

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
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Judah K',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    Text(
                      'Soccer • jkamadin',
                      style: TextStyle(color: Colors.white, fontSize: 14),
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
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.home_outlined),
                label: const Text('Home'),
                style: TextButton.styleFrom(foregroundColor: Colors.white),
              ),
              const SizedBox(width: 18),
              TextButton.icon(
                onPressed: () {},
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
