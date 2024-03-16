import 'package:flutter/material.dart';
import 'package:mobile_advanced_project_fe/configs/app_router.dart';
import 'package:mobile_advanced_project_fe/core/themes/themes.dart';
import 'package:mobile_advanced_project_fe/data/repositories/repositories.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_advanced_project_fe/logic/blocs/blocs.dart';
import 'package:mobile_advanced_project_fe/logic/cubits/cubits.dart';
import 'package:mobile_advanced_project_fe/presentation/screens/screens.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: const MyApp(),
    ),
  );
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
        theme: Provider.of<ThemeProvider>(context).themeData,
        // darkTheme: darkTheme,
        // themeMode: ThemeMode.system,
        debugShowCheckedModeBanner: false,
        onGenerateRoute: AppRouter.onGenerateRoute,
        initialRoute: MedicalAppointmentScheduleScreen.routeName,
        navigatorKey: navigatorKey,
      ),
    );
  }
}
