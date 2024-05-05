import 'package:fpdart/fpdart.dart';
import 'package:mobile_advanced_project_fe/core/exceptions/failures.dart';
import 'package:mobile_advanced_project_fe/core/items/item_dependencies.dart';
import 'package:mobile_advanced_project_fe/core/usecase/usecase.dart';

import '../repository/auth_repository.dart';

class CurrentUser implements UseCase<UserItem, NoParams> {
  final AuthRepository authRepository;
  CurrentUser(this.authRepository);

  @override
  Future<Either<Failure, UserItem>> call(NoParams params) async {
    return await authRepository.currentUser();
  }
}
