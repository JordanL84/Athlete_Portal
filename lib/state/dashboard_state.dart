import '../models/schedule_item_model.dart';
import '../models/course_model.dart';
import '../models/achievement_model.dart';

class DashboardState {
  List<ScheduleItemModel> schedule = [];
  List<CourseModel> courses = [];
  List<AchievementModel> achievements = [];

  void setSchedule(List<ScheduleItemModel> value) {
    schedule = value;
  }

  void setCourses(List<CourseModel> value) {
    courses = value;
  }

  void setAchievements(List<AchievementModel> value) {
    achievements = value;
  }

  // Optional helpers

  double get academicProgress {
    if (courses.isEmpty) return 0.0;

    // Simple mock: assume all courses equally weighted
    return 0.72; // matches your UI for now
  }

  List<ScheduleItemModel> get upcomingEvents {
    return schedule;
  }

  List<AchievementModel> get unlockedAchievements {
    return achievements.where((a) => a.isUnlocked).toList();
  }
}