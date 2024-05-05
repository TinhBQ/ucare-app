part of 'schedule_bloc.dart';

sealed class ScheduleState extends Equatable {
  const ScheduleState();

  @override
  List<Object> get props => [];
}

final class ScheduleInitial extends ScheduleState {}

final class ScheduleLoading extends ScheduleState {}

final class ScheduleSuccess extends ScheduleState {
  final String message;
  final OnScheduleEvent onScheduleEvent;
  final ScheduleGetItem? scheduleGetItem;

  const ScheduleSuccess(
    this.message,
    this.onScheduleEvent, {
    this.scheduleGetItem,
  });
}

final class ScheduleFailure extends ScheduleState {
  final String message;
  final OnScheduleEvent onScheduleEvent;
  const ScheduleFailure(this.message, this.onScheduleEvent);
}
