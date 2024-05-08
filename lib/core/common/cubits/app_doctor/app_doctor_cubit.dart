import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_advanced_project_fe/core/items/item_dependencies.dart';
import 'package:mobile_advanced_project_fe/core/model/request_models/request_models.dart';

part 'app_doctor_state.dart';

class AppDoctorCubit extends Cubit<AppDoctorState> {
  DoctorGetItem? _previousDoctorGetItem;

  AppDoctorCubit()
      : super(AppDoctorInitial(
          doctorGetRequestModel: DoctorGetRequestModel(),
          docterFilerItem: DocterFilerItem(),
        ));

  void updateDoctorGetItem(DoctorGetItem? doctorGetItem) {
    if (doctorGetItem == null) {
      return;
    }

    if (_previousDoctorGetItem == null || doctorGetItem.currentPage == 1) {
      emit(DoctorDataLoaded(
        doctorGetItem: doctorGetItem,
        docterFilerItem: state.docterFilerItem,
        doctorGetRequestModel: state.doctorGetRequestModel,
      ));
    } else {
      emit(
        DoctorDataLoaded(
          doctorGetItem: _previousDoctorGetItem?.copyWithAddRow(
            count: doctorGetItem.count,
            rows: doctorGetItem.rows,
            totalPages: doctorGetItem.totalPages,
            currentPage: doctorGetItem.currentPage,
          ),
          docterFilerItem: state.docterFilerItem,
          doctorGetRequestModel: state.doctorGetRequestModel,
        ),
      );
    }
    _previousDoctorGetItem = doctorGetItem;
  }

  void updateDepartmentFilterItem(DepartmentItem? departmentFilterItem) {
    if (departmentFilterItem == null) {
      return;
    }

    final DocterFilerItem docterFilerItem = state.docterFilerItem.copyWith(
      departmentFilterItem: departmentFilterItem,
    );

    emit(
      DoctorDataLoaded(
        doctorGetItem: state.doctorGetItem,
        docterFilerItem: docterFilerItem,
        doctorGetRequestModel: state.doctorGetRequestModel.copyWith(
          filters: docterFilerItem.strDepartmentFilter(),
          currentPage: '1',
        ),
      ),
    );
  }

  void updateSessionOfDayFilterItem(SessionOfDayItem? sessionOfDayFilterItem) {
    if (sessionOfDayFilterItem == null) {
      return;
    }

    final DocterFilerItem docterFilerItem = state.docterFilerItem.copyWith(
      sessionOfDayFilterItem: sessionOfDayFilterItem,
    );

    emit(
      DoctorDataLoaded(
        doctorGetItem: state.doctorGetItem,
        docterFilerItem: docterFilerItem,
        doctorGetRequestModel: state.doctorGetRequestModel.copyWith(
          session_of_day: docterFilerItem.strSessionOfDayFilter(),
          currentPage: '1',
        ),
      ),
    );
  }

  void updateDoctorSearchName(String? value) {
    if (value == null) {
      return;
    }

    final DocterFilerItem docterFilerItem = state.docterFilerItem.copyWith(
      doctorSearchName: value,
    );

    emit(
      DoctorDataLoaded(
        doctorGetItem: state.doctorGetItem,
        docterFilerItem: docterFilerItem,
        doctorGetRequestModel: state.doctorGetRequestModel.copyWith(
          currentPage: '1',
          user_name: docterFilerItem.strDoctorSearchName(),
        ),
      ),
    );
  }

  void nextPage(String? currentPage) {
    if (currentPage == null) {
      return;
    }
    emit(
      DoctorDataLoaded(
        doctorGetItem: state.doctorGetItem,
        docterFilerItem: state.docterFilerItem,
        doctorGetRequestModel: state.doctorGetRequestModel.copyWith(
          currentPage: currentPage,
        ),
      ),
    );
  }
}
