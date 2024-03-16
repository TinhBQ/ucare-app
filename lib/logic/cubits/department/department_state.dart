part of 'department_cubit.dart';

enum DepartmentStatus { initial, submitting, success, error }

sealed class DepartmentState extends Equatable {
  const DepartmentState();

  @override
  List<Object> get props => [];
}

final class DepartmentInitial extends DepartmentState {}
