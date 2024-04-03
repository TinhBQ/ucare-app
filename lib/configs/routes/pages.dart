// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_advanced_project_fe/core/entities/page_entity.dart';
import 'package:mobile_advanced_project_fe/core/utils/loading_overlay.dart';
import 'package:mobile_advanced_project_fe/features/application/presentation/pages/application_page.dart';
import 'package:mobile_advanced_project_fe/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:mobile_advanced_project_fe/features/auth/presentation/pages/pages.dart';
import 'package:mobile_advanced_project_fe/features/deparment/presentation/pages/pages.dart';
import 'package:mobile_advanced_project_fe/features/doctor/presentation/pages/pages.dart';
import 'package:mobile_advanced_project_fe/features/home/presentation/pages/home_page.dart';
import 'package:mobile_advanced_project_fe/features/medicine_schedule/presentation/pages/pages.dart';
import 'package:mobile_advanced_project_fe/features/profile/presentation/pages/pages.dart';
import 'package:mobile_advanced_project_fe/features/session_of_day/presentation/pages/pages.dart';
import 'package:mobile_advanced_project_fe/features/splash/presentation/splash_page.dart';
import 'package:mobile_advanced_project_fe/global.dart';

import '../../core/utils/utils.dart';
import 'names.dart';

class AppPages {
  static List<PageEntity> routes() {
    return [
      PageEntity(
        route: AppRoutes.INITIAL,
        page: const SplashPage(),
      ),
      // * Auth
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
      // * App
      PageEntity(
        route: AppRoutes.APPLICATION,
        page: const ApplicationPage(),
      ),
      // * App --> Home
      PageEntity(
        route: AppRoutes.HOME,
        page: const HomePage(),
      ),
      PageEntity(
        route: AppRoutes.MEDICINE_SCHEDULE,
        page: const MedicineSchedulePage(),
      ),
      // * App --> Profile
      PageEntity(
        route: AppRoutes.PROFILE,
        page: const ProfilePage(),
      ),
      PageEntity(
        route: AppRoutes.SETTINGS,
        page: const SettingsPage(),
      ),
      PageEntity(
        route: AppRoutes.CHANGE_PASSWORD,
        page: const ChangePasswordPage(),
      ),
      // * App --> Find Exam Times
      PageEntity(
        route: AppRoutes.FIND_EXAM_TIMES,
        page: const FindExamTimesPage(),
      ),
      PageEntity(
        route: AppRoutes.CHOOSE_DEPARTMET_PAGE,
        page: const ChooseDepartmentPage(),
      ),
      PageEntity(
        route: AppRoutes.CHOOSE_SESSION_OF_DAY,
        page: const ChooseSessionOfDayPage(),
      ),
    ];
  }

  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  static MaterialPageRoute GenerateRouteSettings(RouteSettings settings) {
    if (settings.name != null) {
      var result = routes().where((element) => element.route == settings.name);

      if (result.isNotEmpty) {
        bool deviceFirstOpen = Global.storageService.getDeviceFirstOpen();
        if (result.first.route == AppRoutes.INITIAL && deviceFirstOpen) {
          bool isLoggedin = Global.storageService.getIsLoggedIn();

          if (isLoggedin) {
            bool isDataLoaded = false;

            return MaterialPageRoute(
                builder: (context) {
                  if (!isDataLoaded) {
                    context.read<AuthBloc>().add(AuthUserLoggedIn());
                    isDataLoaded = true;
                  }

                  return BlocConsumer<AuthBloc, AuthState>(
                    listener: (context, state) {},
                    builder: (context, state) {
                      if (state is AuthLoading) {
                        LoadingOverlay.showLoading(context);
                      }

                      if (state is AuthSuccess) {
                        LoadingOverlay.dismissLoading();
                        return const ApplicationPage();
                      }

                      LoadingOverlay.dismissLoading();
                      return const SignInPage();
                    },
                  );
                },
                settings: settings);
          }

          return MaterialPageRoute(
              builder: (_) => const SignInPage(), settings: settings);
        }

        return MaterialPageRoute(
            builder: (_) => result.first.page, settings: settings);
      }
    }

    return MaterialPageRoute(
        builder: (_) => const SignInPage(), settings: settings);
  }
}
