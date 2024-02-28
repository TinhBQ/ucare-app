import 'dart:async';
import 'package:mobile_advanced_project_fe/screens/screens.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  static const String routeName = '/splash';

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const SplashScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 2),
        () => Navigator.pushReplacement(context, MainScreen.route()));
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image(
              image: AssetImage('assets/logo/logo.png'),
              height: 70,
              width: 70,
            ),
          ),
        ],
      ),
    );
  }
}
