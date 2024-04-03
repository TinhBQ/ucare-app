// ignore_for_file: non_constant_identifier_names

class UserEntity {
  final String user_id;
  final String? user_name;
  final String email;
  final String phone;
  final String? birthday;
  final bool? male;
  final String? avatar;
  final String? role;

  UserEntity({
    required this.user_id,
    this.user_name,
    required this.email,
    required this.phone,
    this.birthday,
    this.male,
    this.avatar,
    this.role,
  });
}
