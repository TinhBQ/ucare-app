import 'package:fpdart/fpdart.dart';
import 'package:mobile_advanced_project_fe/core/exceptions/failures.dart';
import 'package:mobile_advanced_project_fe/core/items/item_dependencies.dart';
import 'package:mobile_advanced_project_fe/core/model/request_models/request_models.dart';
import 'package:mobile_advanced_project_fe/core/usecase/usecase.dart';

import '../repository/patient_repository.dart';

class UserGetListPatient
    implements UseCase<PatientGetItem, BaseGetRequestModel> {
  final PatientRepository patientRepository;
  UserGetListPatient(this.patientRepository);

  @override
  Future<Either<Failure, PatientGetItem>> call(
      BaseGetRequestModel params) async {
    return await patientRepository.getListPatient(params);
  }
}
