import 'package:fpdart/fpdart.dart';
import 'package:mobile_advanced_project_fe/core/exceptions/exceptions.dart';
import 'package:mobile_advanced_project_fe/core/exceptions/failures.dart';
import 'package:mobile_advanced_project_fe/core/items/items.dart';
import 'package:mobile_advanced_project_fe/core/model/request_models/request_models.dart';

import '../../domain/repository/department_repository.dart';
import '../datasources/deparment_remote_data_source.dart';

class DepartmentRepositoryImpl implements DepartmentRepository {
  final DepartmentRemoteDataSource departmentRemoteDataSource;

  DepartmentRepositoryImpl(this.departmentRemoteDataSource);

  @override
  Future<Either<Failure, DepartmentGetItem>> getDepartments(
      BaseGetRequestModel params) async {
    try {
      final departmentGetItem =
          await departmentRemoteDataSource.getDepartments(params);
      return right(departmentGetItem!);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }
}
