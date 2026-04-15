import 'package:flutter/material.dart';
import '../../models/course_model.dart';
import 'course_tile.dart';

class AcademicProgressCard extends StatelessWidget {
  final List<CourseModel> courses;
  final double progress; // 0.0 - 1.0

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
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Academic Progress',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 12),

          const Text(
            'Semester Progress',
            style: TextStyle(
              fontWeight: FontWeight.w600,
            ),
          ),

          const SizedBox(height: 10),

          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: LinearProgressIndicator(
              value: progress,
              minHeight: 10,
            ),
          ),

          const SizedBox(height: 6),

          Text('${(progress * 100).toInt()}% complete'),

          const SizedBox(height: 16),
          const Divider(),

          const SizedBox(height: 8),

          ...courses.map(
            (course) => Padding(
              padding: const EdgeInsets.only(bottom: 6),
              child: CourseTile(course: course),
            ),
          ),
        ],
      ),
    );
  }
}