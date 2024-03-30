import 'package:mobile_advanced_project_fe/core/entities/session_of_day_entity.dart';

class SessionOfDayItem extends SessionOfDayEntity {
  SessionOfDayItem({
    required super.id,
    required super.content,
    super.enable = false,
  });

  factory SessionOfDayItem.fromJson(Map<String, dynamic> json) {
    return SessionOfDayItem(
      id: json['id'] ?? '',
      content: json['content'] ?? '',
      enable: json['enable'] ?? false,
    );
  }
}
