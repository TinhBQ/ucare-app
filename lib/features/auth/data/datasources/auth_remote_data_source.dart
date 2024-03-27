import 'package:mobile_advanced_project_fe/core/api/api.dart';
import 'package:mobile_advanced_project_fe/core/exceptions/exceptions.dart';
import 'package:mobile_advanced_project_fe/core/items/items.dart';
import 'package:mobile_advanced_project_fe/core/model/request_models/request_models.dart';
import 'package:mobile_advanced_project_fe/core/utils/infor_massage.dart';

import 'package:mobile_advanced_project_fe/core/values/constant.dart';
import 'package:mobile_advanced_project_fe/global.dart';

import '../../../../core/enum/enum.dart';
import '../../../../core/model/response_models/response_models.dart';

abstract interface class AuthRemoteDataSource {
  Future<String> signUpWithEmailPassword(UserSignUpRequestModel body);
  Future<String> loginWithEmailPassword(UserLoginRequestModel body);
  Future<String> confirmSignUp(ConfirmRegisterRequestModel params);
  Future<String> createOTP(CreateOTPRequestModel body);
  Future<String> forgotPassword(ForgotPasswordRequestModel body);
  Future<String> logout();

  Future<UserItem?> getCurrentUserData();
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  AuthRemoteDataSourceImpl();

  @override
  Future<String> loginWithEmailPassword(UserLoginRequestModel body) async {
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
  Future<String> signUpWithEmailPassword(UserSignUpRequestModel params) async {
    BaseReponseModel response = await AuthApi.signup(params);

    return response.status == StatusResponse.success.name
        ? InforMassage.SIGN_UP_SUCCESS
        : throw ServerException(ServerException.SIGN_UP_FAILURE);
  }

  @override
  Future<String> confirmSignUp(ConfirmRegisterRequestModel params) async {
    BaseReponseModel response = await AuthApi.confirmSignUp(params);

    return response.status == StatusResponse.success.name
        ? InforMassage.CONFIRM_SIGN_UP_SUCCESS
        : throw ServerException(ServerException.CONFIRM_SIGN_UP_FAILUARE);
  }

  @override
  Future<String> createOTP(CreateOTPRequestModel body) async {
    BaseReponseModel response = await AuthApi.createOTP(body);

    return response.status == StatusResponse.success.name
        ? InforMassage.CREATE_OTP_SUCCESS
        : throw ServerException(ServerException.CONFIRM_SIGN_UP_FAILUARE);
  }

  @override
  Future<String> forgotPassword(ForgotPasswordRequestModel body) async {
    BaseReponseModel response = await AuthApi.forgotPassword(body);

    return response.status == StatusResponse.success.name
        ? InforMassage.FORGOT_PASSWORD_SUCCESS
        : throw ServerException(ServerException.FORGOT_PASSWORD_FAILUARE);
  }

  @override
  Future<UserItem?> getCurrentUserData() async {
    UserResponeModel response = await UserApi.getInfo();

    return response.status == StatusResponse.success.name
        ? response.responseData
        : throw ServerException(ServerException.GET_INFO_FAILUARE);
  }

  @override
  Future<String> logout() async {
    BaseReponseModel response = await AuthApi.logout();

    if (response.status == StatusResponse.success.name) {
      Global.storageService
          .setBool(AppConstants.STORAGE_DEVICE_OPEN_FIRST_TIME, false);
      Global.storageService.remove(AppConstants.STORAGE_USER_ACCESS_TOKEN_KEY);
      Global.storageService.remove(AppConstants.STORAGE_USER_REFRESH_TOKEN_KEY);
      return InforMassage.LOGOUT_SUCCESS;
    }

    return throw ServerException(ServerException.LOGOUT_FAILURE);
  }
}
