import 'package:fpdart/fpdart.dart';
import 'package:mobile_advanced_project_fe/core/exceptions/failures.dart';
import 'package:mobile_advanced_project_fe/core/items/item_dependencies.dart';
import 'package:mobile_advanced_project_fe/core/model/request_models/request_models.dart';
import 'package:mobile_advanced_project_fe/core/usecase/usecase.dart';

import '../repository/new_repository.dart';

class UserGetListNew implements UseCase<NewGetItem, BaseGetRequestModel> {
  final NewRepository patientRepository;
  UserGetListNew(this.patientRepository);

  @override
  Future<Either<Failure, NewGetItem>> call(BaseGetRequestModel params) async {
    return await patientRepository.getListNew(params);
  }
}
