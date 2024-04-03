// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:mobile_advanced_project_fe/core/entities/page_entity.dart';
import 'package:mobile_advanced_project_fe/core/items/items.dart';
import 'package:mobile_advanced_project_fe/features/book/presentation/pages/choose_date_medical_page.dart';
import 'package:mobile_advanced_project_fe/features/book/presentation/widgets/widgets.dart';
import 'package:mobile_advanced_project_fe/features/deparment/presentation/pages/pages.dart';
import 'package:mobile_advanced_project_fe/features/patient/presentation/pages/pages.dart';

import 'names.dart';

class BookPages {
  static List<PageEntity> routes() {
    return [
      PageEntity(
        route: AppRoutes.PATIENT_CHOOSE_PROFILE,
        pageBuilder: (_) => const PatientChooseProfilePage(),
      ),
      PageEntity(
        route: AppRoutes.CHOOSE_INFOR,
        pageBuilder: (_) => const ChooseInfoWidget(),
      ),
      PageEntity(
        route: AppRoutes.CHOOSE_DATE_MEDICAL_PAGE,
        pageBuilder: (_) => const ChooseDateMedicalPage(),
      ),
      PageEntity(
          route: AppRoutes.CHOOSE_DEPARTMET_PAGE,
          pageBuilder: (arguments) {
            final Function(DepartmentItem) onDepartmentSelected =
                arguments['onDepartmentSelected'] as Function(DepartmentItem);
            return ChooseDepartmentPage(
              onDepartmentSelected: onDepartmentSelected,
            );
          }),
    ];
  }

  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  static MaterialPageRoute GenerateRouteSettings(RouteSettings settings) {
    if (settings.name != null) {
      var result = routes().where((element) => element.route == settings.name);

      if (result.isNotEmpty) {
        Map<String, dynamic>? arguments =
            settings.arguments as Map<String, dynamic>?;
        return MaterialPageRoute(
            builder: (_) => result.first.pageBuilder(arguments ?? {}),
            settings: settings);
      }
    }

    return MaterialPageRoute(
        builder: (_) => const PatientChooseProfilePage(), settings: settings);
  }
}
