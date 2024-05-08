import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mobile_advanced_project_fe/core/exceptions/failures.dart';
import 'package:mobile_advanced_project_fe/core/items/item_dependencies.dart';
import 'package:mobile_advanced_project_fe/core/usecase/usecase.dart';

import '../repository/profile_repository.dart';

class UserUploadFile implements UseCase<FileItem, FormData> {
  final ProfileRepository profileRepository;
  UserUploadFile(this.profileRepository);

  @override
  Future<Either<Failure, FileItem>> call(FormData formData) async {
    return await profileRepository.uploadAvatar(formData);
  }
}
