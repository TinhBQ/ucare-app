part of 'session_of_day_bloc.dart';

sealed class SessionOfDayState extends Equatable {
  const SessionOfDayState();

  @override
  List<Object> get props => [];
}

final class SessionOfDayInitial extends SessionOfDayState {}

final class SessionOfDayLoading extends SessionOfDayState {}

final class SessionOfDaySuccess extends SessionOfDayState {
  final String message;
  final SessionOfDayGetItem? sessionOfDayGetItem;
  final OnSessionOfDayEvent onSessionOfDayEvent;
  const SessionOfDaySuccess(
    this.message,
    this.onSessionOfDayEvent, {
    this.sessionOfDayGetItem,
  });
}

final class SessionOfDayFailure extends SessionOfDayState {
  final String message;
  final OnSessionOfDayEvent onSessionOfDayEvent;

  const SessionOfDayFailure(
    this.message,
    this.onSessionOfDayEvent,
  );
}
