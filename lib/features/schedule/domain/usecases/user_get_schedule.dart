import 'package:fpdart/fpdart.dart';
import 'package:mobile_advanced_project_fe/core/exceptions/failures.dart';
import 'package:mobile_advanced_project_fe/core/items/item_dependencies.dart';
import 'package:mobile_advanced_project_fe/core/model/request_models/request_models.dart';
import 'package:mobile_advanced_project_fe/core/usecase/usecase.dart';

import '../repository/schedule_repository.dart';

class UserGetSchedule
    implements UseCase<ScheduleGetItem, ScheduleGetRequestModel> {
  final ScheduleRepository scheduleRepository;

  UserGetSchedule(this.scheduleRepository);

  @override
  Future<Either<Failure, ScheduleGetItem>> call(
      ScheduleGetRequestModel params) async {
    return await scheduleRepository.getListSchedule(params);
  }
}
