import 'package:mobile_advanced_project_fe/core/values/constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  late final SharedPreferences _prefs;

  Future<StorageService> init() async {
    _prefs = await SharedPreferences.getInstance();
    return this;
  }

  Future<bool> setBool(String key, bool value) async {
    return await _prefs.setBool(key, value);
  }

  Future<bool> setString(String key, String value) async {
    return await _prefs.setString(key, value);
  }

  Future<bool> remove(String key) async {
    return await _prefs.remove(key);
  }

  // Kiểm tra lần đẩu mở thiết bị
  bool getDeviceFirstOpen() {
    return _prefs.getBool(AppConstants.STORAGE_DEVICE_OPEN_FIRST_TIME) ?? false;
  }

  // Kiểm tra đã login chưa
  bool getIsLoggedIn() {
    return _prefs.getString(AppConstants.STORAGE_USER_ACCESS_TOKEN_KEY) == null
        ? false
        : true;
  }

  // Lấy tokens
  String getUserAccessTokenKey() {
    return _prefs.getString(AppConstants.STORAGE_USER_ACCESS_TOKEN_KEY) ?? "";
  }

  // Lấy refresh tokens
  String getUserRefreshTokenKey() {
    return _prefs.getString(AppConstants.STORAGE_USER_REFRESH_TOKEN_KEY) ?? "";
  }

  // Kiểm tra user có ghi nhớ tài khoản không
  bool getRemembersLogin() {
    return _prefs.getBool(AppConstants.STORAGE_USER_REMEMBERS_LOGIN) ?? false;
  }
}
