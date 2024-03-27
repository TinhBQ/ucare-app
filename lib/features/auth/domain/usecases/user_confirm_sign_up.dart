import 'package:fpdart/fpdart.dart';
import 'package:mobile_advanced_project_fe/core/exceptions/failures.dart';
import 'package:mobile_advanced_project_fe/core/model/request_models/request_models.dart';
import 'package:mobile_advanced_project_fe/core/usecase/usecase.dart';

import '../repository/auth_repository.dart';

class UserConfirmSignUp
    implements UseCase<String, ConfirmRegisterRequestModel> {
  final AuthRepository authRepository;
  const UserConfirmSignUp(this.authRepository);

  @override
  Future<Either<Failure, String>> call(
      ConfirmRegisterRequestModel params) async {
    return await authRepository.confirmSignUp(params);
  }
}
