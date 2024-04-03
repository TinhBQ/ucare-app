part of 'medicine_schedule_bloc.dart';

sealed class MedicineScheduleEvent extends Equatable {
  const MedicineScheduleEvent();

  @override
  List<Object> get props => [];
}

final class MedicineScheduleGetList extends MedicineScheduleEvent {}

final class MedicineScheduleUpdateTime extends MedicineScheduleEvent {
  final MedicineSessionItem item;

  const MedicineScheduleUpdateTime({required this.item});
}

final class MedicineScheduleChecked extends MedicineScheduleEvent {
  final MedicineSessionItem item;

  const MedicineScheduleChecked({required this.item});
}
