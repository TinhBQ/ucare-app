// ignore_for_file: file_names

import 'package:fpdart/fpdart.dart';
import 'package:mobile_advanced_project_fe/core/exceptions/failures.dart';
import 'package:mobile_advanced_project_fe/core/items/item_dependencies.dart';
import 'package:mobile_advanced_project_fe/core/model/request_models/schedule_request_models/schedule_request_model_dependencies.dart';

abstract interface class ScheduleRepository {
  Future<Either<Failure, ScheduleGetItem>> getListSchedule(
      ScheduleGetRequestModel params);
}
