// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:mobile_advanced_project_fe/core/entities/page_entity.dart';
import 'package:mobile_advanced_project_fe/features/auth/presentation/pages/auth_pages.dart';
import 'package:mobile_advanced_project_fe/features/splash/presentation/splash_page.dart';

import 'names.dart';

class AppPages {
  static List<PageEntity> routes() {
    return [
      PageEntity(
        route: AppRoutes.INITIAL,
        page: const SplashPage(),
      ),
      PageEntity(
        route: AppRoutes.SING_IN,
        page: const SignInPage(),
      ),
      PageEntity(
        route: AppRoutes.SIGN_UP,
        page: const SignUpPage(),
      ),
      PageEntity(
        route: AppRoutes.CONFIRM_SIGN_UP,
        page: const ConfirmRegisterPage(),
      ),
      PageEntity(
        route: AppRoutes.FORGOT_PASSWORD,
        page: const ForgotPassPage(),
      ),
      PageEntity(
        route: AppRoutes.FORGOT_PASSWORD_SEND_OTP,
        page: const ForgotPassSendOTPPage(),
      ),
    ];
  }

  static MaterialPageRoute GenerateRouteSettings(RouteSettings settings) {
    if (settings.name != null) {
      var result = routes().where((element) => element.route == settings.name);

      if (result.isNotEmpty) {
        // bool deviceFirstOpen = Global.storageService.getDeviceFirstOpen();
        // if (result.first.route == AppRoutes.INITIAL && deviceFirstOpen) {
        //   bool isLoggedin = Global.storageService.getIsLoggedIn();
        //   if (isLoggedin) {
        //     return MaterialPageRoute(
        //         builder: (_) => const ApplicationPage(), settings: settings);
        //   }

        //   return MaterialPageRoute(
        //       builder: (_) => const SignInScreen(), settings: settings);
        // }
        return MaterialPageRoute(
            builder: (_) => result.first.page, settings: settings);
      }
    }
    return MaterialPageRoute(
        builder: (_) => const SignInPage(), settings: settings);
  }
}
