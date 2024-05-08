import 'package:fpdart/fpdart.dart';
import 'package:mobile_advanced_project_fe/core/exceptions/failures.dart';
import 'package:mobile_advanced_project_fe/core/items/item_dependencies.dart';
import 'package:mobile_advanced_project_fe/core/model/request_models/request_models.dart';

abstract interface class PatientRepository {
  Future<Either<Failure, PatientGetItem>> getListPatient(
      BaseGetRequestModel params);
  Future<Either<Failure, String>> createPatient(CreatePatientRequestModel body);

  Future<Either<Failure, String>> patientBookSchedule(
      PatientBookScheduleRequestModel body);
  Future<Either<Failure, String>> deletePatient(
      DeletePatientProfileRequestModel params);
}
