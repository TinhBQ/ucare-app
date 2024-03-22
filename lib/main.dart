import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';

import 'bloc_providers.dart';
import 'core/common/widgets/custom_circular_progressin_dicator.dart';
import 'core/routes/pages.dart';
import 'core/themes/theme_provider.dart';
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
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, child) {
        EasyLoading.instance
          ..displayDuration = const Duration(milliseconds: 2000)
          ..indicatorWidget = const CustomCircularProgressinDicator()
          ..loadingStyle = EasyLoadingStyle.dark
          ..radius = 10.0
          ..backgroundColor = Colors.green
          ..maskType = EasyLoadingMaskType.black
          ..dismissOnTap = false
          ..animationStyle = EasyLoadingAnimationStyle.opacity
          ..userInteractions = true;

        return FlutterEasyLoading(child: child);
      },
      title: 'U Care',
      theme: Provider.of<ThemeProvider>(context).themeData,
      debugShowCheckedModeBanner: false,
      onGenerateRoute: AppPages.GenerateRouteSettings,
    );
  }
}
