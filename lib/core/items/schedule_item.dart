// ignore_for_file: non_constant_identifier_names

import 'package:mobile_advanced_project_fe/core/entities/entities.dart';
import 'package:mobile_advanced_project_fe/core/items/deparment_item.dart';
import 'package:mobile_advanced_project_fe/core/items/doctor_item.dart';
import 'package:mobile_advanced_project_fe/core/items/items.dart';

import 'room_item.dart';

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
    print('bQT json 3 ${json}');

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
