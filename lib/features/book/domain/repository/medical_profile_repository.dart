import 'package:fpdart/fpdart.dart';
import 'package:mobile_advanced_project_fe/core/exceptions/failures.dart';
import 'package:mobile_advanced_project_fe/core/model/request_models/request_models.dart';

abstract interface class MedicalProfileRepository {
  Future<Either<Failure, String>> createPatient(CreatePatientRequestModel body);
}