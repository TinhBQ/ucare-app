import 'package:fpdart/fpdart.dart';

import 'package:mobile_advanced_project_fe/core/exceptions/exceptions.dart';
import 'package:mobile_advanced_project_fe/core/exceptions/failures.dart';
import 'package:mobile_advanced_project_fe/core/items/item_dependencies.dart';
import 'package:mobile_advanced_project_fe/core/model/request_models/request_models.dart';

import '../../domain/repository/schedule_repository.dart';
import '../datasources/schedule_remote_data_source.dart';

class ScheduleRepositoryImpl implements ScheduleRepository {
  final ScheduleRemoteDataSource scheduleRemoteDataSource;

  ScheduleRepositoryImpl(this.scheduleRemoteDataSource);

  @override
  Future<Either<Failure, ScheduleGetItem>> getListSchedule(
      ScheduleGetRequestModel params) async {
    try {
      final scheduleGetItem =
          await scheduleRemoteDataSource.getListSchedule(params);
      return right(scheduleGetItem!);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }
}
