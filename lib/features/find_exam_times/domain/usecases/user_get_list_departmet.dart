import 'package:fpdart/fpdart.dart';
import 'package:mobile_advanced_project_fe/core/exceptions/failures.dart';
import 'package:mobile_advanced_project_fe/core/items/items.dart';
import 'package:mobile_advanced_project_fe/core/model/request_models/request_models.dart';
import 'package:mobile_advanced_project_fe/core/usecase/usecase.dart';

import '../repository/find_exam_times_repository.dart';

class UserGetListDepartment
    implements UseCase<DepartmentGetItem, BaseGetRequestModel> {
  final FindExamTimesRepository findExamTimesRepository;
  UserGetListDepartment(this.findExamTimesRepository);

  @override
  Future<Either<Failure, DepartmentGetItem>> call(
      BaseGetRequestModel params) async {
    return await findExamTimesRepository.getDepartments(params);
  }
}
