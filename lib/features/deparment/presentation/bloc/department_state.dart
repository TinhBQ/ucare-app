part of 'department_bloc.dart';

sealed class DepartmentState extends Equatable {
  const DepartmentState();

  @override
  List<Object> get props => [];
}

final class DepartmentInitial extends DepartmentState {}

final class DepartmentLoading extends DepartmentState {}

final class DepartmentSuccess extends DepartmentState {
  final String message;
  final OnDepartmentEvent onDepartmentEvent;
  final DepartmentGetItem? departmentGetItem;

  const DepartmentSuccess(
    this.message,
    this.onDepartmentEvent, {
    this.departmentGetItem,
  });
}

final class DepartmentFailure extends DepartmentState {
  final String message;
  final OnDepartmentEvent onDepartmentEvent;
  const DepartmentFailure(this.message, this.onDepartmentEvent);
}
