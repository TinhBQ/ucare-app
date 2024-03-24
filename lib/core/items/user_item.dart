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

  factory UserItem.fromJson(Map<String, dynamic> map) {
    return UserItem(
      user_id: map['user_id'] ?? '',
      user_name: map['user_name'] ?? '',
      email: map['email'] ?? '',
      phone: map['phone'] ?? '',
      birthday: map['birthday'] ?? '',
      male: map['male'] ?? '',
      avatar: map['avatar'] ?? '',
      role: map['role'] ?? '',
    );
  }
}
