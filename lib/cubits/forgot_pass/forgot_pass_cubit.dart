import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_advanced_project_fe/repositories/repositories.dart';

part 'forgot_pass_state.dart';

class ForgotPassCubit extends Cubit<ForgotPassState> {
  final AuthRepository _authRepository;

  ForgotPassCubit({
    required AuthRepository authRepository,
  })  : _authRepository = authRepository,
        super(ForgotPassState.initial());
  void codeChanged(String value) {
    emit(
      state.copyWith(
        code: value,
        status: ForgotPassStatus.initial,
      ),
    );
  }

  void newPassChanged(String value) {
    emit(
      state.copyWith(
        newPass: value,
        status: ForgotPassStatus.initial,
      ),
    );
  }

  void confirmPassChanged(String value) {
    emit(
      state.copyWith(
        confirmPass: value,
        status: ForgotPassStatus.initial,
      ),
    );
  }

  Future<void> getForgotPass() async {
    if (state.status == ForgotPassStatus.submitting) return;
    emit(state.copyWith(status: ForgotPassStatus.submitting));
    try {
      final credential = await _authRepository.forgotPass(code: state.code, newPass: state.newPass, confirmPass: state.confirmPass);
      if (credential == true) {
        emit(state.copyWith(status: ForgotPassStatus.success));
      } else {
        emit(state.copyWith(status: ForgotPassStatus.error));
      }
    } catch (_) {
      emit(state.copyWith(status: ForgotPassStatus.error));
    }
  }
}
