import 'package:fpdart/fpdart.dart';
import 'package:mobile_advanced_project_fe/core/exceptions/failures.dart';
import 'package:mobile_advanced_project_fe/core/items/items.dart';
import 'package:mobile_advanced_project_fe/core/model/request_models/request_models.dart';
import 'package:mobile_advanced_project_fe/core/usecase/usecase.dart';

import '../repository/patient_schedule_repository.dart';

class UserGetListPatientSchedule
    implements UseCase<PatientScheduleGetItem, BaseGetRequestModel> {
  final PatientScheduleRepository patientScheduleRepository;
  UserGetListPatientSchedule(this.patientScheduleRepository);

  @override
  Future<Either<Failure, PatientScheduleGetItem>> call(
      BaseGetRequestModel params) async {
    return await patientScheduleRepository.getListPatientSchedule(params);
  }
}
