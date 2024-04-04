import 'package:mobile_advanced_project_fe/core/entities/entities.dart';

class RoomItem extends RoomEntity {
  RoomItem({
    required super.id,
    required super.name,
  });

  factory RoomItem.fromJson(Map<String, dynamic> json) {
    print('bQT json 8 ${json}');
    return RoomItem(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
    );
  }
}
