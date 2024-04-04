import 'package:mobile_advanced_project_fe/core/entities/degree_entity.dart';

class DegreeItem extends DegreeEntity {
  DegreeItem({
    required super.id,
    required super.name,
  });

  factory DegreeItem.fromJson(Map<String, dynamic> json) {
    return DegreeItem(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
    );
  }
}
