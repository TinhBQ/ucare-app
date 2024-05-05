// ignore_for_file: non_constant_identifier_names
part of 'item_dependencies.dart';

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
