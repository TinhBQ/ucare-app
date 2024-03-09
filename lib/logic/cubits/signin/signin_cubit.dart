import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_advanced_project_fe/data/repositories/repositories.dart';

part 'signin_state.dart';

class SignInCubit extends Cubit<SigninState> {
  final AuthRepository _authRepository;

  SignInCubit({
    required AuthRepository authRepository,
  })  : _authRepository = authRepository,
        super(SigninState.initial());

  void emailChanged(String value) {
    emit(
      state.copyWith(
        email: value,
        status: SigninStatus.initial,
      ),
    );
  }

  void passwordChanged(String value) {
    emit(
      state.copyWith(
        password: value,
        status: SigninStatus.initial,
      ),
    );
  }

  Future<void> login() async {
    if (state.status == SigninStatus.submitting) return;

    emit(state.copyWith(status: SigninStatus.submitting));

    try {
      final credential = await _authRepository.signin(
          email: state.email, password: state.password);

      if (credential == true) {
        emit(state.copyWith(status: SigninStatus.success));
      } else {
        emit(state.copyWith(status: SigninStatus.error));
      }
    } catch (_) {
      emit(state.copyWith(status: SigninStatus.error));
    }
  }
}
