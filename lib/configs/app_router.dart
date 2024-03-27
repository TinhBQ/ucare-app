import 'package:flutter/material.dart';
import 'package:mobile_advanced_project_fe/presentation/screens/screens.dart';

class AppRouter {
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case ChooseProflieScreen.routeName:
        return ChooseProflieScreen.route();
      case CreateNewProfile.routeName:
        return CreateNewProfile.route();
      case MedicalAppointmentScheduleScreen.routeName:
        return MedicalAppointmentScheduleScreen.route();
      case ProfilesScreen.routeName:
        return ProfilesScreen.route();
      case EditProfileScreen.routeName:
        return EditProfileScreen.route();
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
