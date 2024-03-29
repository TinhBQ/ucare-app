import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_advanced_project_fe/core/items/items.dart';
import 'package:mobile_advanced_project_fe/core/model/request_models/request_models.dart';
import 'package:mobile_advanced_project_fe/core/utils/utils.dart';

import '../../domain/usecases/usecases.dart';

part 'department_event.dart';
part 'department_state.dart';

enum OnDepartmentEvent {
  onDepartmentGetList,
}

class DepartmentBloc extends Bloc<DepartmentEvent, DepartmentState> {
  final UserGetListDepartment _userGetListDepartment;

  DepartmentBloc({
    required UserGetListDepartment userGetListDepartment,
  })  : _userGetListDepartment = userGetListDepartment,
        super(DepartmentInitial()) {
    on<DepartmentEvent>((_, emit) => emit(DepartmentLoading()));
    on<DepartmentGetList>(_onDepartmentGetList);
  }

  void _onDepartmentGetList(
    DepartmentGetList event,
    Emitter<DepartmentState> emit,
  ) async {
    final res = await _userGetListDepartment(
      BaseGetRequestModel(
        currentPage: event.currentPage,
        pageSize: event.pageSize,
        filters: event.filters,
        sortField: event.sortField,
        sortOrder: event.sortOrder,
      ),
    );

    res.fold(
      (failure) => emit(DepartmentFailure(
        failure.message.toString(),
        OnDepartmentEvent.onDepartmentGetList,
      )),
      (departmentGetItem) {
        return emit(DepartmentSuccess(
          InforMassage.GET_DEPARTMENTS_SUCCESS,
          OnDepartmentEvent.onDepartmentGetList,
          departmentGetItem: departmentGetItem,
        ));
      },
    );
  }
}
