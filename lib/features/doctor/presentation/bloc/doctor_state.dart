part of 'doctor_bloc.dart';

sealed class DoctorState extends Equatable {
  const DoctorState();

  @override
  List<Object> get props => [];
}

final class DoctorInitial extends DoctorState {}

final class DoctorLoading extends DoctorState {}

final class DoctorSuccess extends DoctorState {
  final String message;
  final OnDoctorEvent onDoctorEvent;
  final DoctorGetItem? doctorGetItem;

  const DoctorSuccess(
    this.message,
    this.onDoctorEvent, {
    this.doctorGetItem,
  });
}

final class DoctorFailure extends DoctorState {
  final String message;
  final OnDoctorEvent onDoctorEvent;
  const DoctorFailure(this.message, this.onDoctorEvent);
}
