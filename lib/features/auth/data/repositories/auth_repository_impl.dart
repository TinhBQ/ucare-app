import 'package:fpdart/fpdart.dart';
import 'package:mobile_advanced_project_fe/core/exceptions/exceptions.dart';
import 'package:mobile_advanced_project_fe/core/exceptions/failures.dart';
import 'package:mobile_advanced_project_fe/core/items/item_dependencies.dart';
import 'package:mobile_advanced_project_fe/core/model/request_models/request_models.dart';

import '../../domain/repository/auth_repository.dart';
import '../datasources/auth_remote_data_source.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, String>> loginWithEmailPassword(
      UserLoginRequestModel body) async {
    try {
      final message = await remoteDataSource.loginWithEmailPassword(body);

      return right(message);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, String>> signUpWithEmailPassword(
      UserSignUpRequestModel body) async {
    try {
      final message = await remoteDataSource.signUpWithEmailPassword(body);
      return right(message);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, String>> confirmSignUp(
      ConfirmRegisterRequestModel params) async {
    try {
      final message = await remoteDataSource.confirmSignUp(params);
      return right(message);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, String>> createOTP(CreateOTPRequestModel body) async {
    try {
      final message = await remoteDataSource.createOTP(body);
      return right(message);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, String>> forgotPassword(
      ForgotPasswordRequestModel body) async {
    try {
      final message = await remoteDataSource.forgotPassword(body);
      return right(message);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, UserItem>> currentUser() async {
    try {
      final UserItem? userItem = await remoteDataSource.getCurrentUserData();
      return right(userItem!);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, String>> logout() async {
    try {
      final message = await remoteDataSource.logout();
      return right(message);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }
}
