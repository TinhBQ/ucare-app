import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_advanced_project_fe/data/repositories/repositories.dart';
part 'auth_state.dart';

part 'auth_event.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository _authRepository;

  AuthBloc({
    required AuthRepository authRepository,
  })  : _authRepository = authRepository,
        super(AuthInitial()) {
    on<AuthEventStarted>(_onAuthEventStarted);
    on<AuthEventChanged>(_onAuthEventChanged);
    on<AuthEventLoggedOut>(_onAuthEventLoggedOut);
  }

  void _onAuthEventStarted(
      AuthEventStarted event, Emitter<AuthState> emit) async {
    final isLoggined = await _authRepository.isLoggined();
    if (isLoggined) {
      add(AuthEventChanged(isLoggined));
    } else {
      add(const AuthEventChanged(null));
    }
  }

  void _onAuthEventChanged(
      AuthEventChanged event, Emitter<AuthState> emit) async {
    if (event.authUser == true) {
      emit(AuthenticateState(authUser: event.authUser));
    } else {
      emit(UnAuthenticateState());
    }
  }

  void _onAuthEventLoggedOut(
      AuthEventLoggedOut event, Emitter<AuthState> emit) async {
    await _authRepository.signOut();
    add(AuthEventStarted());
  }
}