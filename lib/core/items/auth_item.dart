part of './item_dependencies.dart';

class AuthItem {
  final String accessToken;
  final String refreshToken;

  AuthItem({
    required this.accessToken,
    required this.refreshToken,
  });

  factory AuthItem.fromJson(Map<String, dynamic> json) => AuthItem(
        accessToken: json["accessToken"] ?? '',
        refreshToken: json["refreshToken"] ?? '',
      );
}
