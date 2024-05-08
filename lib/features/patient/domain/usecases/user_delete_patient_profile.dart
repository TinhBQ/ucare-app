import 'package:fpdart/fpdart.dart';
import 'package:mobile_advanced_project_fe/core/exceptions/failures.dart';
import 'package:mobile_advanced_project_fe/core/model/request_models/request_models.dart';
import 'package:mobile_advanced_project_fe/core/usecase/usecase.dart';
import 'package:mobile_advanced_project_fe/features/patient/domain/repository/patient_repository.dart';

class UserDeletePatientProfile
    implements UseCase<String, DeletePatientProfileRequestModel> {
  final PatientRepository patientRepository;
  UserDeletePatientProfile(this.patientRepository);
  @override
  Future<Either<Failure, String>> call(
      DeletePatientProfileRequestModel params) async {
    return await patientRepository.deletePatient(params);
  }
}
