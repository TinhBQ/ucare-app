import 'package:fpdart/fpdart.dart';
import 'package:mobile_advanced_project_fe/core/exceptions/failures.dart';
import 'package:mobile_advanced_project_fe/core/usecase/usecase.dart';
import 'package:mobile_advanced_project_fe/features/auth/domain/repository/auth_repository.dart';

class UserLogout implements UseCase<String, NoParams> {
  final AuthRepository authRepository;
  const UserLogout(this.authRepository);

  @override
  Future<Either<Failure, String>> call(NoParams params) async {
    return await authRepository.logout();
  }
}
