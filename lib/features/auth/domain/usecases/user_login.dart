import 'package:fpdart/fpdart.dart';
import 'package:mobile_advanced_project_fe/core/exceptions/failures.dart';
import 'package:mobile_advanced_project_fe/core/model/request_models/request_models.dart';
import 'package:mobile_advanced_project_fe/core/usecase/usecase.dart';

import '../repository/auth_repository.dart';

class UserLogin implements UseCase<String, UserLoginRequestModel> {
  final AuthRepository authRepository;
  const UserLogin(this.authRepository);

  @override
  Future<Either<Failure, String>> call(UserLoginRequestModel body) async {
    return await authRepository.loginWithEmailPassword(body);
  }
}
