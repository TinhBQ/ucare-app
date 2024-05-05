// ignore_for_file: non_constant_identifier_names

part of 'item_dependencies.dart';

class ScheduleItem extends ScheduleEntity {
  ScheduleItem({
    required super.schedule_id,
    required super.doctor,
    required super.room,
    required super.department,
    required super.session,
    required super.day,
  });

  factory ScheduleItem.fromJson(Map<String, dynamic> json) {
    return ScheduleItem(
      schedule_id: json['schedule_id'] ?? '',
      doctor: DoctorItem.fromJson(json['doctor']),
      room: RoomItem.fromJson(json['room']),
      department: DepartmentItem.fromJson(json['department']),
      session: SessionOfDayItem.fromJson(json['session']),
      day: json['day'] ?? '',
    );
  }
}
