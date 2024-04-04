import 'package:mobile_advanced_project_fe/core/entities/entities.dart';

class StatusItem extends StatusEntity {
  StatusItem({required super.id, required super.name});

  factory StatusItem.fromJson(Map<String, dynamic> json) {
    print('bQT json 10 ${json}');
    return StatusItem(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
    );
  }
}
