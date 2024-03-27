import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_advanced_project_fe/core/common/cubits/app_user/app_user_cubit.dart';
import 'package:mobile_advanced_project_fe/core/items/items.dart';
import 'package:mobile_advanced_project_fe/core/model/request_models/auth_request_models/auth_request_models.dart';
import 'package:mobile_advanced_project_fe/core/model/request_models/request_models.dart';
import 'package:mobile_advanced_project_fe/core/usecase/usecase.dart';
import 'package:mobile_advanced_project_fe/core/utils/infor_massage.dart';
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
  onAuthLogout,
  onAuthUserLoggedIn,
}

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final UserLogin _userLogin;
  final UserSignUp _userSignUp;
  final UserConfirmSignUp _userConfirmSignUp;
  final UserCreateOTP _userCreateOTP;
  final UserForgotPassword _userForgotPassword;
  final CurrentUser _currentUser;
  final UserLogout _userLogout;

  final AppUserCubit _appUserCubit;

  AuthBloc({
    required UserLogin userLogin,
    required UserSignUp userSignUp,
    required UserConfirmSignUp userConfirmSignUp,
    required UserCreateOTP userCreateOTP,
    required UserForgotPassword userForgotPassword,
    required CurrentUser currentUser,
    required UserLogout userLogout,
    required AppUserCubit appUserCubit,
  })  : _userLogin = userLogin,
        _userSignUp = userSignUp,
        _userConfirmSignUp = userConfirmSignUp,
        _userCreateOTP = userCreateOTP,
        _userForgotPassword = userForgotPassword,
        _currentUser = currentUser,
        _userLogout = userLogout,
        _appUserCubit = appUserCubit,
        super(AuthInitial()) {
    on<AuthEvent>((_, emit) => emit(AuthLoading()));
    on<AuthLogin>(_onAuthLogin);
    on<AuthSignUp>(_onAuthSignUp);
    on<AuthConfirmSignUp>(_onAuthConfirmSignUp);
    on<AuthCreateOTP>(_onAuthCreateOTP);
    on<AuthForgotPassword>(_onAuthForgotPassword);
    on<AuthLogout>(_onAuthLogout);
    on<AuthUserLoggedIn>(_onAuthUserLoggedIn);
  }

  void _onAuthLogin(
    AuthLogin event,
    Emitter<AuthState> emit,
  ) async {
    final res = await _userLogin(
      UserLoginRequestModel(
        email: event.email,
        password: event.password,
      ),
    );

    res.fold(
      (failure) => emit(AuthFailure(
        failure.message.toString(),
        OnAuthEvent.onAuthLogin,
      )),
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
      UserSignUpRequestModel(
        email: event.email,
        phone: event.phone,
        password: event.password,
        confirm_password: event.confirm_password,
      ),
    );

    res.fold(
      (failure) => emit(AuthFailure(
        failure.message.toString(),
        OnAuthEvent.onAuthSignUp,
      )),
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
      ConfirmRegisterRequestModel(token: event.token),
    );

    res.fold(
      (failure) => emit(AuthFailure(
        failure.message.toString(),
        OnAuthEvent.onAuthConfirmSignUp,
      )),
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
    final res = await _userCreateOTP(CreateOTPRequestModel(email: event.email));

    res.fold(
      (failure) => emit(AuthFailure(
        failure.message.toString(),
        OnAuthEvent.onAuthCreateOTP,
      )),
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
    final res = await _userForgotPassword(ForgotPasswordRequestModel(
      code: event.code,
      new_pass: event.new_pass,
      confirm_pass: event.new_pass,
    ));

    res.fold(
      (failure) => emit(AuthFailure(
        failure.message.toString(),
        OnAuthEvent.onAuthForgotPassword,
      )),
      (massage) => emit(AuthSuccess(
        massage.toString(),
        OnAuthEvent.onAuthForgotPassword,
      )),
    );
  }

  void _onAuthUserLoggedIn(
    AuthUserLoggedIn event,
    Emitter<AuthState> emit,
  ) async {
    final res = await _currentUser(NoParams());

    res.fold(
      (l) => emit(AuthFailure(
        l.message,
        OnAuthEvent.onAuthUserLoggedIn,
      )),
      (r) => _emitAuthSuccess(
        r,
        emit,
        InforMassage.GET_INFO_SUCCESS,
        OnAuthEvent.onAuthUserLoggedIn,
      ),
    );
  }

  void _onAuthLogout(
    AuthLogout event,
    Emitter<AuthState> emit,
  ) async {
    final res = await _userLogout(NoParams());

    res.fold(
      (failure) => emit(AuthFailure(
        failure.message.toString(),
        OnAuthEvent.onAuthLogout,
      )),
      (massage) {
        _appUserCubit.updateUser(null);
        return emit(AuthSuccess(
          massage.toString(),
          OnAuthEvent.onAuthLogout,
        ));
      },
    );
  }

  void _emitAuthSuccess(
    UserItem? userItem,
    Emitter<AuthState> emit,
    String massage,
    OnAuthEvent onAuthEvent,
  ) {
    _appUserCubit.updateUser(userItem);
    emit(
      AuthSuccess(massage, onAuthEvent),
    );
  }
}
