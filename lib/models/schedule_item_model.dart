class ScheduleItemModel {
  final String id;
  final String title;
  final String day;
  final String time;
  final String type; // e.g., practice, study, meeting

  const ScheduleItemModel({
    required this.id,
    required this.title,
    required this.day,
    required this.time,
    required this.type,
  });
}