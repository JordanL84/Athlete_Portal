import 'package:flutter/material.dart';
import '../../models/course_model.dart';

class CourseTile extends StatelessWidget {
  final CourseModel course;

  const CourseTile({
    super.key,
    required this.course,
  });

  Color getGradeColor(String grade) {
    if (grade.startsWith('A')) return Colors.green;
    if (grade.startsWith('B')) return Colors.blue;
    if (grade.startsWith('C')) return Colors.orange;
    return Colors.red;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            course.name,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Text(
          course.grade,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: getGradeColor(course.grade),
          ),
        ),
      ],
    );
  }
}