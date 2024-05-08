import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_advanced_project_fe/core/common/cubits/app_doctor/app_doctor_cubit.dart';
import 'package:mobile_advanced_project_fe/core/items/item_dependencies.dart';
import 'package:mobile_advanced_project_fe/core/model/request_models/request_models.dart';
import 'package:mobile_advanced_project_fe/core/utils/utils_dependencies.dart';

import '../../domain/usecases/user_find_exam_times.dart';

part 'doctor_event.dart';
part 'doctor_state.dart';

enum OnDoctorEvent {
  onDoctorFindExamTimes,
}

class DoctorBloc extends Bloc<DoctorEvent, DoctorState> {
  final UserFindExamTimes _userFindExamTimes;
  final AppDoctorCubit _appDoctorCubit;

  DoctorBloc({
    required UserFindExamTimes userFindExamTimes,
    required AppDoctorCubit appDoctorCubit,
  })  : _userFindExamTimes = userFindExamTimes,
        _appDoctorCubit = appDoctorCubit,
        super(DoctorInitial()) {
    on<DoctorEvent>((_, emit) => emit(DoctorLoading()));
    on<DoctorFindExamTimes>(_onDoctorFindExamTimes);
  }

  void _onDoctorFindExamTimes(
    DoctorFindExamTimes event,
    Emitter<DoctorState> emit,
  ) async {
    final res = await _userFindExamTimes(
      DoctorGetRequestModel(
        currentPage: event.currentPage,
        pageSize: event.pageSize,
        filters: event.filters,
        sortField: event.sortField,
        sortOrder: event.sortOrder,
        user_name: event.user_name,
        session_of_day: event.session_of_day,
      ),
    );

    res.fold(
      (failure) => emit(DoctorFailure(
        failure.message.toString(),
        OnDoctorEvent.onDoctorFindExamTimes,
      )),
      (doctorGetItem) {
        _appDoctorCubit.updateDoctorGetItem(doctorGetItem);
        return emit(DoctorSuccess(
          InforMassage.GET_DOCTOR_SUCCESS,
          OnDoctorEvent.onDoctorFindExamTimes,
          doctorGetItem: doctorGetItem,
        ));
      },
    );
  }
}
