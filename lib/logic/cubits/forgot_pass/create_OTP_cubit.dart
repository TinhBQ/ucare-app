import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_advanced_project_fe/data/repositories/repositories.dart';

part 'create_OTP_state.dart';

class CreateOTPCubit extends Cubit<CreateOTPState> {
  final AuthRepository _authRepository;

  CreateOTPCubit({
    required AuthRepository authRepository,
  })  : _authRepository = authRepository,
        super(CreateOTPState.initial());
  void emailChanged(String value) {
    emit(
      state.copyWith(
        email: value,
        status: CreateOTPStatus.initial,
      ),
    );
  }

  Future<void> getCreateOTP() async {
    if (state.status == CreateOTPStatus.submitting) return;
    emit(state.copyWith(status: CreateOTPStatus.submitting));
    try {
      final credential = await _authRepository.createOTP(email: state.email);
      if (credential == true) {
        emit(state.copyWith(status: CreateOTPStatus.success));
      } else {
        emit(state.copyWith(status: CreateOTPStatus.error));
      }
    } catch (_) {
      emit(state.copyWith(status: CreateOTPStatus.error));
    }
  }
}
