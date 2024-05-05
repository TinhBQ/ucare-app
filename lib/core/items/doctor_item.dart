// ignore_for_file: non_constant_identifier_names

import 'package:mobile_advanced_project_fe/core/entities/doctor_entity.dart';

import 'degree_item.dart';
import 'deparment_item.dart';
import 'session_of_day_item.dart';

class DoctorItem extends DoctorEntity {
  DoctorItem({
    super.id,
    super.name,
    super.avatar,
    super.birthday,
    super.description,
    super.degree,
    super.department,
    super.session_of_day,
  });

  factory DoctorItem.fromJson(Map<String, dynamic> json) {
    return DoctorItem(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      avatar: json['avatar'] ?? '',
      birthday: json['birthday'] ?? '',
      description: json['description'] ?? '',
      degree:
          json['degree'] != null ? DegreeItem.fromJson(json['degree']) : null,
      department: json['department'] != null
          ? DepartmentItem.fromJson(json['department'])
          : null,
      session_of_day: json['session_of_day'] != null
          ? SessionOfDayItem.fromJson(json['session_of_day'])
          : null,
    );
  }
}
