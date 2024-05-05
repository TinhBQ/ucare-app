// ignore_for_file: non_constant_identifier_names

part of 'entity_dependencies.dart';

class DoctorEntity {
  final String? id;
  final String? name;
  final String? avatar;
  final String? birthday;
  final String? description;
  final DegreeEntity? degree;
  final DepartmentEntity? department;
  final SessionOfDayEntity? session_of_day;

  DoctorEntity({
    this.id,
    this.name,
    this.avatar,
    this.birthday,
    this.description,
    this.degree,
    this.department,
    this.session_of_day,
  });
}
