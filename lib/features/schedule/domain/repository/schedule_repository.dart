// ignore_for_file: file_names

import 'package:fpdart/fpdart.dart';
import 'package:mobile_advanced_project_fe/core/exceptions/failures.dart';
import 'package:mobile_advanced_project_fe/core/items/items.dart';
import 'package:mobile_advanced_project_fe/core/model/request_models/request_models.dart';

abstract interface class ScheduleRepository {
  Future<Either<Failure, ScheduleGetItem>> getListSchedule(
      ScheduleGetRequestModel params);
}
