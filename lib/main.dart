import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_advanced_project_fe/blocs/blocs.dart';
import 'package:mobile_advanced_project_fe/configs/app_router.dart';
import 'package:mobile_advanced_project_fe/configs/themes/light_theme.dart';
import 'package:mobile_advanced_project_fe/cubits/cubits.dart';
import 'package:mobile_advanced_project_fe/repositories/repositories.dart';
import 'package:mobile_advanced_project_fe/screens/screens.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => SignInCubit(
            authRepository: AuthRepository(),
          ),
          child: const SignInScreen(),
        ),
        BlocProvider(
          create: (_) => SignUpCubit(
            authRepository: AuthRepository(),
          ),
          child: const SignupScreen(),
        ),
        BlocProvider(
          create: (_) => ConfirmRegisterCubit(
            authRepository: AuthRepository(),
          ),
          child: const ConfirmRegisterScreen(),
        ),
        BlocProvider(
          create: (_) => CreateOTPCubit(
            authRepository: AuthRepository(),
          ),
          child: const ForgotPassScreen(),
        ),
        BlocProvider(
          create: (_) => ForgotPassCubit(
            authRepository: AuthRepository(),
          ),
          child: const ForgotPassSendOTPScreen(),
        ),
        BlocProvider(
          create: (_) => AuthBloc(
            authRepository: AuthRepository(),
          )..add(AuthEventStarted()),
        ),
      ],
      child: MaterialApp(
        title: 'U Care',
        theme: lightTheme,
        debugShowCheckedModeBanner: false,
        onGenerateRoute: AppRouter.onGenerateRoute,
        initialRoute: SplashScreen.routeName,
        navigatorKey: navigatorKey,

      ),
    );
  }
}
