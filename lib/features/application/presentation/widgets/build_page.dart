import 'package:flutter/material.dart';
import 'package:mobile_advanced_project_fe/features/book/presentation/pages/pages.dart';
import 'package:mobile_advanced_project_fe/features/doctor/presentation/pages/pages.dart';
import 'package:mobile_advanced_project_fe/features/home/presentation/pages/pages.dart';
import 'package:mobile_advanced_project_fe/features/patient/presentation/pages/patient_choose_profile_page.dart';
// import 'package:mobile_advanced_project_fe/features/medicine_schedule/presentation/pages/pages.dart';
import 'package:mobile_advanced_project_fe/features/profile/presentation/pages/pages.dart';

final _medicineSchedulePage = BookBySpecialtyPage();

Widget buildPage(int index) {
  List<Widget> widget = [
    const HomePage(),
    _medicineSchedulePage,
    const PatientChooseProfilePage(),
    const FindExamTimesPage(),
    const ProfilePage(),
  ];

  return widget[index];
}
