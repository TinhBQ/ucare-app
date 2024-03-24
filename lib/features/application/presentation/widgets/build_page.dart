import 'package:flutter/material.dart';
import 'package:mobile_advanced_project_fe/features/home/presentation/pages/pages.dart';
import 'package:mobile_advanced_project_fe/features/profile/presentation/pages/pages.dart';
import 'package:mobile_advanced_project_fe/features/settings/presentation/pages/settings_page.dart';

Widget buildPage(int index) {
  List<Widget> widget = [
    const HomePage(),
    const SettingsPage(),
    const ProfilePage(),
  ];

  return widget[index];
}
