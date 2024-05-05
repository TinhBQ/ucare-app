// ignore_for_file: non_constant_identifier_names
import 'package:mobile_advanced_project_fe/core/entities/entities.dart';
import 'package:mobile_advanced_project_fe/core/items/patient_item.dart';
import 'package:mobile_advanced_project_fe/core/items/status_item.dart';

import 'schedule_item.dart';

class PatientScheduleItem extends PatientScheduleEntity {
  PatientScheduleItem({
    required super.patient_schedule_id,
    required super.schedule,
    required super.patient,
    required super.status,
  });

  factory PatientScheduleItem.fromJson(Map<String, dynamic> json) {
    return PatientScheduleItem(
      patient_schedule_id: json['patient_schedule_id'] ?? '',
      schedule: ScheduleItem.fromJson(json['schedule']),
      patient: PatientItem.fromJson(json['patient']),
      status: StatusItem.fromJson(json['status']),
    );
  }
}
