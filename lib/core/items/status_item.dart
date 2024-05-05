// ignore_for_file: non_constant_identifier_names

import 'package:mobile_advanced_project_fe/core/entities/entities.dart';

class StatusItem extends StatusEntity {
  StatusItem({
    required super.id,
    required super.name,
    super.name_en,
    super.description,
    super.code,
    super.group,
    super.sub_group,
  });

  factory StatusItem.fromJson(Map<String, dynamic> json) {
    return StatusItem(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      name_en: json['name_en'] ?? '',
      description: json['description'] ?? '',
      code: json['code'] ?? '',
      group: json['group'] ?? '',
      sub_group: json['sub_group'] ?? '',
    );
  }
}
