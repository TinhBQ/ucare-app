part of 'create_OTP_cubit.dart';

enum CreateOTPStatus { initial, submitting, success, error }

class CreateOTPState extends Equatable {
  final String email;
  final CreateOTPStatus status;

  const CreateOTPState({
    required this.email,
    required this.status,
  });

  factory CreateOTPState.initial() {
    return const CreateOTPState(
      email: '',
      status: CreateOTPStatus.initial,
    );
  }

  CreateOTPState copyWith({
    String? email,
    CreateOTPStatus? status,
  }) {
    return CreateOTPState(
      email: email ?? this.email,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [email, status];
}
