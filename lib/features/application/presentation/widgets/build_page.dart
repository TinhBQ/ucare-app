import 'package:flutter/material.dart';
import 'package:mobile_advanced_project_fe/features/book/presentation/pages/pages.dart';
import 'package:mobile_advanced_project_fe/features/doctor/presentation/pages/pages.dart';
import 'package:mobile_advanced_project_fe/features/home/presentation/pages/pages.dart';
import 'package:mobile_advanced_project_fe/features/medicine_schedule/presentation/pages/pages.dart';
import 'package:mobile_advanced_project_fe/features/profile/presentation/pages/pages.dart';

final _MedicineSchedulePage = MedicineSchedulePage();
final _BookBySpecialtyPage = BookBySpecialtyPage();

Widget buildPage(int index) {
  List<Widget> widget = [
    const HomePage(),
    _BookBySpecialtyPage,
    const FindExamTimesPage(),
    const ProfilePage(),
  ];

  return widget[index];
}
