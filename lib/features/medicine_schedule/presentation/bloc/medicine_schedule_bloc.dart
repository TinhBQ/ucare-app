import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_advanced_project_fe/core/common/cubits/medicine_sessions/medicine_sessions_cubit.dart';
import 'package:mobile_advanced_project_fe/core/items/item_dependencies.dart';
import 'package:mobile_advanced_project_fe/core/usecase/usecase.dart';

import '../../domain/usecases/usecases.dart';

part 'medicine_schedule_event.dart';
part 'medicine_schedule_state.dart';

enum OnMedicineSchedule {
  onMedicineScheduleGetList,
  onMedicineScheduleUpdateTime,
  onMedicineScheduleChecked
}

class MedicineScheduleBloc
    extends Bloc<MedicineScheduleEvent, MedicineScheduleState> {
  final UserGetMedicineSessionItems _userGetMedicineSessionItems;
  final UserUpdateTimeOfMedicineSession _userUpdateTimeOfMedicineSession;
  final UserTurnOnOfTimeOfMedicineSession _userTurnOnOfTimeOfMedicineSession;

  final MedicineSessionsCubit _medicineSessionsCubit;

  MedicineScheduleBloc({
    required UserGetMedicineSessionItems userGetMedicineSessionItems,
    required UserUpdateTimeOfMedicineSession userUpdateTimeOfMedicineSession,
    required UserTurnOnOfTimeOfMedicineSession
        userTurnOnOfTimeOfMedicineSession,
    required MedicineSessionsCubit medicineSessionsCubit,
  })  : _userGetMedicineSessionItems = userGetMedicineSessionItems,
        _userUpdateTimeOfMedicineSession = userUpdateTimeOfMedicineSession,
        _userTurnOnOfTimeOfMedicineSession = userTurnOnOfTimeOfMedicineSession,
        _medicineSessionsCubit = medicineSessionsCubit,
        super(MedicineScheduleInitial()) {
    on<MedicineScheduleEvent>((_, emit) => emit(MedicineScheduleLoading()));
    on<MedicineScheduleGetList>(_onMedicineScheduleGetList);
    on<MedicineScheduleUpdateTime>(_onMedicineScheduleUpdateTime);
    on<MedicineScheduleChecked>(_onMedicineScheduleChecked);
  }

  void _onMedicineScheduleGetList(
    MedicineScheduleGetList event,
    Emitter<MedicineScheduleState> emit,
  ) async {
    final res = await _userGetMedicineSessionItems(NoParams());
    res.fold(
      (failure) => emit(MedicineScheduleFailure(
        failure.message.toString(),
        OnMedicineSchedule.onMedicineScheduleGetList,
      )),
      (medicineSessions) {
        _medicineSessionsCubit.updateMedicineSessions(medicineSessions);
        return emit(const MedicineScheduleSuccess(
          'slsllsl',
          OnMedicineSchedule.onMedicineScheduleGetList,
        ));
      },
    );
  }

  void _onMedicineScheduleUpdateTime(
    MedicineScheduleUpdateTime event,
    Emitter<MedicineScheduleState> emit,
  ) async {
    final res = await _userUpdateTimeOfMedicineSession(event.item);
    res.fold(
      (failure) => emit(MedicineScheduleFailure(
        failure.message.toString(),
        OnMedicineSchedule.onMedicineScheduleUpdateTime,
      )),
      (message) {
        return emit(MedicineScheduleSuccess(
          message,
          OnMedicineSchedule.onMedicineScheduleUpdateTime,
        ));
      },
    );
  }

  void _onMedicineScheduleChecked(
    MedicineScheduleChecked event,
    Emitter<MedicineScheduleState> emit,
  ) async {
    final res = await _userTurnOnOfTimeOfMedicineSession(event.item);
    res.fold(
      (failure) => emit(MedicineScheduleFailure(
        failure.message.toString(),
        OnMedicineSchedule.onMedicineScheduleChecked,
      )),
      (checked) {
        return emit(
          MedicineScheduleSuccess(
            '',
            OnMedicineSchedule.onMedicineScheduleChecked,
            checked: checked,
          ),
        );
      },
    );
  }
}
