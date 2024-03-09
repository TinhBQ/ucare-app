import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_advanced_project_fe/data/repositories/repositories.dart';

part 'confirm_register_state.dart';

class ConfirmRegisterCubit extends Cubit<ConfirmRegisterState> {
  final AuthRepository _authRepository;

  ConfirmRegisterCubit({
    required AuthRepository authRepository,
  })  : _authRepository = authRepository,
        super(ConfirmRegisterState.initial());
  void codeChanged(String value) {
    emit(
      state.copyWith(
        code: value,
        status: ConfirmRegisterStatus.initial,
      ),
    );
  }

  Future<void> confirmRegister() async {
    if (state.status == ConfirmRegisterStatus.submitting) return;
    emit(state.copyWith(status: ConfirmRegisterStatus.submitting));
    try {
      final credential =
          await _authRepository.confirmRegister(code: state.code);
      if (credential == true) {
        emit(state.copyWith(status: ConfirmRegisterStatus.success));
      } else {
        emit(state.copyWith(status: ConfirmRegisterStatus.error));
      }
    } catch (_) {
      emit(state.copyWith(status: ConfirmRegisterStatus.error));
    }
  }
}
