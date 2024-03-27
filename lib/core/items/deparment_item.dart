// ignore_for_file: non_constant_identifier_names

import '../entities/entities.dart';

class DepartmentItem extends DepartmentEntity {
  DepartmentItem({
    required super.id,
    required super.name,
    required super.enable,
    required super.description,
    required super.service_charge,
  });

  factory DepartmentItem.fromJson(Map<String, dynamic> json) {
    return DepartmentItem(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      enable: json['enable'] ?? false,
      description: json['description'] ?? '',
      service_charge: json['service_charge'] ?? '0',
    );
  }
}
