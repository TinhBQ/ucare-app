import 'package:fpdart/fpdart.dart';
import 'package:mobile_advanced_project_fe/core/exceptions/failures.dart';
import 'package:mobile_advanced_project_fe/core/model/request_models/request_models.dart';
import 'package:mobile_advanced_project_fe/core/usecase/usecase.dart';

import '../repository/auth_repository.dart';

class UserCreateOTP implements UseCase<String, CreateOTPRequestModel> {
  final AuthRepository authRepository;
  const UserCreateOTP(this.authRepository);

  @override
  Future<Either<Failure, String>> call(CreateOTPRequestModel body) async {
    return await authRepository.createOTP(body);
  }
}
