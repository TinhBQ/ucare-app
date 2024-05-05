part of 'item_dependencies.dart';

class SessionOfDayItem extends SessionOfDayEntity {
  SessionOfDayItem({
    required super.id,
    required super.content,
  });

  factory SessionOfDayItem.fromJson(Map<String, dynamic> json) {
    return SessionOfDayItem(
      id: json['id'] ?? '',
      content: json['content'] ?? '',
    );
  }
}
