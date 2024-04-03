//unify BlocProvider and routes and pages
import 'package:flutter/material.dart';

class PageEntity {
  String route;
  // Widget page;
  Widget Function(Map<String, dynamic> arguments) pageBuilder;

  PageEntity({
    required this.route,
    required this.pageBuilder,
  });
}
