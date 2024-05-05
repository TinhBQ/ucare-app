import 'package:fpdart/fpdart.dart';
import 'package:mobile_advanced_project_fe/core/exceptions/failures.dart';
import 'package:mobile_advanced_project_fe/core/items/item_dependencies.dart';
import 'package:mobile_advanced_project_fe/core/model/request_models/request_models.dart';
import 'package:mobile_advanced_project_fe/core/usecase/usecase.dart';

import '../repository/department_repository.dart';

class UserGetListDepartment
    implements UseCase<DepartmentGetItem, BaseGetRequestModel> {
  final DepartmentRepository departmentRepository;
  UserGetListDepartment(this.departmentRepository);

  @override
  Future<Either<Failure, DepartmentGetItem>> call(
      BaseGetRequestModel params) async {
    return await departmentRepository.getDepartments(params);
  }
}
