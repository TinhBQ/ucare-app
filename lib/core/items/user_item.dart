// ignore_for_file: non_constant_identifier_names

import '../entities/user_entity.dart';

class UserItem extends UserEntity {
  UserItem({
    required super.user_id,
    required super.user_name,
    required super.email,
    required super.phone,
    required super.birthday,
    required super.male,
    required super.avatar,
    required super.role,
  });

  factory UserItem.fromJson(Map<String, dynamic> json) {
    return UserItem(
      user_id: json['user_id'] ?? '',
      user_name: json['user_name'] ?? '',
      email: json['email'] ?? '',
      phone: json['phone'] ?? '',
      birthday: json['birthday'] ?? '',
      male: json['male'] ?? true,
      avatar: json['avatar'] ?? '',
      role: json['role'] ?? '',
    );
  }

  Map<String, dynamic> updateFofileToJson() {
    return {
      'user_name': user_name,
      'birthday': birthday,
      'male': male,
    };
  }
}
