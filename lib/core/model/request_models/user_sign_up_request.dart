// ignore_for_file: non_constant_identifier_names

class UserSignUpRequest {
  final String email;
  final String phone;
  final String password;
  final String confirm_password;

  UserSignUpRequest({
    required this.email,
    required this.phone,
    required this.password,
    required this.confirm_password,
  });

  Map<String, dynamic> toJson() => {
        "email": email,
        "phone": phone,
        "password": password,
        "confirm_password": confirm_password,
      };
}
