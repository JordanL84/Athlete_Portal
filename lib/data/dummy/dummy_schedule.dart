import '../../models/schedule_item_model.dart';

const List<ScheduleItemModel> dummySchedule = [
  ScheduleItemModel(
    id: '1',
    title: 'Team Practice',
    day: 'Monday',
    time: '6:00 AM - 8:00 AM',
    type: 'athletic',
  ),
  ScheduleItemModel(
    id: '2',
    title: 'KNES 285: Intro to Sport Management',
    day: 'Monday',
    time: '10:00 AM - 11:15 AM',
    type: 'academic',
  ),
  ScheduleItemModel(
    id: '3',
    title: 'BMGT 230: Business Statistics',
    day: 'Monday',
    time: '2:00 PM - 3:15 PM',
    type: 'academic',
  ),
  ScheduleItemModel(
    id: '4',
    title: 'Mandatory Study Hall',
    day: 'Monday',
    time: '7:00 PM - 9:00 PM',
    type: 'study',
  ),
];