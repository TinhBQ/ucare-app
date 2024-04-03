part of 'medicine_schedule_bloc.dart';

sealed class MedicineScheduleState extends Equatable {
  const MedicineScheduleState();

  @override
  List<Object> get props => [];
}

final class MedicineScheduleInitial extends MedicineScheduleState {}

final class MedicineScheduleLoading extends MedicineScheduleState {}

final class MedicineScheduleSuccess extends MedicineScheduleState {
  final String message;
  final OnMedicineSchedule onMedicineSchedule;

  final int checked;

  const MedicineScheduleSuccess(
    this.message,
    this.onMedicineSchedule, {
    this.checked = 0,
  });
}

final class MedicineScheduleFailure extends MedicineScheduleState {
  final String message;
  final OnMedicineSchedule onMedicineSchedule;
  const MedicineScheduleFailure(
    this.message,
    this.onMedicineSchedule,
  );
}
