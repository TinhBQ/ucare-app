import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_advanced_project_fe/core/common/cubits/app_patient_schedule/app_patient_schedule_cubit.dart';

import 'package:mobile_advanced_project_fe/core/items/item_dependencies.dart';
import 'package:mobile_advanced_project_fe/core/model/request_models/request_models.dart';
import 'package:mobile_advanced_project_fe/core/utils/utils_dependencies.dart';

import '../../domain/usecases/usecases.dart';

part 'patient_schedule_event.dart';
part 'patient_schedule_state.dart';

enum OnPatientScheduleEvent {
  onPatientScheduleGetList,
}

class PatientScheduleBloc
    extends Bloc<PatientScheduleEvent, PatientScheduleState> {
  final UserGetListPatientSchedule _userGetListPatientSchedule;

  final AppPatientScheduleCubit _appPatientScheduleCubit;

  PatientScheduleBloc({
    required UserGetListPatientSchedule userGetListPatientSchedule,
    required AppPatientScheduleCubit appPatientScheduleCubit,
  })  : _userGetListPatientSchedule = userGetListPatientSchedule,
        _appPatientScheduleCubit = appPatientScheduleCubit,
        super(PatientScheduleInitial()) {
    on<PatientScheduleEvent>((_, emit) => emit(PatientScheduleLoading()));
    on<PatientScheduleGetList>(_onPatientScheduleGetList);
  }

  void _onPatientScheduleGetList(
    PatientScheduleGetList event,
    Emitter<PatientScheduleState> emit,
  ) async {
    final res = await _userGetListPatientSchedule(
      BaseGetRequestModel(
        currentPage: event.currentPage,
        pageSize: event.pageSize,
        filters: event.filters,
        sortField: event.sortField,
        sortOrder: event.sortOrder,
      ),
    );

    res.fold(
      (failure) => emit(PatientScheduleFailure(
        failure.message.toString(),
        OnPatientScheduleEvent.onPatientScheduleGetList,
      )),
      (patientGetItem) {
        _appPatientScheduleCubit.updatePatientSchedule(patientGetItem);

        return emit(PatientScheduleSuccess(
          InforMassage.GET_SUCCESS,
          OnPatientScheduleEvent.onPatientScheduleGetList,
        ));
      },
    );
  }
}
