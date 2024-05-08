import 'package:fpdart/fpdart.dart';
import 'package:mobile_advanced_project_fe/core/exceptions/failures.dart';
import 'package:mobile_advanced_project_fe/core/items/item_dependencies.dart';
import 'package:mobile_advanced_project_fe/core/model/request_models/request_models.dart';
import 'package:mobile_advanced_project_fe/core/usecase/usecase.dart';

import '../repository/statistic_repository.dart';

class UserGetStatisticMonthToMonth
    implements
        UseCase<List<MonthToMonthItem>, StatisticMonthToMonthRequestModel> {
  final StatisticRepository statisticRepository;

  UserGetStatisticMonthToMonth(this.statisticRepository);

  @override
  Future<Either<Failure, List<MonthToMonthItem>>> call(
      StatisticMonthToMonthRequestModel params) async {
    return await statisticRepository.getDepartmegetUserMonthToMonthnts(params);
  }
}
