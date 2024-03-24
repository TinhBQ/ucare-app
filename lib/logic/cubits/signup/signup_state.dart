// part of 'signup_cubit.dart';

// enum SignupStatus { initial, submitting, success, error }

// class SignupState extends Equatable {
//   final String email;
//   final String phoneNumber;
//   final String password;
//   final String confirmPassword;
//   final SignupStatus status;

//   const SignupState({
//     required this.email,
//     required this.phoneNumber,
//     required this.password,
//     required this.confirmPassword,
//     required this.status,
//   });

//   factory SignupState.initial() {
//     return const SignupState(
//       email: '',
//       phoneNumber: '',
//       password: '',
//       confirmPassword: '',
//       status: SignupStatus.initial,
//     );
//   }

//   SignupState copyWith({
//     String? email,
//     String? phoneNumber,
//     String? password,
//     String? confirmPassword,
//     SignupStatus? status,
//   }) {
//     return SignupState(
//       email: email ?? this.email,
//       phoneNumber: phoneNumber ?? this.phoneNumber,
//       password: password ?? this.password,
//       confirmPassword: confirmPassword ?? this.confirmPassword,
//       status: status ?? this.status,
//     );
//   }

//   @override
//   List<Object?> get props =>
//       [email, phoneNumber, password, confirmPassword, status];
// }
