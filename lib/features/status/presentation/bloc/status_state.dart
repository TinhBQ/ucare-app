part of 'status_bloc.dart';

sealed class StatusState extends Equatable {
  const StatusState();

  @override
  List<Object> get props => [];
}

final class StatusInitial extends StatusState {}

final class StatusLoading extends StatusState {}

final class StatusSuccess extends StatusState {
  final String message;
  final OnStatusEvent onStatusEvent;
  final StatusGetItem? statusGetItem;

  const StatusSuccess(
    this.message,
    this.onStatusEvent, {
    this.statusGetItem,
  });
}

final class StatusFailure extends StatusState {
  final String message;
  final OnStatusEvent onStatusEvent;
  const StatusFailure(this.message, this.onStatusEvent);
}
