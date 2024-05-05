import 'package:fpdart/fpdart.dart';
import 'package:mobile_advanced_project_fe/core/exceptions/failures.dart';
import 'package:mobile_advanced_project_fe/core/items/item_dependencies.dart';
import 'package:mobile_advanced_project_fe/core/model/request_models/request_models.dart';
import 'package:mobile_advanced_project_fe/core/usecase/usecase.dart';

import '../repository/session_of_day_repository.dart';

class UserGetListSessionOfDay
    implements UseCase<SessionOfDayGetItem, BaseGetRequestModel> {
  final SessionOfDayRepository sessionOfDayRepository;
  UserGetListSessionOfDay(this.sessionOfDayRepository);

  @override
  Future<Either<Failure, SessionOfDayGetItem>> call(
      BaseGetRequestModel params) async {
    return await sessionOfDayRepository.getListSessionOfDay(params);
  }
}
