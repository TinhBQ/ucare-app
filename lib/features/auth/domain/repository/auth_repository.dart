import 'package:fpdart/fpdart.dart';
import 'package:mobile_advanced_project_fe/core/exceptions/failures.dart';
import 'package:mobile_advanced_project_fe/core/model/request_models/request_models.dart';

abstract interface class AuthRepository {
  Future<Either<Failure, String>> signUpWithEmailPassword(
      UserSignUpRequest body);
  Future<Either<Failure, String>> loginWithEmailPassword(UserLoginRequest body);
  Future<Either<Failure, String>> confirmSignUp(ConfirmRegisterRequest params);
  Future<Either<Failure, String>> createOTP(CreateOTPRequest body);
  Future<Either<Failure, String>> forgotPassword(ForgotPasswordRequest body);
}
