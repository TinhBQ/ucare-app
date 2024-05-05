part of 'medical_profile_bloc.dart';

sealed class MedicalProfileState extends Equatable {
  const MedicalProfileState();

  @override
  List<Object> get props => [];
}

final class MedicalProfileInitial extends MedicalProfileState {}

final class MedicalProfileLoading extends MedicalProfileState {}

final class MedicalProfileSuccess extends MedicalProfileState {
  final String message;
  final OnMedicalProfileEvent onMedicalProfileEvent;
  
  const MedicalProfileSuccess(
    this.message,
    this.onMedicalProfileEvent,
  );
}

final class MedicalProfileFailure extends MedicalProfileState {
  final String message;
  final OnMedicalProfileEvent onMedicalProfileEvent;

  const MedicalProfileFailure(
    this.message,
    this.onMedicalProfileEvent,
  );
}
