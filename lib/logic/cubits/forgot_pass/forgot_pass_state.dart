// part of 'forgot_pass_cubit.dart';

// enum ForgotPassStatus { initial, submitting, success, error }

// class ForgotPassState extends Equatable {
//   final String code;
//   final String newPass;
//   final String confirmPass;
//   final ForgotPassStatus status;

//   const ForgotPassState({
//     required this.code,
//     required this.newPass,
//     required this.confirmPass,
//     required this.status,
//   });

//   factory ForgotPassState.initial() {
//     return const ForgotPassState(
//       code: '',
//       newPass: '',
//       confirmPass: '',
//       status: ForgotPassStatus.initial,
//     );
//   }

//   ForgotPassState copyWith({
//     String? code,
//     String? newPass,
//     String? confirmPass,
//     ForgotPassStatus? status,
//   }) {
//     return ForgotPassState(
//       code: code ?? this.code,
//       newPass: newPass ?? this.newPass,
//       confirmPass: confirmPass ?? this.confirmPass,
//       status: status ?? this.status,
//     );
//   }

//   @override
//   List<Object?> get props => [code, newPass, confirmPass, status];
// }
