import 'package:fpdart/fpdart.dart';
import 'package:mobile_advanced_project_fe/core/exceptions/failures.dart';
import 'package:mobile_advanced_project_fe/core/model/request_models/request_models.dart';
import 'package:mobile_advanced_project_fe/core/usecase/usecase.dart';

import '../repository/auth_repository.dart';

class UserSignUp implements UseCase<String, UserSignUpRequest> {
  final AuthRepository authRepository;
  const UserSignUp(this.authRepository);

  @override
  Future<Either<Failure, String>> call(UserSignUpRequest body) async {
    return await authRepository.signUpWithEmailPassword(body);
  }
}
