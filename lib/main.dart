import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_advanced_project_fe/configs/routes/routes.dart';
import 'package:provider/provider.dart';

import 'bloc_providers.dart';
import 'configs/themes/theme_provider.dart';
import 'global.dart';

void main() async {
  await Global.init();
  runApp(
    MultiBlocProvider(
      providers: AppBlocProviders.allBlocProviders,
      child: ChangeNotifierProvider(
        create: (context) => ThemeProvider(),
        child: const MyApp(),
      ),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  GlobalKey<NavigatorState> navigatorKey = AppPages.navigatorKey;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'U Care',
      theme: Provider.of<ThemeProvider>(context).themeData,
      debugShowCheckedModeBanner: false,
      navigatorKey: navigatorKey,
      onGenerateRoute: AppPages.GenerateRouteSettings,
    );
  }
}
