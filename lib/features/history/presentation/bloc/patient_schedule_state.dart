part of 'patient_schedule_bloc.dart';

sealed class PatientScheduleState extends Equatable {
  const PatientScheduleState();

  @override
  List<Object> get props => [];
}

final class PatientScheduleInitial extends PatientScheduleState {}

final class PatientScheduleLoading extends PatientScheduleState {}

final class PatientScheduleSuccess extends PatientScheduleState {
  final String message;
  final OnPatientScheduleEvent onPatientScheduleEvent;
  final PatientScheduleGetItem? patientScheduleGetItem;

  const PatientScheduleSuccess(
    this.message,
    this.onPatientScheduleEvent, {
    this.patientScheduleGetItem,
  });
}

final class PatientScheduleFailure extends PatientScheduleState {
  final String message;
  final OnPatientScheduleEvent onPatientScheduleEvent;
  const PatientScheduleFailure(this.message, this.onPatientScheduleEvent);
}
