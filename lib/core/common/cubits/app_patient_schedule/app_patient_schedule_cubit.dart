import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_advanced_project_fe/core/items/item_dependencies.dart';
import 'package:mobile_advanced_project_fe/core/model/request_models/base_get_request_model.dart';

part 'app_patient_schedule_state.dart';

class AppPatientScheduleCubit extends Cubit<AppPatientScheduleState> {
  PatientScheduleGetItem? _previouPatientGetItem;

  AppPatientScheduleCubit()
      : super(AppPatientScheduleInitial(
            baseGetRequestModel: BaseGetRequestModel()));

  void updatePatientSchedule(PatientScheduleGetItem? patientGetItem) {
    if (patientGetItem == null) {
      return;
    }

    if (_previouPatientGetItem == null || patientGetItem.currentPage == 1) {
      emit(PatientScheduleDataLoaded(
        patientScheduleGetItem: patientGetItem,
        baseGetRequestModel: state.baseGetRequestModel,
      ));
    } else {
      emit(
        PatientScheduleDataLoaded(
          patientScheduleGetItem: _previouPatientGetItem?.copyWithAddRow(
            count: patientGetItem.count,
            rows: patientGetItem.rows,
            totalPages: patientGetItem.totalPages,
            currentPage: patientGetItem.currentPage,
          ),
          baseGetRequestModel: state.baseGetRequestModel,
        ),
      );
    }
    _previouPatientGetItem = patientGetItem;
  }

  void nextPage(String? currentPage) {
    if (currentPage == null) {
      return;
    }
    emit(
      PatientScheduleDataLoaded(
        patientScheduleGetItem: state.patientScheduleGetItem,
        baseGetRequestModel: state.baseGetRequestModel.copyWith(
          currentPage: currentPage,
        ),
      ),
    );
  }

  void onChangeStatus(String statusId) {
    emit(
      PatientScheduleDataLoaded(
        patientScheduleGetItem: state.patientScheduleGetItem,
        baseGetRequestModel: state.baseGetRequestModel.copyWith(
          filters: 'status_id==$statusId',
        ),
      ),
    );
  }
}
