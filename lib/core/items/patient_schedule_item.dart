part of 'item_dependencies.dart';

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
