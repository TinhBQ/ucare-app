// import 'package:equatable/equatable.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:mobile_advanced_project_fe/data/repositories/repositories.dart';

// part 'signup_state.dart';

// class SignUpCubit extends Cubit<SignupState> {
//   final AuthRepository _authRepository;

//   SignUpCubit({
//     required AuthRepository authRepository,
//   })  : _authRepository = authRepository,
//         super(SignupState.initial());
//   void emailChanged(String value) {
//     emit(
//       state.copyWith(
//         email: value,
//         status: SignupStatus.initial,
//       ),
//     );
//   }

//   void phoneNumberChanged(String value) {
//     emit(
//       state.copyWith(
//         phoneNumber: value,
//         status: SignupStatus.initial,
//       ),
//     );
//   }

//   void passwordChanged(String value) {
//     emit(
//       state.copyWith(
//         password: value,
//         status: SignupStatus.initial,
//       ),
//     );
//   }

//   void confirmPasswordChanged(String value) {
//     emit(
//       state.copyWith(
//         confirmPassword: value,
//         status: SignupStatus.initial,
//       ),
//     );
//   }

//   Future<void> signup() async {
//     if (state.status == SignupStatus.submitting) return;
//     emit(state.copyWith(status: SignupStatus.submitting));
//     try {
//       final credential = await _authRepository.signup(
//           email: state.email,
//           phoneNumber: state.phoneNumber,
//           password: state.password,
//           confirmPassword: state.confirmPassword);
//       if (credential == true) {
//         emit(state.copyWith(status: SignupStatus.success));
//       } else {
//         emit(state.copyWith(status: SignupStatus.error));
//       }
//     } catch (_) {
//       emit(state.copyWith(status: SignupStatus.error));
//     }
//   }
// }
