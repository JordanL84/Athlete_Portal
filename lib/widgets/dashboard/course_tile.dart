import 'package:flutter/material.dart';
import '../../models/course_model.dart';

class CourseTile extends StatelessWidget {
  final CourseModel course;

  const CourseTile({
    super.key,
    required this.course,
  });

  Color getGradeColor(String grade) {
    if (grade.startsWith('A')) return const Color(0xFF12A150);
    if (grade.startsWith('B')) return const Color(0xFF5B5CEB);
    if (grade.startsWith('C')) return Colors.orange;
    return Colors.red;
  }

  String getSubtitle(String name) {
    switch (name) {
      case 'KNES 285':
        return 'Introduction to Sport Management';
      case 'BMGT 230':
        return 'Business Statistics';
      case 'COMM 107':
        return 'Oral Communication';
      case 'ENGL 101':
        return 'Academic Writing';
      default:
        return 'Course';
    }
  }

  String getPercent(String grade) {
    switch (grade) {
      case 'A-':
        return '91%';
      case 'A':
        return '94%';
      case 'B+':
        return '87%';
      case 'B':
        return '85%';
      default:
        return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    final gradeColor = getGradeColor(course.grade);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Row(
                children: [
                  Flexible(
                    child: Text(
                      course.name,
                      style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18),
                      border: Border.all(color: const Color(0xFFD9D9D9)),
                    ),
                    child: const Text(
                      '3 credits',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  course.grade,
                  style: TextStyle(
                    color: gradeColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  getPercent(course.grade),
                  style: const TextStyle(
                    color: Color(0xFF6B7280),
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 6),
        Text(
          getSubtitle(course.name),
          style: const TextStyle(
            fontSize: 15,
            color: Color(0xFF4B5563),
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          'Instructor',
          style: TextStyle(
            fontSize: 13,
            color: Color(0xFF9CA3AF),
          ),
        ),
      ],
    );
  }
}