import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_advanced_project_fe/core/items/item_dependencies.dart';
import 'package:mobile_advanced_project_fe/core/model/request_models/request_models.dart';

part 'app_patient_state.dart';

class AppPatientCubit extends Cubit<AppPatientState> {
  PatientGetItem? _previouPatientGetItem;

  AppPatientCubit()
      : super(AppPatientInitial(
            baseGetRequestModel: BaseGetRequestModel(
          pageSize: '5',
        )));

  void updatePatient(PatientGetItem? patientGetItem) {
    if (patientGetItem == null) {
      return;
    }

    if (_previouPatientGetItem == null || patientGetItem.currentPage == 1) {
      emit(PatientDataLoaded(
        patientGetItem: patientGetItem,
        baseGetRequestModel: state.baseGetRequestModel,
      ));
    } else {
      emit(
        PatientDataLoaded(
          patientGetItem: _previouPatientGetItem?.copyWithAddRow(
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
      PatientDataLoaded(
        patientGetItem: state.patientGetItem,
        baseGetRequestModel: state.baseGetRequestModel.copyWith(
          currentPage: currentPage,
        ),
      ),
    );
  }
}
