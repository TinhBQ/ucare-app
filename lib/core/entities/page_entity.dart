//unify BlocProvider and routes and pages

part of 'entity_dependencies.dart';

class PageEntity {
  String route;
  // Widget page;
  Widget Function(Map<String, dynamic> arguments) pageBuilder;

  PageEntity({
    required this.route,
    required this.pageBuilder,
  });
}
