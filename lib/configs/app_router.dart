import 'package:flutter/material.dart';
import 'package:mobile_advanced_project_fe/screens/screens.dart';

class AppRouter {
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case MainScreen.routeName:
        return MainScreen.route();
      case SplashScreen.routeName:
        return SplashScreen.route();
      case SignInScreen.routeName:
        return SignInScreen.route();
      case SignupScreen.routeName:
        return SignupScreen.route();
      case ConfirmRegisterScreen.routeName:
        return ConfirmRegisterScreen.route();
      case ForgotPassScreen.routeName:
        return ForgotPassScreen.route();
      case ForgotPassSendOTPScreen.routeName:
        return ForgotPassSendOTPScreen.route();
      case HomeScreen.routeName:
        return HomeScreen.route();
      case ProfileScreen.routeName:
        return ProfileScreen.route();
      default:
        return _errorRoute();
    }
  }
  static Route _errorRoute() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: '/error'),
        builder: (_) => Scaffold(
              appBar: AppBar(
                title: const Text('Error'),
              ),
            ));
  }
}
