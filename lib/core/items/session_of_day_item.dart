import 'package:mobile_advanced_project_fe/core/entities/session_of_day_entity.dart';

class SessionOfDayItem extends SessionOfDayEntity {
  SessionOfDayItem({
    required super.id,
    required super.content,
  });

  factory SessionOfDayItem.fromJson(Map<String, dynamic> json) {
    print('bQT json 7 ${json}');
    return SessionOfDayItem(
      id: json['id'] ?? '',
      content: json['content'] ?? '',
    );
  }
}
