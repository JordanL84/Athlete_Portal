import 'package:flutter/material.dart';

import '../../screens/dashboard/dashboard_screen.dart';
import '../../screens/dashboard/performance_screen.dart';

enum ProfileHeaderTab { career, performance }

class ProfileHeader extends StatelessWidget {
  final String name;
  final String sport;
  final String directoryId;
  final ProfileHeaderTab selectedTab;

  const ProfileHeader({
    super.key,
    required this.name,
    required this.sport,
    required this.directoryId,
    this.selectedTab = ProfileHeaderTab.career,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFFE70E2F), Color(0xFFD90429)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(28),
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 18),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 58,
                  height: 58,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.person_outline,
                    size: 30,
                    color: Color(0xFFE70E2F),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 2),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          name,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 26,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          '$sport • $directoryId',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 18),
                        Row(
                          children: const [
                            _HeaderNavItem(
                              icon: Icons.home_outlined,
                              label: 'Home',
                            ),
                            SizedBox(width: 28),
                            _HeaderNavItem(icon: Icons.logout, label: 'Out'),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              _HeaderTabButton(
                label: 'Career',
                isSelected: selectedTab == ProfileHeaderTab.career,
                onTap: () {
                  if (selectedTab != ProfileHeaderTab.career) {
                    Navigator.pushReplacementNamed(
                      context,
                      DashboardScreen.routeName,
                    );
                  }
                },
              ),
              _HeaderTabButton(
                label: 'Performance',
                isSelected: selectedTab == ProfileHeaderTab.performance,
                onTap: () {
                  if (selectedTab != ProfileHeaderTab.performance) {
                    Navigator.pushReplacementNamed(
                      context,
                      PerformanceScreen.routeName,
                    );
                  }
                },
              ),
              const Spacer(),
            ],
          ),
        ],
      ),
    );
  }
}

class _HeaderTabButton extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const _HeaderTabButton({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(left: 20),
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFFF4261) : Colors.transparent,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(7)),
          boxShadow: isSelected
              ? const [
                  BoxShadow(
                    color: Color(0x33000000),
                    blurRadius: 10,
                    offset: Offset(0, 4),
                  ),
                ]
              : null,
        ),
        child: Text(
          label,
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: isSelected ? FontWeight.w800 : FontWeight.w500,
          ),
        ),
      ),
    );
  }
}

class _HeaderNavItem extends StatelessWidget {
  final IconData icon;
  final String label;

  const _HeaderNavItem({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: Colors.white, size: 26),
        const SizedBox(width: 8),
        Text(
          label,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
