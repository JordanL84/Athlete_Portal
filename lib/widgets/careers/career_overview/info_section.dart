import 'package:flutter/material.dart';

import 'overview_styles.dart';

class CareerContact {
  final String name;
  final String role;
  final String email;
  final String hours;

  const CareerContact({
    required this.name,
    required this.role,
    required this.email,
    required this.hours,
  });
}

class InfoSection extends StatelessWidget {
  final List<CareerContact> contacts;

  const InfoSection({super.key, required this.contacts});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: OverviewStyles.card(const Color(0xFFFFC9D2)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Icon(Icons.mail_outline, color: OverviewStyles.red),
              SizedBox(width: 8),
              Text(
                'Get More Information',
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.w900),
              ),
            ],
          ),
          const SizedBox(height: 8),
          const Text(
            'Connect with advisors and sports management professionals',
            style: TextStyle(
              color: OverviewStyles.muted,
              fontSize: 12,
              height: 1.35,
            ),
          ),
          const SizedBox(height: 16),
          for (final contact in contacts)
            Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: _ContactTile(contact: contact),
            ),
        ],
      ),
    );
  }
}

class _ContactTile extends StatelessWidget {
  final CareerContact contact;

  const _ContactTile({required this.contact});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: OverviewStyles.card(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            contact.name,
            style: const TextStyle(
              color: OverviewStyles.text,
              fontWeight: FontWeight.w900,
              fontSize: 12,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            contact.role,
            style: const TextStyle(color: OverviewStyles.muted, fontSize: 11),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              const Icon(
                Icons.mail_outline,
                size: 13,
                color: OverviewStyles.red,
              ),
              const SizedBox(width: 5),
              Text(
                contact.email,
                style: const TextStyle(color: OverviewStyles.red, fontSize: 11),
              ),
            ],
          ),
          const SizedBox(height: 5),
          Text(
            contact.hours,
            style: const TextStyle(color: OverviewStyles.muted, fontSize: 10),
          ),
        ],
      ),
    );
  }
}
