// ignore_for_file: non_constant_identifier_names

part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

final class AuthSignUp extends AuthEvent {
  final String email;
  final String phone;
  final String password;
  final String confirm_password;

  AuthSignUp({
    required this.email,
    required this.phone,
    required this.password,
    required this.confirm_password,
  });
}

final class AuthLogin extends AuthEvent {
  final String email;
  final String password;

  AuthLogin({
    required this.email,
    required this.password,
  });
}

final class AuthConfirmSignUp extends AuthEvent {
  final String token;

  AuthConfirmSignUp({required this.token});
}

final class AuthCreateOTP extends AuthEvent {
  final String email;

  AuthCreateOTP({this.email = ''});
}

final class AuthForgotPassword extends AuthEvent {
  final String code;
  final String new_pass;
  final String confirm_pass;

  AuthForgotPassword({
    required this.code,
    required this.new_pass,
    required this.confirm_pass,
  });
}
