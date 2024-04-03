part of 'app_medical_appointment_body_cubit.dart';

sealed class AppMedicalAppointmentBodyState extends Equatable {
  final String? patientId;
  final DepartmentItem? departmentItem;
  final String? strDate;
  final int numFlow;
  const AppMedicalAppointmentBodyState({
    this.patientId,
    this.departmentItem,
    this.strDate,
    this.numFlow = 0,
  });

  @override
  List<Object?> get props => [patientId, departmentItem, strDate, numFlow];
}

final class AppMedicalAppointmentBodyInitial
    extends AppMedicalAppointmentBodyState {}

final class AppMedicalAppointmentBodyLoaded
    extends AppMedicalAppointmentBodyState {
  const AppMedicalAppointmentBodyLoaded({
    super.patientId,
    super.departmentItem,
    super.strDate,
    super.numFlow,
  });

  AppMedicalAppointmentBodyLoaded copyWith({
    String? patientId,
    DepartmentItem? departmentItem,
    String? strDate,
    int? numFlow,
  }) {
    return AppMedicalAppointmentBodyLoaded(
      patientId: patientId ?? this.patientId,
      departmentItem: departmentItem ?? this.departmentItem,
      strDate: strDate ?? this.strDate,
      numFlow: numFlow ?? this.numFlow,
    );
  }

  @override
  List<Object?> get props => [patientId, departmentItem, strDate, numFlow];
}
