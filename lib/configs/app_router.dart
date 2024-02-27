import 'package:flutter/material.dart';
import 'package:mobile_advanced_project_fe/screens/screens.dart';

class AppRouter {
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/splash':
        return SplashScreen.route();
      case '/signin':
        return SignInScreen.route();
      case '/signup':
        return SignupScreen.route();
      case '/signup/confirm':
        return ConfirmRegisterScreen.route();
      default:
        return SplashScreen.route();
    }
  }
}
