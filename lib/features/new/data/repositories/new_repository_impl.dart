import 'package:fpdart/fpdart.dart';
import 'package:mobile_advanced_project_fe/core/exceptions/exceptions.dart';
import 'package:mobile_advanced_project_fe/core/exceptions/failures.dart';
import 'package:mobile_advanced_project_fe/core/items/item_dependencies.dart';
import 'package:mobile_advanced_project_fe/core/model/request_models/request_models.dart';

import '../../domain/repository/new_repository.dart';
import '../datasources/new_remote_data_source.dart';

class NewRepositoryImpl implements NewRepository {
  final NewRemoteDataSource patientRemoteDataSource;

  NewRepositoryImpl(this.patientRemoteDataSource);

  @override
  Future<Either<Failure, NewGetItem>> getListNew(
      BaseGetRequestModel params) async {
    try {
      final patientGetItem = await patientRemoteDataSource.getListNew(params);
      return right(patientGetItem!);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }
}
