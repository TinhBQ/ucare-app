// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:mobile_advanced_project_fe/configs/routes/names/book_names.dart';
import 'package:mobile_advanced_project_fe/core/entities/page_entity.dart';
import 'package:mobile_advanced_project_fe/core/items/items.dart';
import 'package:mobile_advanced_project_fe/features/book/presentation/pages/pages.dart';
import 'package:mobile_advanced_project_fe/features/book/presentation/pages/book_payment_confirm_page.dart';
import 'package:mobile_advanced_project_fe/features/deparment/presentation/pages/pages.dart';
import 'package:mobile_advanced_project_fe/features/patient/presentation/pages/pages.dart';
import 'package:mobile_advanced_project_fe/features/schedule/presentation/pages/choose_doctor_exam_page.dart';
import 'package:mobile_advanced_project_fe/features/session_of_day/presentation/pages/choose_session_of_day_page.dart';

class BookPages {
  static List<PageEntity> routes() {
    return [
      PageEntity(
        route: BookRoutes.BOOK_PATIENT_CHOOSE_PROFILE,
        pageBuilder: (_) => const PatientChooseProfilePage(),
      ),
      PageEntity(
        route: BookRoutes.BOOK_CHOOSE_EXAM_INFOR,
        pageBuilder: (_) => const ChooseExamInfoPage(),
      ),
      PageEntity(
        route: BookRoutes.BOOK_CHOOSE_DATE_MEDICAL_PAGE,
        pageBuilder: (arguments) {
          final Function(DateTime) onDateMedicalPageSelected =
              arguments['onDateMedicalPageSelected'] as Function(DateTime);
          return ChooseDateMedicalPage(
            onDateMedicalPageSelected: onDateMedicalPageSelected,
          );
        },
      ),
      PageEntity(
          route: BookRoutes.BOOK_CHOOSE_DEPARTMET_PAGE,
          pageBuilder: (arguments) {
            final Function(DepartmentItem) onDepartmentSelected =
                arguments['onDepartmentSelected'] as Function(DepartmentItem);
            return ChooseDepartmentPage(
              onDepartmentSelected: onDepartmentSelected,
            );
          }),
      PageEntity(
          route: BookRoutes.BOOK_CHOOSE_SESSION_OF_DAY,
          pageBuilder: (arguments) {
            final Function(SessionOfDayItem) onSessionOfDaySelected =
                arguments['onSessionOfDaySelected'] as Function(
                    SessionOfDayItem);
            return ChooseSessionOfDayPage(
              onSessionOfDaySelected: onSessionOfDaySelected,
            );
          }),
      PageEntity(
          route: BookRoutes.BOOK_CHOOSE_DOCTOR_EXAM_PAGE,
          pageBuilder: (arguments) {
            final String department_id = arguments['department_id'] as String;
            final String day = arguments['day'] as String;
            final Function(ScheduleItem) onChooseDoctorExamPage =
                arguments['onChooseDoctorExamPage'] as Function(ScheduleItem);

            return ChooseDoctorExamPage(
              department_id: department_id,
              day: day,
              onChooseDoctorExamPage: onChooseDoctorExamPage,
            );
          }),
      PageEntity(
          route: BookRoutes.BOOK_PAYMENT,
          pageBuilder: (arguments) {
            final String link = arguments['link'] as String;

            return VnpayPage(
              link: link,
            );
          }),
      PageEntity(
        route: BookRoutes.BOOK_PAYMENT_CONFIRM,
        pageBuilder: (_) => const BookPaymentConfirmPage(),
      ),
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

    // return MaterialPageRoute(
    //     builder: (_) => const ChooseExamInfoPage(), settings: settings);
  }
}
