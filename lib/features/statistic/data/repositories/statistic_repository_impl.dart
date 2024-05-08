import 'package:fpdart/fpdart.dart';

import 'package:mobile_advanced_project_fe/core/exceptions/exceptions.dart';
import 'package:mobile_advanced_project_fe/core/exceptions/failures.dart';
import 'package:mobile_advanced_project_fe/core/items/item_dependencies.dart';
import 'package:mobile_advanced_project_fe/core/model/request_models/request_models.dart';

import '../../domain/repository/statistic_repository.dart';
import '../datasources/statistic_remote_data_source.dart';

class StatisticRepositoryImpl implements StatisticRepository {
  final StatisticRemoteDataSource statisticRemoteDataSource;

  StatisticRepositoryImpl(this.statisticRemoteDataSource);

  @override
  Future<Either<Failure, List<MonthToMonthItem>>>
      getDepartmegetUserMonthToMonthnts(
          StatisticMonthToMonthRequestModel params) async {
    try {
      final monthToMonthItems = await statisticRemoteDataSource
          .getDepartmegetUserMonthToMonthnts(params);
      return right(monthToMonthItems!);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }
}
