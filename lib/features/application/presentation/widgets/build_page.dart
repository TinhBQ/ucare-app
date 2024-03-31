import 'package:flutter/material.dart';
import 'package:mobile_advanced_project_fe/features/find_exam_times/presentation/pages/pages.dart';
import 'package:mobile_advanced_project_fe/features/home/presentation/pages/pages.dart';
import 'package:mobile_advanced_project_fe/features/medicine_schedule/presentation/pages/pages.dart';
import 'package:mobile_advanced_project_fe/features/profile/presentation/pages/pages.dart';

final _ChooseDepartmentPage = ChooseDepartmentPage();
final _MedicineSchedulePage = MedicineSchedulePage();

Widget buildPage(int index) {
  List<Widget> widget = [
    const HomePage(),
    _MedicineSchedulePage,
    const FindExamTimesPage(),
    const ProfilePage(),
  ];

  return widget[index];
}
