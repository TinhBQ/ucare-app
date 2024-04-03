// ignore_for_file: constant_identifier_names

class AppConstants {
  static const String APP_NAME = "Ucare App";

  // static const String SERVER_API_URL = "http://localhost:8080";
  static const String SERVER_API_URL =
      "https://mobile-advanced-be-r7xe.onrender.com/";
  static const String API_VERSION = "v1.0/api";

  // SERVER Auth
  static const String SERVER_REFRESH_TOKEN = "$API_VERSION/auth/refreshToken";
  static const String SERVER_LOGIN = "$API_VERSION/auth/login";
  static const String SERVER_SIGN_UP = "$API_VERSION/auth/register";
  static const String SERVER_CONFIRM_SIGN_UP =
      "$API_VERSION/auth/confirmRegister";
  static const String SERVER_CREATE_OTP = "$API_VERSION/auth/createOTP";
  static const String SERVER_FORGOT_PASS = "$API_VERSION/auth/forgotPass";
  static const String SERVER_LOGOUT = "$API_VERSION/auth/signOut";

  // Server User
  static const String SERVER_GET_INFO = "$API_VERSION/user/getInfo";
  static const String SERVER_CHANGE_PASSWORD = "$API_VERSION/auth/changePass";
  static const String SERVER_CHANGE_INFO = "$API_VERSION/user/changeInfo";

  // Server Department
  static const String SERVER_DEPARTMENT = "$API_VERSION/department";

  // Server SessionOfDay
  static const String SERVER_SESSION_OF_DAY = "$API_VERSION/sessionOfDay";
  // Server Doctor
  static const String SERVER_DOCTOR = "$API_VERSION/doctor";

  // Storage Server: shared_preferences
  static const String STORAGE_DEVICE_OPEN_FIRST_TIME = "device_first_open";
  static const String STORAGE_USER_ACCESS_TOKEN_KEY = "user_access_token_key";
  static const String STORAGE_USER_REFRESH_TOKEN_KEY = "user_refresh_token_key";
  static const String STORAGE_USER_REMEMBERS_LOGIN = "user_remembers_login";

  static const List<String> ETHNICITY = [
    'Bana',
    'Bố Y',
    'Brâu',
    'Bru-Vân Kiều',
    'Chăm',
    'Chơ Ro',
    'Chu-Ru',
    'Chứt',
    'Co',
    'Cơ Ho',
    'Cờ Lao',
    'Cơ Tu',
    'Cống',
    'Dao',
    'Ê-Đê',
    'Gia Rai',
    'Giáy',
    'Gié-Triêng',
    'Hà Nhì',
    'Hoa',
    'Hrê',
    'Kháng',
    'Khmer',
    'Khơ Mú',
    'Kinh',
    'La Chí',
    'La Ha',
    'La Hủ',
    'Lào',
    'Lô Lô',
    'Lự',
    'Mạ',
    'Mảng',
    'Mnông',
    'Mông',
    'Mường',
    'Ngái',
    'Nùng',
    'Ơ Đu',
    'Pà Thẻn',
    'Phù Lá',
    'Pu Péo',
    'Ra Glay',
    'Rơ Măm',
    'Sán Chay',
    'Sán Dìu',
    'Si La',
    'Tà Ôi',
    'Tày',
    'Thái	Thổ',
    'Xinh Mun',
    'Xơ Đăng',
    'Xtiêng'
  ];
}
