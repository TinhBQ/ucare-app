// ignore_for_file: non_constant_identifier_names

part of 'pages.dart';

class AppPages {
  static List<PageEntity> routes() {
    return [
      PageEntity(
          route: AppRoutes.INITIAL, pageBuilder: (_) => const SplashPage()),
      // * Auth
      PageEntity(
        route: AppRoutes.SING_IN,
        pageBuilder: (_) => const AuthSignInPage(),
      ),
      PageEntity(
        route: AppRoutes.SIGN_UP,
        pageBuilder: (_) => const AuthSignUpPage(),
      ),
      PageEntity(
        route: AppRoutes.CONFIRM_SIGN_UP,
        pageBuilder: (_) => const AuthConfirmRegisterPage(),
      ),
      PageEntity(
        route: AppRoutes.FORGOT_PASSWORD,
        pageBuilder: (_) => const AuthForgotPassPage(),
      ),
      PageEntity(
        route: AppRoutes.FORGOT_PASSWORD_SEND_OTP,
        pageBuilder: (_) => const AuthForgotPassSendOTPPage(),
      ),
      // * App
      PageEntity(
        route: AppRoutes.APPLICATION,
        pageBuilder: (_) => const ApplicationPage(),
      ),
      // * App --> Home
      PageEntity(
        route: AppRoutes.HOME,
        pageBuilder: (_) => const HomePage(),
      ),
      PageEntity(
        route: AppRoutes.MEDICINE_SCHEDULE,
        pageBuilder: (_) => const MedicineSchedulePage(),
      ),
      // * App --> Profile
      PageEntity(
        route: AppRoutes.PROFILE,
        pageBuilder: (_) => const ProfilePage(),
      ),
      PageEntity(
        route: AppRoutes.SETTINGS,
        pageBuilder: (_) => const ProflieSettingsPage(),
      ),
      PageEntity(
        route: AppRoutes.CHANGE_PASSWORD,
        pageBuilder: (_) => const ProfileChangePasswordPage(),
      ),
      PageEntity(
        route: AppRoutes.CHANGE_PROFILE,
        pageBuilder: (_) => const ProfileEditPage(),
      ),
      PageEntity(
        route: AppRoutes.BOOK_BY_SPECIALTY,
        pageBuilder: (_) => const BookBySpecialtyPage(),
      ),
      PageEntity(
        route: AppRoutes.HISTORY_BOOK,
        pageBuilder: (_) => const HistoryBookPage(),
      ),
      // * App --> Find Exam Times
      PageEntity(
        route: AppRoutes.FIND_EXAM_TIMES,
        pageBuilder: (_) => const DoctorFindExamTimesPage(),
      ),
      PageEntity(
          route: AppRoutes.CHOOSE_DEPARTMET_PAGE,
          pageBuilder: (arguments) {
            final Function(DepartmentItem) onDepartmentSelected =
                arguments['onDepartmentSelected'] as Function(DepartmentItem);
            return DepartmentChooseItemPage(
              onDepartmentSelected: onDepartmentSelected,
              isShowAll: true,
            );
          }),
      // * Section of Day
      PageEntity(
          route: AppRoutes.CHOOSE_SESSION_OF_DAY,
          pageBuilder: (arguments) {
            final Function(SessionOfDayItem) onSessionOfDaySelected =
                arguments['onSessionOfDaySelected'] as Function(
                    SessionOfDayItem);
            return SessionOfDayChooseItemPage(
              onSessionOfDaySelected: onSessionOfDaySelected,
            );
          }),
      PageEntity(
        route: AppRoutes.PATIENT_ADD,
        pageBuilder: (_) => const PatientCreateProfilePage(),
      ),
      PageEntity(
        route: AppRoutes.PAYMENT_HISTORY,
        pageBuilder: (_) => const HistoryHistoryPage(),
      ),
      // patient profile
      PageEntity(
          route: AppRoutes.PATIENT_PROFILE_DETAIL,
          pageBuilder: (arguments) {
            final PatientItem patientItem = arguments['patientItem'];
            return PatientProfileDetailPage(
              patientItem: patientItem,
            );
          }),
      PageEntity(
        route: AppRoutes.PATIENT_PROFILES,
        pageBuilder: (_) => const PatientProfilesPage(),
      ),
      PageEntity(
        route: AppRoutes.STATISTIC,
        pageBuilder: (_) => const StatisticPage(),
      ),
    ];
  }

  static PageEntity? getPageEntityByRoute(String route) {
    for (PageEntity page in routes()) {
      if (page.route == route) {
        return page;
      }
    }
    return null;
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
                        // LoadingOverlay.showLoading(context);
                      }

                      if (state is AuthSuccess) {
                        // LoadingOverlay.dismissLoading();
                        return const ApplicationPage();
                      }

                      if (state is AuthSuccess) {
                        // LoadingOverlay.dismissLoading();
                        return const AuthSignInPage();
                      }

                      LoadingOverlay.dismissLoading();
                      return const AuthSignInPage();
                    },
                  );
                },
                settings: settings);
          }

          return MaterialPageRoute(
              builder: (_) => const AuthSignInPage(), settings: settings);
        }

        Map<String, dynamic>? arguments =
            settings.arguments as Map<String, dynamic>?;

        return MaterialPageRoute(
            builder: (_) => result.first.pageBuilder(arguments ?? {}),
            settings: settings);
      }
    }

    return MaterialPageRoute(
        builder: (_) => const AuthSignInPage(), settings: settings);
  }
}
