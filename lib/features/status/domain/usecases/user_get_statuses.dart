import 'package:fpdart/fpdart.dart';
import 'package:mobile_advanced_project_fe/core/exceptions/failures.dart';
import 'package:mobile_advanced_project_fe/core/items/items.dart';
import 'package:mobile_advanced_project_fe/core/model/request_models/request_models.dart';
import 'package:mobile_advanced_project_fe/core/usecase/usecase.dart';

import '../repository/status_repository.dart';

class UserGetListStatus implements UseCase<StatusGetItem, BaseGetRequestModel> {
  final StatusRepository statusRepository;
  UserGetListStatus(this.statusRepository);

  @override
  Future<Either<Failure, StatusGetItem>> call(
      BaseGetRequestModel params) async {
    return await statusRepository.getListStatus(params);
  }
}
