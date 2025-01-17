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
  static const String SERVER_CHANGE_INFO = "$API_VERSION/user/changeInfor";

  static const String SERVER_UPLOAD_FILE = "$API_VERSION/files";

  // Server Department
  static const String SERVER_DEPARTMENT = "$API_VERSION/department";

  // Server statistic
  static const String SERVER_STATISTIC_MONTH_TO_MONTH = "$API_VERSION/statistic/getUserMonthToMonth";

  // Server SessionOfDay
  static const String SERVER_SESSION_OF_DAY = "$API_VERSION/sessionOfDay";
  // Server Doctor
  static const String SERVER_DOCTOR = "$API_VERSION/doctor";

  // Server Patient
  static const String SERVER_PATIENT = "$API_VERSION/patient";
  static const String SERVER_PATIENT_BOOK_SCHEDULE =
      "$API_VERSION/patient/bookSchedule";

  // Server Patient schedule
  static const String SERVER_PATIENT_SCHEDULE = "$API_VERSION/patient_schedule";

  // Storage Server: shared_preferences
  static const String STORAGE_DEVICE_OPEN_FIRST_TIME = "device_first_open";
  static const String STORAGE_USER_ACCESS_TOKEN_KEY = "user_access_token_key";
  static const String STORAGE_USER_REFRESH_TOKEN_KEY = "user_refresh_token_key";
  static const String STORAGE_USER_REMEMBERS_LOGIN = "user_remembers_login";

  //Server country
  static const String SERVER_ALL_COUNTRY = "$API_VERSION/country/getAllCountry";

  //Server schedule
  static const String SERVER_SCHEDULE = "$API_VERSION/schedule";

  // Server order
  static const String SERVER_ORDER_PAYMENT_RETURN_URL =
      "$API_VERSION/order/payment/VNPAY/generatePaymentLink";
  static const String SERVER_ORDER_PAYMENT = "$API_VERSION/order/payment";
  static const String SERVER_ORDER = "$API_VERSION/order";
  static const String SERVER_GET_MY_ORDER = "$API_VERSION/order/getMyOrders";

  static const String SERVER_NEW = "$API_VERSION/news";

  // Server STATUS
  static const String SERVER_STATUS = "$API_VERSION/status";

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
