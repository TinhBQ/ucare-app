part of 'patient_bloc.dart';

sealed class PatientState extends Equatable {
  const PatientState();

  @override
  List<Object> get props => [];
}

final class PatientInitial extends PatientState {}

final class PatientLoading extends PatientState {}

final class PatientSuccess extends PatientState {
  final String message;
  final OnPatientEvent onPatientEvent;
  final PatientGetItem? patientGetItem;

  const PatientSuccess(
    this.message,
    this.onPatientEvent, {
    this.patientGetItem,
  });
}

final class PatientFailure extends PatientState {
  final String message;
  final OnPatientEvent onPatientEvent;
  const PatientFailure(this.message, this.onPatientEvent);
}
