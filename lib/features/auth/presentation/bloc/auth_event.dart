// ignore_for_file: non_constant_identifier_names

part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

final class AuthSignUp extends AuthEvent {
  final String email;
  final String phone;
  final String password;
  final String confirm_password;

  const AuthSignUp({
    required this.email,
    required this.phone,
    required this.password,
    required this.confirm_password,
  });
}

final class AuthLogin extends AuthEvent {
  final String email;
  final String password;

  const AuthLogin({
    required this.email,
    required this.password,
  });
}

final class AuthConfirmSignUp extends AuthEvent {
  final String token;

  const AuthConfirmSignUp({required this.token});
}

final class AuthCreateOTP extends AuthEvent {
  final String email;

  const AuthCreateOTP({this.email = ''});
}

final class AuthForgotPassword extends AuthEvent {
  final String code;
  final String new_pass;
  final String confirm_pass;

  const AuthForgotPassword({
    required this.code,
    required this.new_pass,
    required this.confirm_pass,
  });
}

final class AuthLogout extends AuthEvent {}

final class AuthUserLoggedIn extends AuthEvent {}
