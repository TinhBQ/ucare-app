import 'package:flutter/material.dart';
import 'package:mobile_advanced_project_fe/features/home/presentation/pages/pages.dart';
import 'package:mobile_advanced_project_fe/features/profile/presentation/pages/pages.dart';

Widget buildPage(int index) {
  List<Widget> widget = [
    const HomePage(),
    const ChangePasswordPage(),
    const ProfilePage(),
  ];

  return widget[index];
}
