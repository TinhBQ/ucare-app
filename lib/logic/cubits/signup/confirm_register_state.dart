part of 'confirm_register_cubit.dart';

enum ConfirmRegisterStatus { initial, submitting, success, error }

class ConfirmRegisterState extends Equatable {
  final String code;
  final ConfirmRegisterStatus status;

  const ConfirmRegisterState({
    required this.code,
    required this.status,
  });

  factory ConfirmRegisterState.initial() {
    return const ConfirmRegisterState(
      code: '',
      status: ConfirmRegisterStatus.initial,
    );
  }

  ConfirmRegisterState copyWith({
    String? code,
    ConfirmRegisterStatus? status,
  }) {
    return ConfirmRegisterState(
      code: code ?? this.code,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props =>
      [code, status];
}
