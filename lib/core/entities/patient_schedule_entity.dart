// ignore_for_file: non_constant_identifier_names

import 'package:mobile_advanced_project_fe/core/entities/entities.dart';

class PatientScheduleEntity {
  final String patient_schedule_id;
  final ScheduleEntity schedule;
  final PatientEntity patient;
  final StatusEntity status;

  PatientScheduleEntity({
    required this.patient_schedule_id,
    required this.schedule,
    required this.patient,
    required this.status,
  });
}
