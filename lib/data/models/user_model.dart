import 'package:equatable/equatable.dart';

class User extends Equatable {
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

  const User({
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

  @override
  List<Object?> get props => [
        id,
        phone,
        password,
        fullName,
        role,
        email,
        avatar,
        birthday,
        male,
        enable,
        active,
      ];
}
