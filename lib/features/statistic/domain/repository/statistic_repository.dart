// ignore_for_file: file_names

import 'package:fpdart/fpdart.dart';
import 'package:mobile_advanced_project_fe/core/exceptions/failures.dart';
import 'package:mobile_advanced_project_fe/core/items/item_dependencies.dart';
import 'package:mobile_advanced_project_fe/core/model/request_models/request_models.dart';

abstract interface class StatisticRepository {
  Future<Either<Failure, List<MonthToMonthItem>>>
      getDepartmegetUserMonthToMonthnts(
          StatisticMonthToMonthRequestModel params);
}
