import 'package:flutter/material.dart';
import '../../models/course_model.dart';
import 'course_tile.dart';

class AcademicProgressCard extends StatelessWidget {
  final List<CourseModel> courses;
  final double progress;

  const AcademicProgressCard({
    super.key,
    required this.courses,
    required this.progress,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(26),
        border: Border.all(color: const Color(0xFFFFC400), width: 1.5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Icon(
                Icons.menu_book_outlined,
                color: Color(0xFFE70E2F),
                size: 26,
              ),
              SizedBox(width: 10),
              Text(
                'Academic Progress',
                style: TextStyle(fontSize: 21, fontWeight: FontWeight.w700),
              ),
            ],
          ),
          const SizedBox(height: 10),
          const Text(
            'Current semester courses and grades',
            style: TextStyle(fontSize: 15, color: Color(0xFF6B7280)),
          ),
          const SizedBox(height: 18),
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: LinearProgressIndicator(
              value: progress,
              minHeight: 10,
              backgroundColor: const Color(0xFFD1D5DB),
              valueColor: const AlwaysStoppedAnimation(Color(0xFF030326)),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            '${(progress * 100).toInt()}% complete',
            style: const TextStyle(fontSize: 14, color: Color(0xFF6B7280)),
          ),
          const SizedBox(height: 14),
          ...courses.map(
            (course) => Padding(
              padding: const EdgeInsets.only(top: 12),
              child: CourseTile(course: course),
            ),
          ),
        ],
      ),
    );
  }
}
