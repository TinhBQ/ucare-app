class UserEntity {
  final String id;
  final String phone;
  final String password;
  final String fullName;
  final String role;
  final String email;
  final String avatar;
  final String birthday;
  final bool male;
  final bool enable;
  final bool active;

  const UserEntity({
    required this.id,
    required this.phone,
    required this.password,
    required this.fullName,
    required this.role,
    required this.email,
    required this.avatar,
    required this.birthday,
    required this.male,
    required this.enable,
    required this.active,
  });
}
