import 'package:fpdart/fpdart.dart';
import 'package:mobile_advanced_project_fe/core/exceptions/failures.dart';
import 'package:mobile_advanced_project_fe/core/model/request_models/request_models.dart';
import 'package:mobile_advanced_project_fe/core/usecase/usecase.dart';

import '../repository/patient_repository.dart';

class UserPatientBookSchedule
    implements UseCase<String, PatientBookScheduleRequestModel> {
  final PatientRepository patientRepository;
  UserPatientBookSchedule(this.patientRepository);

  @override
  Future<Either<Failure, String>> call(
      PatientBookScheduleRequestModel body) async {
    return await patientRepository.patientBookSchedule(body);
  }
}
