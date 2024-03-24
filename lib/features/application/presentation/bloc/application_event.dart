part of 'application_bloc.dart';

sealed class ApplicationEvent extends Equatable {
  const ApplicationEvent();

  @override
  List<Object> get props => [];
}

class TriggerAppEvent extends ApplicationEvent {
  final int index;
  const TriggerAppEvent(this.index) : super();
}
