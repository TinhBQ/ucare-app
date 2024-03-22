import 'package:mobile_advanced_project_fe/core/api/auth_api.dart';
import 'package:mobile_advanced_project_fe/core/exceptions/exceptions.dart';
import 'package:mobile_advanced_project_fe/core/model/request_models/request_models.dart';
import 'package:mobile_advanced_project_fe/core/model/response_models/base_response_model.dart';
import 'package:mobile_advanced_project_fe/core/model/response_models/login_response_model.dart';
import 'package:mobile_advanced_project_fe/core/utils/infor_massage.dart';

import 'package:mobile_advanced_project_fe/core/values/constant.dart';
import 'package:mobile_advanced_project_fe/global.dart';

import '../../../../core/enum/enum.dart';

abstract interface class AuthRemoteDataSource {
  Future<String> signUpWithEmailPassword(UserSignUpRequest body);
  Future<String> loginWithEmailPassword(UserLoginRequest body);
  Future<String> confirmSignUp(ConfirmRegisterRequest params);
  Future<String> createOTP(CreateOTPRequest body);
  Future<String> forgotPassword(ForgotPasswordRequest body);
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  AuthRemoteDataSourceImpl();

  @override
  Future<String> loginWithEmailPassword(UserLoginRequest body) async {
    LoginResponeModel response = await AuthApi.login(body);

    if (response.responseData != null &&
        response.status == StatusResponse.success.name) {
      Global.storageService.setString(
          AppConstants.STORAGE_USER_ACCESS_TOKEN_KEY,
          response.responseData!.accessToken);

      Global.storageService.setString(
          AppConstants.STORAGE_USER_REFRESH_TOKEN_KEY,
          response.responseData!.refreshToken);

      return InforMassage.LOGIN_SUCCESS;
    } else {
      throw ServerException(ServerException.LOGIN_FAILURE);
    }
  }

  @override
  Future<String> signUpWithEmailPassword(UserSignUpRequest params) async {
    BaseReponseModel response = await AuthApi.signup(params);

    return response.status == StatusResponse.success.name
        ? InforMassage.SIGN_UP_SUCCESS
        : throw ServerException(ServerException.SIGN_UP_FAILURE);
  }

  @override
  Future<String> confirmSignUp(ConfirmRegisterRequest params) async {
    BaseReponseModel response = await AuthApi.confirmSignUp(params);

    return response.status == StatusResponse.success.name
        ? InforMassage.CONFIRM_SIGN_UP_SUCCESS
        : throw ServerException(ServerException.CONFIRM_SIGN_UP_FAILUARE);
  }

  @override
  Future<String> createOTP(CreateOTPRequest body) async {
    BaseReponseModel response = await AuthApi.createOTP(body);

    return response.status == StatusResponse.success.name
        ? InforMassage.CREATE_OTP_SUCCESS
        : throw ServerException(ServerException.CONFIRM_SIGN_UP_FAILUARE);
  }

  @override
  Future<String> forgotPassword(ForgotPasswordRequest body) async {
    BaseReponseModel response = await AuthApi.forgotPassword(body);

    return response.status == StatusResponse.success.name
        ? InforMassage.FORGOT_PASSWORD_SUCCESS
        : throw ServerException(ServerException.FORGOT_PASSWORD_FAILUARE);
  }
}
