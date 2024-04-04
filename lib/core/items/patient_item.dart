// ignore_for_file: non_constant_identifier_names

import 'package:mobile_advanced_project_fe/core/entities/entities.dart';

class PatientItem extends PatientEntity {
  PatientItem({
    required super.id,
    required super.user_id,
    required super.first_name,
    required super.last_name,
    required super.phone,
    required super.email,
    required super.citizen_id,
    required super.birthday,
    required super.male,
    required super.nation,
    required super.ethnicity,
    required super.job,
    required super.province,
    required super.district,
    required super.wards,
    required super.address,
  });

  factory PatientItem.fromJson(Map<String, dynamic> json) {
    print('bQT json 9 ${json}');
    return PatientItem(
      id: json['id'] ?? '',
      user_id: json['user_id'] ?? '',
      first_name: json['first_name'] ?? '',
      last_name: json['last_name'] ?? '',
      phone: json['phone'] ?? '',
      email: json['email'] ?? '',
      citizen_id: json['citizen_ids'] ?? '',
      birthday: json['birthday'] ?? '',
      male: json['male'] ?? false,
      nation: json['nation'] ?? '',
      ethnicity: json['ethnicity'] ?? '',
      job: json['job'] ?? '',
      province: json['province'] ?? '',
      district: json['district'] ?? '',
      wards: json['wards'] ?? '',
      address: json['address'] ?? '',
    );
  }
}
