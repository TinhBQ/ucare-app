import 'package:fpdart/fpdart.dart';
import 'package:mobile_advanced_project_fe/core/exceptions/failures.dart';
import 'package:mobile_advanced_project_fe/core/items/item_dependencies.dart';
import 'package:mobile_advanced_project_fe/core/usecase/usecase.dart';

import '../repository/profile_repository.dart';

class UserChangeProfile implements UseCase<UserItem, UserItem> {
  final ProfileRepository profileRepository;
  UserChangeProfile(this.profileRepository);

  @override
  Future<Either<Failure, UserItem>> call(UserItem body) async {
    return await profileRepository.changeProfile(body);
  }
}
