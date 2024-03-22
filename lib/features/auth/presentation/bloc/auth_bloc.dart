import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_advanced_project_fe/core/model/request_models/request_models.dart';
import 'package:mobile_advanced_project_fe/features/auth/domain/usecases/usecases.dart';
import 'package:mobile_advanced_project_fe/features/auth/domain/usecases/user_forgot_password.dart';

part 'auth_event.dart';
part 'auth_state.dart';

enum OnAuthEvent {
  onAuthSignUp,
  onAuthLogin,
  onAuthConfirmSignUp,
  onAuthCreateOTP,
  onAuthForgotPassword,
}

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final UserLogin _userLogin;
  final UserSignUp _userSignUp;
  final UserConfirmSignUp _userConfirmSignUp;
  final UserCreateOTP _userCreateOTP;
  final UserForgotPassword _userForgotPassword;

  AuthBloc({
    required UserLogin userLogin,
    required UserSignUp userSignUp,
    required UserConfirmSignUp userConfirmSignUp,
    required UserCreateOTP userCreateOTP,
    required UserForgotPassword userForgotPassword,
  })  : _userLogin = userLogin,
        _userSignUp = userSignUp,
        _userConfirmSignUp = userConfirmSignUp,
        _userCreateOTP = userCreateOTP,
        _userForgotPassword = userForgotPassword,
        super(AuthInitial()) {
    on<AuthEvent>((_, emit) => emit(AuthLoading()));
    on<AuthLogin>(_onAuthLogin);
    on<AuthSignUp>(_onAuthSignUp);
    on<AuthConfirmSignUp>(_onAuthConfirmSignUp);
    on<AuthCreateOTP>(_onAuthCreateOTP);
    on<AuthForgotPassword>(_onAuthForgotPassword);
  }

  void _onAuthLogin(
    AuthLogin event,
    Emitter<AuthState> emit,
  ) async {
    final res = await _userLogin(
      UserLoginRequest(
        email: event.email,
        password: event.password,
      ),
    );

    res.fold(
      (failure) => emit(AuthFailure(failure.message.toString())),
      (massage) => emit(AuthSuccess(
        massage.toString(),
        OnAuthEvent.onAuthLogin,
      )),
    );
  }

  void _onAuthSignUp(
    AuthSignUp event,
    Emitter<AuthState> emit,
  ) async {
    final res = await _userSignUp(
      UserSignUpRequest(
        email: event.email,
        phone: event.phone,
        password: event.password,
        confirm_password: event.confirm_password,
      ),
    );

    res.fold(
      (failure) => emit(AuthFailure(failure.message.toString())),
      (massage) => emit(AuthSuccess(
        massage.toString(),
        OnAuthEvent.onAuthSignUp,
      )),
    );
  }

  void _onAuthConfirmSignUp(
    AuthConfirmSignUp event,
    Emitter<AuthState> emit,
  ) async {
    final res = await _userConfirmSignUp(
      ConfirmRegisterRequest(token: event.token),
    );

    res.fold(
      (failure) => emit(AuthFailure(failure.message.toString())),
      (massage) => emit(AuthSuccess(
        massage.toString(),
        OnAuthEvent.onAuthConfirmSignUp,
      )),
    );
  }

  void _onAuthCreateOTP(
    AuthCreateOTP event,
    Emitter<AuthState> emit,
  ) async {
    final res = await _userCreateOTP(CreateOTPRequest(email: event.email));

    res.fold(
      (failure) => emit(AuthFailure(failure.message.toString())),
      (massage) => emit(AuthSuccess(
        massage.toString(),
        OnAuthEvent.onAuthCreateOTP,
      )),
    );
  }

  void _onAuthForgotPassword(
    AuthForgotPassword event,
    Emitter<AuthState> emit,
  ) async {
    final res = await _userForgotPassword(ForgotPasswordRequest(
      code: event.code,
      new_pass: event.new_pass,
      confirm_pass: event.new_pass,
    ));

    res.fold(
      (failure) => emit(AuthFailure(failure.message.toString())),
      (massage) => emit(AuthSuccess(
        massage.toString(),
        OnAuthEvent.onAuthForgotPassword,
      )),
    );
  }
}
