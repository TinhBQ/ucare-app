import 'package:fpdart/fpdart.dart';
import 'package:mobile_advanced_project_fe/core/exceptions/failures.dart';
import 'package:mobile_advanced_project_fe/core/items/items.dart';
import 'package:mobile_advanced_project_fe/core/model/request_models/request_models.dart';
import 'package:mobile_advanced_project_fe/core/usecase/usecase.dart';

import '../repository/doctor_repository.dart';

class UserFindExamTimes
    implements UseCase<DoctorGetItem, DoctorGetRequestModel> {
  final DoctorRepository doctorRepository;
  UserFindExamTimes(this.doctorRepository);

  @override
  Future<Either<Failure, DoctorGetItem>> call(
      DoctorGetRequestModel params) async {
    return await doctorRepository.getListDoctors(params);
  }
}
