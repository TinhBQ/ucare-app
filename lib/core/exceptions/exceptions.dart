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
  static String CHANGE_PASSWORD_FAILURE = 'Thay đổi mật khẩu không này.';

  static String LOGOUT_FAILURE = 'Đăng xuất không thành công.';

  static String GET_INFO_FAILUARE = 'Lấy thông tin không thành công.';

  static String GET_DEPARTMENT_FAILURE =
      'Lấy danh sách chuyên khoa không thành công.';

  static String GET_SESSION_OF_DAY_FAILURE =
      'Lấy danh sách ngày khám không thành công.';

  static String GET_DOCTOR_FAILURE = 'Lấy danh sách Bác sĩ không thành công.';
}
