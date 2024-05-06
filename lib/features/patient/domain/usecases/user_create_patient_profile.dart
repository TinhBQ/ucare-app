import 'package:fpdart/fpdart.dart';
import 'package:mobile_advanced_project_fe/core/exceptions/failures.dart';
import 'package:mobile_advanced_project_fe/core/model/request_models/request_models.dart';
import 'package:mobile_advanced_project_fe/core/usecase/usecase.dart';

import '../repository/patient_repository.dart';

class UserCreatePatientProfile
    implements UseCase<String, CreatePatientRequestModel> {
  final PatientRepository patientRepository;
  UserCreatePatientProfile(this.patientRepository);

  @override
  Future<Either<Failure, String>> call(CreatePatientRequestModel body) async {
    return await patientRepository.createPatient(body);
  }
}
