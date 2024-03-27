import 'package:fpdart/fpdart.dart';
import 'package:mobile_advanced_project_fe/core/exceptions/failures.dart';
import 'package:mobile_advanced_project_fe/core/model/request_models/request_models.dart';
import 'package:mobile_advanced_project_fe/core/usecase/usecase.dart';

import '../repository/profile_repository.dart';

class UserChangePassword
    implements UseCase<String, ChangePasswordRequestModel> {
  final ProfileRepository profileRepository;
  UserChangePassword(this.profileRepository);

  @override
  Future<Either<Failure, String>> call(ChangePasswordRequestModel body) async {
    return await profileRepository.changePassWord(body);
  }
}
