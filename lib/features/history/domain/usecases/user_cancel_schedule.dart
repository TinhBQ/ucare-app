import 'package:fpdart/fpdart.dart';
import 'package:mobile_advanced_project_fe/core/exceptions/failures.dart';
import 'package:mobile_advanced_project_fe/core/usecase/usecase.dart';

import '../../../../core/model/request_models/request_models.dart';
import '../repository/patient_schedule_repository.dart';

class UseCancelSchedule implements UseCase<String, ScheduleCancelRequestModel> {
  final PatientScheduleRepository patientScheduleRepository;
  UseCancelSchedule(this.patientScheduleRepository);

  @override
  Future<Either<Failure, String>> call(
      ScheduleCancelRequestModel params) async {
    return await patientScheduleRepository.onCancel(params);
  }
}
