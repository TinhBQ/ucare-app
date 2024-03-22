// ignore_for_file: non_constant_identifier_names

class ServerException implements Exception {
  final String message;
  ServerException(this.message);

  static String LOGIN_SUCCESS = 'Đăng nhập thành công.';
  static String LOGIN_FAILURE = 'Đăng nhập thất bại.';

  static String SIGN_UP_FAILURE = 'Đăng nhập thất bại.';
  static String CONFIRM_SIGN_UP_FAILUARE = 'Xác thực đăg ký thất bại.';
  static String CREATE_OTP_FAILUARE = 'Gửi OTP không thành công.';
  static String FORGOT_PASSWORD_FAILUARE = 'Đổi mật khẩu không thành công.';
}
