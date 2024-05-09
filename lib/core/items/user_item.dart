// ignore_for_file: non_constant_identifier_names

part of 'item_dependencies.dart';

class UserItem extends UserEntity {
  UserItem({
    required super.user_id,
    super.user_name,
    required super.email,
    required super.phone,
    super.birthday,
    super.male,
    super.avatar,
    super.role,
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
    if (birthday == null || birthday!.isEmpty) {
      return {
        'user_name': user_name,
        'male': male.toString(),
        'avatar': avatar,
      };
    }

    return {
      'user_name': user_name,
      'birthday': birthday!.isEmpty ? null : birthday,
      'male': male.toString(),
      'avatar': avatar,
    };
  }

  UserItem copyWith({
    String? user_id,
    String? user_name,
    String? email,
    String? phone,
    String? birthday,
    bool? male,
    String? avatar,
    String? role,
  }) {
    return UserItem(
      user_id: user_id ?? this.user_id,
      user_name: user_name ?? this.user_name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      birthday: birthday ?? this.birthday,
      male: male ?? this.male,
      avatar: avatar ?? this.avatar,
      role: role ?? this.role,
    );
  }
}
