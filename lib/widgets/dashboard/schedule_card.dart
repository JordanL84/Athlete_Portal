import 'package:flutter/material.dart';
import '../../models/schedule_item_model.dart';
import 'schedule_item_card.dart';

class ScheduleCard extends StatelessWidget {
  final List<ScheduleItemModel> schedule;

  const ScheduleCard({
    super.key,
    required this.schedule,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
            'This Week',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 12),

          ...schedule.map(
            (item) => Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: ScheduleItemCard(item: item),
            ),
          ),
        ],
      ),
    );
  }
}