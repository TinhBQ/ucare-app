import 'package:fpdart/fpdart.dart';
import 'package:mobile_advanced_project_fe/core/exceptions/failures.dart';
import 'package:mobile_advanced_project_fe/core/items/items.dart';
import 'package:mobile_advanced_project_fe/core/model/request_models/request_models.dart';

abstract interface class FindExamTimesRepository {
  Future<Either<Failure, DepartmentGetItem>> getDepartments(
      BaseGetRequestModel params);
}
