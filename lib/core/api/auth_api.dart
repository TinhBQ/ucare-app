part of 'api_dependencies.dart';

class AuthApi {
  // * User login
  static login(UserLoginRequestModel body) async {
    try {
      var response = await HttpUtil().post(
        AppConstants.SERVER_LOGIN,
        mydata: body.toJson(),
      );
      if (response.statusCode == HttpStatusCode.OK) {
        return LoginResponeModel.fromJson(response.data);
      } else {
        throw ServerException(ServerException.LOGIN_FAILURE);
      }
    } catch (e) {
      throw ServerException(ServerException.LOGIN_FAILURE);
    }
  }

  // * User Sign up
  static signup(UserSignUpRequestModel body) async {
    try {
      var response = await HttpUtil().post(
        AppConstants.SERVER_SIGN_UP,
        mydata: body.toJson(),
      );

      if (response.statusCode == HttpStatusCode.OK) {
        return BaseReponseModel.fromJson(response.data);
      } else {
        throw ServerException(ServerException.SIGN_UP_FAILURE);
      }
    } catch (e) {
      throw ServerException(ServerException.SIGN_UP_FAILURE);
    }
  }

  // * User Confirm Sign up
  static confirmSignUp(ConfirmRegisterRequestModel params) async {
    try {
      var response = await HttpUtil().get(
        AppConstants.SERVER_CONFIRM_SIGN_UP,
        queryParameters: params.toJson(),
      );

      if (response.statusCode == HttpStatusCode.OK) {
        return BaseReponseModel.fromJson(response.data);
      } else {
        throw ServerException(ServerException.CONFIRM_SIGN_UP_FAILUARE);
      }
    } catch (e) {
      throw ServerException(ServerException.CONFIRM_SIGN_UP_FAILUARE);
    }
  }

  // * Create OTP
  static createOTP(CreateOTPRequestModel body) async {
    try {
      var response = await HttpUtil().post(
        AppConstants.SERVER_CREATE_OTP,
        mydata: body.toJson(),
      );

      if (response.statusCode == HttpStatusCode.OK) {
        return BaseReponseModel.fromJson(response.data);
      } else {
        throw ServerException(ServerException.CREATE_OTP_FAILUARE);
      }
    } catch (e) {
      throw ServerException(ServerException.CREATE_OTP_FAILUARE);
    }
  }

  //* Forgot password
  static forgotPassword(ForgotPasswordRequestModel body) async {
    try {
      var response = await HttpUtil().patch(
        AppConstants.SERVER_FORGOT_PASS,
        mydata: body.toJson(),
      );

      if (response.statusCode == HttpStatusCode.OK) {
        return BaseReponseModel.fromJson(response.data);
      } else {
        throw ServerException(ServerException.FORGOT_PASSWORD_FAILUARE);
      }
    } catch (e) {
      throw ServerException(ServerException.FORGOT_PASSWORD_FAILUARE);
    }
  }

  // * User Logout
  static logout() async {
    try {
      var response = await HttpUtil().delete(
        AppConstants.SERVER_LOGOUT,
      );

      if (response.statusCode == HttpStatusCode.OK) {
        return BaseReponseModel.fromJson(response.data);
      } else {
        throw ServerException(ServerException.LOGOUT_FAILURE);
      }
    } catch (e) {
      throw ServerException(ServerException.LOGOUT_FAILURE);
    }
  }
}
