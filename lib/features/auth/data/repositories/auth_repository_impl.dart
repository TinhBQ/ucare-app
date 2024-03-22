import 'package:fpdart/fpdart.dart';
import 'package:mobile_advanced_project_fe/core/exceptions/exceptions.dart';
import 'package:mobile_advanced_project_fe/core/exceptions/failures.dart';
import 'package:mobile_advanced_project_fe/core/model/request_models/request_models.dart';
import 'package:mobile_advanced_project_fe/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:mobile_advanced_project_fe/features/auth/domain/repository/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, String>> loginWithEmailPassword(
      UserLoginRequest body) async {
    try {
      final message = await remoteDataSource.loginWithEmailPassword(body);

      return right(message);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, String>> signUpWithEmailPassword(
      UserSignUpRequest body) async {
    try {
      final message = await remoteDataSource.signUpWithEmailPassword(body);
      return right(message);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, String>> confirmSignUp(
      ConfirmRegisterRequest params) async {
    try {
      final message = await remoteDataSource.confirmSignUp(params);
      return right(message);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, String>> createOTP(CreateOTPRequest body) async {
    try {
      final message = await remoteDataSource.createOTP(body);
      return right(message);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, String>> forgotPassword(
      ForgotPasswordRequest body) async {
    try {
      final message = await remoteDataSource.forgotPassword(body);
      return right(message);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }
}
