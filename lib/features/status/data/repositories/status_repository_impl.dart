import 'package:fpdart/fpdart.dart';
import 'package:mobile_advanced_project_fe/core/exceptions/exceptions.dart';
import 'package:mobile_advanced_project_fe/core/exceptions/failures.dart';
import 'package:mobile_advanced_project_fe/core/items/items.dart';
import 'package:mobile_advanced_project_fe/core/model/request_models/request_models.dart';
import 'package:mobile_advanced_project_fe/features/status/data/datasources/status_remote_data_source.dart';

import '../../domain/repository/status_repository.dart';

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
