import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_advanced_project_fe/core/common/cubits/app_patient/app_patient_cubit.dart';
import 'package:mobile_advanced_project_fe/core/items/item_dependencies.dart';
import 'package:mobile_advanced_project_fe/core/model/request_models/request_models.dart';
import 'package:mobile_advanced_project_fe/core/utils/utils_dependencies.dart';

import '../../domain/usecases/usecases.dart';

part 'patient_event.dart';
part 'patient_state.dart';

enum OnPatientEvent {
  onPatientGetList,
  onPatientCreateProfile,
  onPatientBookSchedule,
  onPatientDeleteProfile,
}

class PatientBloc extends Bloc<PatientEvent, PatientState> {
  final UserGetListPatient _userGetListPatient;
  final UserCreatePatientProfile _userCreatePatientProfile;
  final UserPatientBookSchedule _userPatientBookSchedule;
  final UserDeletePatientProfile _userDeletePatientProfile;
  final AppPatientCubit _appPatientCubit;

  PatientBloc({
    required UserGetListPatient userGetListPatient,
    required UserCreatePatientProfile userCreatePatientProfile,
    required UserPatientBookSchedule userPatientBookSchedule,
    required UserDeletePatientProfile userDeletePatientProfile,
    required AppPatientCubit appPatientCubit,
  })  : _userGetListPatient = userGetListPatient,
        _userCreatePatientProfile = userCreatePatientProfile,
        _userPatientBookSchedule = userPatientBookSchedule,
        _userDeletePatientProfile = userDeletePatientProfile,
        _appPatientCubit = appPatientCubit,
        super(PatientInitial()) {
    on<PatientEvent>((_, emit) => emit(PatientLoading()));
    on<PatientGetList>(_onPatientGetList);
    on<PatientCreateProfile>(_onPatientCreateProfile);
    on<PatientBookSchedule>(_onPatientBookSchedule);
    on<PatientDeleteProfile>(_onPatientDeleteProfile);
  }

  void _onPatientGetList(
    PatientGetList event,
    Emitter<PatientState> emit,
  ) async {
    final res = await _userGetListPatient(
      BaseGetRequestModel(
        currentPage: event.currentPage,
        pageSize: event.pageSize,
        filters: event.filters,
        sortField: event.sortField,
        sortOrder: event.sortOrder,
      ),
    );

    res.fold(
      (failure) => emit(PatientFailure(
        failure.message.toString(),
        OnPatientEvent.onPatientGetList,
      )),
      (patientGetItem) {
        _appPatientCubit.updatePatient(patientGetItem);
        return emit(PatientSuccess(
          InforMassage.GET_PATIENT_SUCCESS,
          OnPatientEvent.onPatientGetList,
          patientGetItem: patientGetItem,
        ));
      },
    );
  }

  void _onPatientCreateProfile(
    PatientCreateProfile event,
    Emitter<PatientState> emit,
  ) async {
    final res = await _userCreatePatientProfile(
      CreatePatientRequestModel(
        first_name: event.first_name,
        last_name: event.last_name,
        phone: event.phone,
        email: event.email,
        citizen_id: event.citizen_id,
        birthday: event.birthday,
        male: event.male,
        nation: event.nation,
        job: event.job,
        address: event.address,
        district: event.district,
        ethnicity: event.ethnicity,
        province: event.province,
        wards: event.wards,
      ),
    );
    res.fold(
      (failure) => emit(
        PatientFailure(
          failure.message.toString(),
          OnPatientEvent.onPatientCreateProfile,
        ),
      ),
      (message) => emit(
        PatientSuccess(
          message.toString(),
          OnPatientEvent.onPatientCreateProfile,
        ),
      ),
    );
  }

  void _onPatientBookSchedule(
    PatientBookSchedule event,
    Emitter<PatientState> emit,
  ) async {
    final res = await _userPatientBookSchedule(
      PatientBookScheduleRequestModel(
        schedule_id: event.schedule_id,
        patient_id: event.patient_id,
      ),
    );
    res.fold(
      (failure) => emit(
        PatientFailure(
          failure.message.toString(),
          OnPatientEvent.onPatientBookSchedule,
        ),
      ),
      (message) => emit(
        PatientSuccess(
          message.toString(),
          OnPatientEvent.onPatientBookSchedule,
        ),
      ),
    );
  }

  void _onPatientDeleteProfile(
    PatientDeleteProfile event,
    Emitter<PatientState> emit,
  ) async {
    final res = await _userDeletePatientProfile(
        DeletePatientProfileRequestModel(patient_id: event.patient_id));
    res.fold(
      (failure) => emit(PatientFailure(
          failure.message.toString(), OnPatientEvent.onPatientDeleteProfile)),
      (message) => emit(
        PatientSuccess(
            message.toString(), OnPatientEvent.onPatientDeleteProfile),
      ),
    );
  }
}
