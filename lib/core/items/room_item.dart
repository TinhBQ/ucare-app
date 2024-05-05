part of 'item_dependencies.dart';

class RoomItem extends RoomEntity {
  RoomItem({
    required super.id,
    required super.name,
  });

  factory RoomItem.fromJson(Map<String, dynamic> json) {
    return RoomItem(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
    );
  }
}
