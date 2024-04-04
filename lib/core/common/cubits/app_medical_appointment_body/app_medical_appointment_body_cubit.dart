import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_advanced_project_fe/core/items/items.dart';

part 'app_medical_appointment_body_state.dart';

class AppMedicalAppointmentBodyCubit
    extends Cubit<AppMedicalAppointmentBodyState> {
  AppMedicalAppointmentBodyCubit() : super(AppMedicalAppointmentBodyInitial());

  void updatePatientId(String patientId) {
    emit(AppMedicalAppointmentBodyLoaded(
      patientId: patientId,
      departmentItem: null,
      strDate: null,
      numFlow: 0,
    ));
  }

  void updateNumFlow(int numFlow) {
    emit(AppMedicalAppointmentBodyLoaded(
      patientId: state.patientId,
      departmentItem: state.departmentItem,
      strDate: state.strDate,
      numFlow: numFlow,
    ));
  }

  void updateDepartmentItem(
    DepartmentItem departmentItem,
  ) {
    emit(AppMedicalAppointmentBodyLoaded(
      patientId: state.patientId,
      departmentItem: departmentItem,
      strDate: null,
      numFlow: 1,
    ));
  }

  bool updateStrDate(String? strDate) {
    if (strDate == null) return false;

    emit(AppMedicalAppointmentBodyLoaded(
      patientId: state.patientId,
      departmentItem: state.departmentItem,
      strDate: strDate,
      numFlow: 2,
    ));
    return true;
  }
}
