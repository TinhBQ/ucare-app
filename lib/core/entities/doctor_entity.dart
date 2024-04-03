// ignore_for_file: non_constant_identifier_names

import 'degree_entity.dart';
import 'department_entity.dart';
import 'session_of_day_entity.dart';

class DoctorEntity {
  final String id;
  final String name;
  final String? avatar;
  final String? birthday;
  final String? description;
  final DegreeEntity? degree;
  final DepartmentEntity? department;
  final SessionOfDayEntity? session_of_day;
  final bool? enable;

  DoctorEntity({
    required this.id,
    required this.name,
    this.avatar,
    this.birthday,
    this.description,
    this.degree,
    this.department,
    this.session_of_day,
    this.enable,
  });
}
