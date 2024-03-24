// ignore_for_file: constant_identifier_names

class AppConstants {
  static const String APP_NAME = "Ucare App";

  static const String SERVER_API_URL = "http://10.0.2.2:8080/";

  // SERVER Auth
  static const String SERVER_REFRESH_TOKEN = "api/auth/refreshToken";
  static const String SERVER_LOGIN = "api/auth/login";
  static const String SERVER_SIGN_UP = "api/auth/register";
  static const String SERVER_CONFIRM_SIGN_UP = "api/auth/confirmRegister";
  static const String SERVER_CREATE_OTP = "api/auth/createOTP";
  static const String SERVER_FORGOT_PASS = "api/auth/forgotPass";
  static const String SERVER_LOGOUT = "api/auth/signOut";

  // Server User
  static const String SERVER_GET_INFO = "api/user/getInfo";

  // Storage Server: shared_preferences
  static const String STORAGE_DEVICE_OPEN_FIRST_TIME = "device_first_open";
  static const String STORAGE_USER_ACCESS_TOKEN_KEY = "user_access_token_key";
  static const String STORAGE_USER_REFRESH_TOKEN_KEY = "user_refresh_token_key";
  static const String STORAGE_USER_REMEMBERS_LOGIN = "user_remembers_login";
}
