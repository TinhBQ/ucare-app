part of 'app_departments_cubit.dart';

sealed class AppDepartmentsState extends Equatable {
  const AppDepartmentsState();

  @override
  List<Object> get props => [];
}

final class AppDepartmentsInitial extends AppDepartmentsState {}
