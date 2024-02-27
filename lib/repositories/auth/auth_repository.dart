import 'dart:convert';

import 'package:mobile_advanced_project_fe/utils/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'base_auth_repository.dart';
import 'package:http/http.dart' as http;

class AuthRepository extends BaseAuthRepository {
  static var client = http.Client();

  @override
  Future<void> signOut() {
    throw UnimplementedError();
  }

  @override
  Future<bool> signin({
    required String phoneNumber,
    required String password,
  }) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };
    var url = Uri.http(Config.apiURL, '${Config.API}/auth/login');
    var response = await client.post(
      url,
      headers: requestHeaders,
      body: jsonEncode({
        'phone': phoneNumber,
        'password': password,
      }),
    );
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      String accessToken = data['responseData']['accessToken'];
      // Lưu token vào SharedPreferences
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('token', accessToken);
      return true;
    } else {
      return false;
    }
  }

  @override
  Future<bool> signup(
      {required String email,
      required String phoneNumber,
      required String password,
      required String confirmPassword}) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };
    var url = Uri.http(Config.apiURL, '${Config.API}/auth/register');
    var response = await client.post(
      url,
      headers: requestHeaders,
      body: jsonEncode({
        'email': email,
        'phone': phoneNumber,
        'password': password,
        'confirm_password': confirmPassword
      }),
    );
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Future<bool> confirmRegister({required String code}) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };
    var url = Uri.http(Config.apiURL, '${Config.API}/auth/confirmRegister', {
      'token': code,
    });
    var response = await client.get(
      url,
      headers: requestHeaders,
    );
    if (response.statusCode == 200 &&
        jsonDecode(response.body)['status'] == 'success') {
      return true;
    } else {
      return false;
    }
  }
  
  @override
  Future<bool> isLoggined() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    if (token == null) {
      return false;
    } else {
      return true;
    }
  }
}
