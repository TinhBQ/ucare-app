// ignore_for_file: non_constant_identifier_names

import 'package:mobile_advanced_project_fe/core/entities/doctor_entity.dart';

import 'degree_item.dart';
import 'deparment_item.dart';
import 'session_of_day_item.dart';

class DoctorItem extends DoctorEntity {
  DoctorItem({
    required super.id,
    required super.name,
    required super.avatar,
    required super.birthday,
    required super.description,
    required super.degree,
    required super.department,
    required super.session_of_day,
    required super.enable,
  });

  factory DoctorItem.fromJson(Map<String, dynamic> json) {
    return DoctorItem(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      avatar: json['avatar'] ?? '',
      birthday: json['birthday'] ?? '',
      description: json['description'] ?? '',
      degree: DegreeItem.fromJson(json['degree']),
      department: DepartmentItem.fromJson(json['department']),
      session_of_day: SessionOfDayItem.fromJson(json['session_of_day']),
      enable: json['enable'] ?? false,
    );
  }
}
