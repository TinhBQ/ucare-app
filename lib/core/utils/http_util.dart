// ignore_for_file: avoid_print, deprecated_member_use

import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:jwt_decode/jwt_decode.dart';
import 'package:mobile_advanced_project_fe/core/values/constant.dart';
import 'package:mobile_advanced_project_fe/global.dart';

const noToken = [
  AppConstants.SERVER_API_URL + AppConstants.SERVER_REFRESH_TOKEN,
  AppConstants.SERVER_API_URL + AppConstants.SERVER_LOGIN,
  AppConstants.SERVER_API_URL + AppConstants.SERVER_SIGN_UP,
  AppConstants.SERVER_API_URL + AppConstants.SERVER_CONFIRM_SIGN_UP,
  AppConstants.SERVER_API_URL + AppConstants.SERVER_CREATE_OTP,
  AppConstants.SERVER_API_URL + AppConstants.SERVER_FORGOT_PASS,
];

class HttpUtil {
  static final HttpUtil _instance = HttpUtil._internal();

  factory HttpUtil() {
    return _instance;
  }

  late Dio dio;

  HttpUtil._internal() {
    BaseOptions options = BaseOptions(
      baseUrl: AppConstants.SERVER_API_URL,
      receiveDataWhenStatusError: true,
      connectTimeout: const Duration(seconds: 3),
      receiveTimeout: const Duration(seconds: 3),
      headers: {},
      contentType: "application/json; charset=utf-8",
      responseType: ResponseType.json,
    );

    dio = Dio(options);

    dio.interceptors
        .add(InterceptorsWrapper(onRequest: (options, handler) async {
      print('options ${options.path}');
      if (!options.path.contains('http')) {
        options.path = AppConstants.SERVER_API_URL + options.path;
      }

      if (noToken.any((element) => element == options.path)) {
        return handler.next(options);
      }

      print('options.path ${options.path}');

      // Lấy các token được lưu tạm từ local storage
      String accessToken = Global.storageService.getUserAccessTokenKey();
      String refreshToken = Global.storageService.getUserRefreshTokenKey();

      print("Access token: $accessToken");
      print("refresh token: $refreshToken");

      // Kiểm tra xem user có đăng nhập hay chưa. Nếu chưa thì call handler.next(options)
      // để trả data về tiếp client
      if (accessToken.isEmpty || refreshToken.isEmpty) {
        print("next");
        return handler.next(options);
      }

      print("next 1");

      // Giải mã access token
      // Kiểm tra token còn hạn hay không?
      Map<String, dynamic> decodedAccessToken = Jwt.parseJwt(accessToken);
      print("Decoded access token: $decodedAccessToken");
      if (Jwt.isExpired(accessToken)) {
        print("next 2");
        try {
          print("next 3");
          final response = await dio.post(
            AppConstants.SERVER_REFRESH_TOKEN,
            data: refreshToken,
          );
          print("next 4");

          print("response: $response");
          if (response.statusCode == 200) {
            print("next 5");
            //! EXPIRED SESSION
            if (response.data != false) {
              options.headers['Authorization'] =
                  "Bearer ${response.data['responseData']['accessToken']}";

              Global.storageService.setString(
                  AppConstants.STORAGE_USER_ACCESS_TOKEN_KEY,
                  response.data['responseData']['accessToken']);
            } else {
              // logout();
            }
          } else {
            // logout();
          }
          return handler.next(options);
        } on DioError catch (error) {
          // logout();
          return handler.reject(error, true);
        }
      } else {
        options.headers['Authorization'] = "Bearer $accessToken";
        return handler.next(options);
      }
    }, onResponse: (Response response, handler) {
      // Do something with response data
      return handler.next(response);
    }, onError: (DioError error, handler) async {
      // Ghi log những lỗi gửi về Sentry hoặc Firebase crashlytics
      // SentryLogError().additionalData(error);
      if (error.response?.statusCode == 401) {
        // Đăng xuất khi hết session
        // logout();
      }
      return handler.next(error);
    }));

    // badCertificateCallback
    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };
  }

  Future post(
    String path, {
    dynamic mydata,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    Options requestOptions = options ?? Options();
    requestOptions.headers = requestOptions.headers ?? {};

    var response = await dio.post(
      path,
      data: mydata,
      queryParameters: queryParameters,
      options: requestOptions,
    );

    print("my response is ${response.toString()}");
    print("my status code is ${response.statusCode}");
    print("my body is ${response.data}");
    print("my headers are ${response.headers}");
    return response;
  }

  Future get(
    String path, {
    dynamic mydata,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    Options requestOptions = options ?? Options();
    requestOptions.headers = requestOptions.headers ?? {};

    var response = await dio.get(
      path,
      data: mydata,
      queryParameters: queryParameters,
      options: requestOptions,
    );

    print("my response is ${response.toString()}");
    print("my status code is ${response.statusCode}");
    print("my body is ${response.data}");
    print("my headers are ${response.headers}");
    return response;
  }

  Future patch(
    String path, {
    dynamic mydata,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    Options requestOptions = options ?? Options();
    requestOptions.headers = requestOptions.headers ?? {};

    var response = await dio.patch(
      path,
      data: mydata,
      queryParameters: queryParameters,
      options: requestOptions,
    );

    print("my response is ${response.toString()}");
    print("my status code is ${response.statusCode}");
    print("my body is ${response.data}");
    print("my headers are ${response.headers}");
    return response;
  }

  Future delete(
    String path, {
    dynamic mydata,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    Options requestOptions = options ?? Options();
    requestOptions.headers = requestOptions.headers ?? {};

    var response = await dio.delete(
      path,
      data: mydata,
      queryParameters: queryParameters,
      options: requestOptions,
    );

    print("my response is ${response.toString()}");
    print("my status code is ${response.statusCode}");
    print("my body is ${response.data}");
    print("my headers are ${response.headers}");
    return response;
  }
}
