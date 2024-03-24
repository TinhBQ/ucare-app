import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'department_state.dart';

class DepartmentCubit extends Cubit<DepartmentState> {
  DepartmentCubit() : super(DepartmentInitial());
}
