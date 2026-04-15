import '../../models/schedule_item_model.dart';

final List<ScheduleItemModel> dummySchedule = [
  const ScheduleItemModel(
    id: '1',
    title: 'Study Hall',
    day: 'Monday',
    time: '3:00 PM',
    type: 'academic',
  ),
  const ScheduleItemModel(
    id: '2',
    title: 'Team Practice',
    day: 'Tuesday',
    time: '5:00 PM',
    type: 'athletic',
  ),
  const ScheduleItemModel(
    id: '3',
    title: 'Academic Check-In',
    day: 'Thursday',
    time: '1:00 PM',
    type: 'academic',
  ),
];