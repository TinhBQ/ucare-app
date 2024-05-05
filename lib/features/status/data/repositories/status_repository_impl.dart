import 'package:fpdart/fpdart.dart';
import 'package:mobile_advanced_project_fe/core/exceptions/exceptions.dart';
import 'package:mobile_advanced_project_fe/core/exceptions/failures.dart';
import 'package:mobile_advanced_project_fe/core/items/item_dependencies.dart';
import 'package:mobile_advanced_project_fe/core/model/request_models/request_models.dart';

import '../../domain/repository/status_repository.dart';
import '../datasources/status_remote_data_source.dart';

class StatusRepositoryImpl implements StatusRepository {
  final StatusRemoteDataSource statusRemoteDataSource;

  StatusRepositoryImpl(this.statusRemoteDataSource);

  @override
  Future<Either<Failure, StatusGetItem>> getListStatus(
      BaseGetRequestModel params) async {
    try {
      final statusGetItem = await statusRemoteDataSource.getListStatus(params);
      return right(statusGetItem!);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }
}
