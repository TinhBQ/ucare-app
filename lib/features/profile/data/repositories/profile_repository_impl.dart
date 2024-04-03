import 'package:fpdart/fpdart.dart';
import 'package:mobile_advanced_project_fe/core/exceptions/exceptions.dart';
import 'package:mobile_advanced_project_fe/core/exceptions/failures.dart';
import 'package:mobile_advanced_project_fe/core/items/user_item.dart';
import 'package:mobile_advanced_project_fe/core/model/request_models/user_request_models/change_password_request_model.dart';
import 'package:mobile_advanced_project_fe/features/profile/domain/repository/profile_repository.dart';

import '../datasources/profile_remote_data_source.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  final ProfileRemoteDataSource remoteDataSource;

  ProfileRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, String>> changePassWord(
      ChangePasswordRequestModel body) async {
    try {
      final message = await remoteDataSource.changePassWord(body);
      return right(message);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, UserItem>> changeProfile(UserItem body) async {
    try {
      final userItem = await remoteDataSource.changeProfile(body);
      return right(userItem!);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }
}
