import '../../entities/user_entity.dart';

class UserResponseModel extends UserEntity {
  UserResponseModel({
    required super.id,
    required super.phone,
    required super.password,
    required super.fullName,
    required super.role,
    required super.email,
    required super.avatar,
    required super.birthday,
    required super.male,
    required super.enable,
    required super.active,
  });

  factory UserResponseModel.fromJson(Map<String, dynamic> map) {
    return UserResponseModel(
      id: map['id'] ?? '',
      phone: map['email'] ?? '',
      password: map['password'] ?? '',
      fullName: map['fullName'] ?? '',
      role: map['role'] ?? '',
      email: map['email'] ?? '',
      avatar: map['avatar'] ?? '',
      birthday: map['birthday'] ?? '',
      male: map['male'] ?? '',
      enable: map['enable'] ?? '',
      active: map['active'] ?? '',
    );
  }

  UserResponseModel copyWith({
    String? id,
    String? phone,
    String? password,
    String? fullName,
    String? role,
    String? email,
    String? avatar,
    String? birthday,
    bool? male,
    bool? enable,
    bool? active,
  }) {
    return UserResponseModel(
      id: id ?? this.id,
      phone: phone ?? this.phone,
      password: password ?? this.password,
      fullName: fullName ?? this.fullName,
      role: role ?? this.role,
      email: email ?? this.email,
      avatar: avatar ?? this.avatar,
      birthday: birthday ?? this.birthday,
      male: male ?? this.male,
      enable: enable ?? this.enable,
      active: active ?? this.active,
    );
  }
}
