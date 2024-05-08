// ignore_for_file: non_constant_identifier_names

part of 'patient_request_model_dependencies.dart';

class DeletePatientProfileRequestModel {
  final String patient_id;
  DeletePatientProfileRequestModel({
    required this.patient_id,
  });
  Map<String, dynamic> toJson() => {
        "id": patient_id,
      };
}
