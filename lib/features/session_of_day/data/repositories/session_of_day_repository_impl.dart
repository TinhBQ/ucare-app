import 'package:fpdart/fpdart.dart';
import 'package:mobile_advanced_project_fe/core/exceptions/exceptions.dart';
import 'package:mobile_advanced_project_fe/core/exceptions/failures.dart';
import 'package:mobile_advanced_project_fe/core/items/item_dependencies.dart';
import 'package:mobile_advanced_project_fe/core/model/request_models/request_models.dart';

import '../../domain/repository/session_of_day_repository.dart';
import '../datasources/session_of_day_remote_data_source.dart';

class SessionOfDayRepositoryImpl implements SessionOfDayRepository {
  final SessionOfDayDataSourceRemoteDataSource
      sessionOfDayDataSourceRemoteDataSource;

  SessionOfDayRepositoryImpl(this.sessionOfDayDataSourceRemoteDataSource);

  @override
  Future<Either<Failure, SessionOfDayGetItem>> getListSessionOfDay(
      BaseGetRequestModel params) async {
    try {
      final sessionOfDayGetItem = await sessionOfDayDataSourceRemoteDataSource
          .getListSessionOfDay(params);
      return right(sessionOfDayGetItem!);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }
}
