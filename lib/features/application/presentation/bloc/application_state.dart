part of 'application_bloc.dart';

sealed class ApplicationState extends Equatable {
  final int index;
  const ApplicationState({this.index = 0});

  @override
  List<Object> get props => [index];
}

final class ApplicationInitial extends ApplicationState {}

final class ApplicationChangeIndex extends ApplicationState {
  const ApplicationChangeIndex({super.index});
}
