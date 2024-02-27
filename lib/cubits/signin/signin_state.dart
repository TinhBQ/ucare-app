part of 'signin_cubit.dart';


enum SigninStatus {initial, submitting, success, error}

class SigninState extends Equatable {
  final String phoneNumber;
  final String password;
  final SigninStatus status;

  const SigninState({
    required this.phoneNumber,
    required this.password,
    required this.status,
  });

  factory SigninState.initial() {
    return const SigninState(
      phoneNumber: '',
      password: '',
      status: SigninStatus.initial,
    );
  }

  SigninState copyWith({
    String? phoneNumber,
    String? password,
    SigninStatus? status,
  }){
    return SigninState(
      phoneNumber: phoneNumber ?? this.phoneNumber,
      password: password ?? this.password, 
      status: status ?? this.status,
    );
  }
  @override
  List<Object?> get props => [phoneNumber, password, status];
  
}