// ignore_for_file: non_constant_identifier_names
import 'package:mobile_advanced_project_fe/core/entities/entities.dart';

class PatientScheduleItem extends PatientScheduleEntity {
  PatientScheduleItem({
    required super.patient_schedule_id,
    required super.patient,
    required super.schedule,
    required super.status,
    required super.enable,
  });

  factory PatientScheduleItem.fromJson(Map<String, dynamic> json) {
    return PatientScheduleItem(
      patient_schedule_id: json['patient_schedule_id'] ?? '',
      patient: json['patient'] ?? '',
      schedule: json['schedule'] ?? '',
      status: json['status'] ?? '',
      enable: json['enable'] ?? false,
    );
  }
}
