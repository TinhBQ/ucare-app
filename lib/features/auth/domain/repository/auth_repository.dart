import 'package:fpdart/fpdart.dart';
import 'package:mobile_advanced_project_fe/core/exceptions/failures.dart';
import 'package:mobile_advanced_project_fe/core/items/item_dependencies.dart';
import 'package:mobile_advanced_project_fe/core/model/request_models/request_models.dart';

abstract interface class AuthRepository {
  Future<Either<Failure, String>> signUpWithEmailPassword(
      UserSignUpRequestModel body);
  Future<Either<Failure, String>> loginWithEmailPassword(
      UserLoginRequestModel body);
  Future<Either<Failure, String>> confirmSignUp(
      ConfirmRegisterRequestModel params);
  Future<Either<Failure, String>> createOTP(CreateOTPRequestModel body);
  Future<Either<Failure, String>> forgotPassword(
      ForgotPasswordRequestModel body);
  Future<Either<Failure, String>> logout();

  Future<Either<Failure, UserItem>> currentUser();
}
