import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'app_departments_state.dart';

class AppDepartmentsCubit extends Cubit<AppDepartmentsState> {
  AppDepartmentsCubit() : super(AppDepartmentsInitial());
}
