// ignore_for_file: avoid_print, deprecated_member_use

import 'package:dio/dio.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jwt_decode/jwt_decode.dart';
import 'package:mobile_advanced_project_fe/configs/routes/routes.dart';
import 'package:mobile_advanced_project_fe/core/utils/show_snackbar.dart';
import 'package:mobile_advanced_project_fe/core/values/constant.dart';
import 'package:mobile_advanced_project_fe/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:mobile_advanced_project_fe/core/values/logger.dart';
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
  late BuildContext context;

  HttpUtil._internal() {
    BaseOptions options = BaseOptions(
      baseUrl: AppConstants.SERVER_API_URL,
      receiveDataWhenStatusError: true,
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 5),
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

      // Lấy các token được lưu tạm từ local storage
      String accessToken = Global.storageService.getUserAccessTokenKey();
      String refreshToken = Global.storageService.getUserRefreshTokenKey();

      // Kiểm tra xem user có đăng nhập hay chưa. Nếu chưa thì call handler.next(options)
      // để trả data về tiếp client
      if (accessToken.isEmpty || refreshToken.isEmpty) {
        return handler.next(options);
      }

      // Giải mã access token
      // Kiểm tra token còn hạn hay không?
      Map<String, dynamic> decodedAccessToken = Jwt.parseJwt(accessToken);
      print("Decoded access token: $decodedAccessToken");
      if (Jwt.isExpired(accessToken)) {
        try {
          final response = await dio.post(
            AppConstants.SERVER_REFRESH_TOKEN,
            data: refreshToken,
          );

          print("response: $response");
          if (response.statusCode == 200) {
            if (response.data != false) {
              options.headers['Authorization'] =
                  "Bearer ${response.data['responseData']['accessToken']}";

              Global.storageService.setString(
                  AppConstants.STORAGE_USER_ACCESS_TOKEN_KEY,
                  response.data['responseData']['accessToken']);
            } else {
              logout();
            }
          } else {
            logout();
          }
          return handler.next(options);
        } on DioError catch (error) {
          logout();
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
        logout();
      }
      return handler.next(error);
    }));

    dio.httpClientAdapter = HttpClientAdapter();

    //
  }

  void logout() {
    if (context.mounted) {
      context.read<AuthBloc>().add(AuthLogout());
      ShowSnackBar.error('Something went wrong!', context);
      Navigator.of(context)
          .pushNamedAndRemoveUntil(AppRoutes.SING_IN, (route) => false);
    }
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

    AppLogger.logger.d("my response is ${response.toString()}\n"
        "my status code is ${response.statusCode}\n"
        "my body is ${response.data}\n"
        "my headers are ${response.headers}");
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

    AppLogger.logger.d("my response is ${response.toString()}\n"
        "my status code is ${response.statusCode}\n"
        "my body is ${response.data}\n"
        "my headers are ${response.headers}");
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

    AppLogger.logger.d("my response is ${response.toString()}\n"
        "my status code is ${response.statusCode}\n"
        "my body is ${response.data}\n"
        "my headers are ${response.headers}");
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

    AppLogger.logger.d("my response is ${response.toString()}\n"
        "my status code is ${response.statusCode}\n"
        "my body is ${response.data}\n"
        "my headers are ${response.headers}");
    return response;
  }
}
