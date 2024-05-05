import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_advanced_project_fe/core/items/item_dependencies.dart';
import 'package:mobile_advanced_project_fe/core/model/request_models/request_models.dart';

import '../../domain/usecases/usecases.dart';

part 'schedule_event.dart';
part 'schedule_state.dart';

enum OnScheduleEvent {
  onScheduleGetList,
}

class ScheduleBloc extends Bloc<ScheduleEvent, ScheduleState> {
  final UserGetSchedule _userGetSchedule;

  ScheduleBloc({
    required UserGetSchedule userGetSchedule,
  })  : _userGetSchedule = userGetSchedule,
        super(ScheduleInitial()) {
    on<ScheduleEvent>((_, emit) => emit(ScheduleLoading()));
    on<ScheduleGetList>(_onScheduleGetList);
  }

  void _onScheduleGetList(
    ScheduleGetList event,
    Emitter<ScheduleState> emit,
  ) async {
    final res = await _userGetSchedule(
      ScheduleGetRequestModel(
        currentPage: event.currentPage,
        pageSize: event.pageSize,
        filters: event.filters,
        sortField: event.sortField,
        sortOrder: event.sortOrder,
        department_id: event.department_id,
      ),
    );

    res.fold(
      (failure) => emit(ScheduleFailure(
        failure.message.toString(),
        OnScheduleEvent.onScheduleGetList,
      )),
      (scheduleGetItem) {
        // _appDoctorCubit.updateDoctorGetItem(doctorGetItem);
        return emit(ScheduleSuccess(
          'Lấy thành công',
          OnScheduleEvent.onScheduleGetList,
          scheduleGetItem: scheduleGetItem,
        ));
      },
    );
  }
}
