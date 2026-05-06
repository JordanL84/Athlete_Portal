import 'package:flutter/material.dart';
import '../../models/career_model.dart';

class CareerMatchCard extends StatelessWidget {
  final CareerModel career;
  final VoidCallback onTap;

  const CareerMatchCard({super.key, required this.career, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: const Color(0xFFFFC400), width: 1.5),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              career.title,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(career.description),
            const SizedBox(height: 16),

            // Match %
            Row(
              children: [
                Expanded(
                  child: LinearProgressIndicator(
                    value: career.matchPercent / 100,
                    backgroundColor: const Color(0xFFD7D7DC),
                    color: Colors.black,
                  ),
                ),
                const SizedBox(width: 10),
                Text('${career.matchPercent.toInt()}%'),
              ],
            ),

            const SizedBox(height: 12),

            Wrap(
              spacing: 8,
              children: career.tags
                  .map((tag) => Chip(label: Text(tag)))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
