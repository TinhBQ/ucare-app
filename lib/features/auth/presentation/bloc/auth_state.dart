part of 'auth_bloc.dart';

@immutable
sealed class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

final class AuthInitial extends AuthState {}

final class AuthLoading extends AuthState {}

final class AuthSuccess extends AuthState {
  final String message;
  final OnAuthEvent onAuthEvent;

  const AuthSuccess(this.message, this.onAuthEvent);
}

final class AuthFailure extends AuthState {
  final String message;
  final OnAuthEvent onAuthEvent;
  const AuthFailure(this.message, this.onAuthEvent);
}
