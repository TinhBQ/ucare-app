// ignore_for_file: non_constant_identifier_names

part of './item_dependencies.dart';

class DepartmentItem extends DepartmentEntity {
  DepartmentItem({
    required super.id,
    required super.name,
    super.description = '',
    super.service_charge = 0,
  });

  factory DepartmentItem.fromJson(Map<String, dynamic> json) {
    return DepartmentItem(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      service_charge: convertToInt(json['service_charge']) ?? 0,
    );
  }
}
