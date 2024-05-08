import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mobile_advanced_project_fe/core/exceptions/failures.dart';
import 'package:mobile_advanced_project_fe/core/items/item_dependencies.dart';
import 'package:mobile_advanced_project_fe/core/model/request_models/request_models.dart';

abstract interface class ProfileRepository {
  Future<Either<Failure, String>> changePassWord(
      ChangePasswordRequestModel body);
  Future<Either<Failure, UserItem>> changeProfile(UserItem body);

  Future<Either<Failure, FileItem>> uploadAvatar(FormData formData);
}
