// ignore_for_file: non_constant_identifier_names

part of 'patient_request_model_dependencies.dart';

class PatientBookScheduleRequestModel {
  final String schedule_id;
  final String patient_id;

  PatientBookScheduleRequestModel({
    required this.schedule_id,
    required this.patient_id,
  });

  Map<String, dynamic> toJson() => {
        "schedule_id": schedule_id,
        "patient_id": patient_id,
      };
}
