import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_advanced_project_fe/core/items/items.dart';
import 'package:mobile_advanced_project_fe/core/model/request_models/request_models.dart';
import 'package:mobile_advanced_project_fe/core/utils/utils.dart';
import 'package:mobile_advanced_project_fe/features/find_exam_times/domain/usecases/user_get_list_departmet.dart';

part 'find_exam_times_event.dart';
part 'find_exam_times_state.dart';

enum OnFindExamTimesEvent {
  onFindExamTimesGetDepartments,
}

class FindExamTimesBloc extends Bloc<FindExamTimesEvent, FindExamTimesState> {
  final UserGetListDepartment _userGetListDepartment;

  FindExamTimesBloc({
    required UserGetListDepartment userGetListDepartment,
  })  : _userGetListDepartment = userGetListDepartment,
        super(FindExamTimesInitial()) {
    on<FindExamTimesEvent>((_, emit) => emit(FindExamTimesLoading()));
    on<FindExamTimesGetDepartments>(_onFindExamTimesGetDepartments);
  }

  void _onFindExamTimesGetDepartments(
    FindExamTimesGetDepartments event,
    Emitter<FindExamTimesState> emit,
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
      (failure) => emit(FindExamTimesFailure(
        failure.message.toString(),
        OnFindExamTimesEvent.onFindExamTimesGetDepartments,
      )),
      (departmentGetItem) {
        return emit(FindExamTimesSuccess(
          InforMassage.GET_DEPARTMENTS_SUCCESS,
          OnFindExamTimesEvent.onFindExamTimesGetDepartments,
          departmentGetItem: departmentGetItem,
        ));
      },
    );
  }
}
