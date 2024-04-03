part of 'app_patient_schedule_cubit.dart';


sealed class AppPatientScheduleState extends Equatable {
  final PatientScheduleGetItem? patientScheduleGetItem;
  final BaseGetRequestModel baseGetRequestModel;
  const AppPatientScheduleState({
    this.patientScheduleGetItem,
    required this.baseGetRequestModel,
  });

  @override
  List<Object?> get props => [patientScheduleGetItem, baseGetRequestModel];
}

final class AppPatientScheduleInitial extends AppPatientScheduleState {
  const AppPatientScheduleInitial({required super.baseGetRequestModel});

  @override
  List<Object?> get props => [baseGetRequestModel];
}

final class PatientScheduleDataLoaded extends AppPatientScheduleState {
  const PatientScheduleDataLoaded({
    super.patientScheduleGetItem,
    required super.baseGetRequestModel,
  });

  PatientScheduleDataLoaded copyWith({
    PatientScheduleGetItem? patientScheduleGetItem,
    BaseGetRequestModel? baseGetRequestModel,
  }) {
    return PatientScheduleDataLoaded(
      patientScheduleGetItem: patientScheduleGetItem ?? this.patientScheduleGetItem,
      baseGetRequestModel: baseGetRequestModel ?? this.baseGetRequestModel,
    );
  }

  @override
  List<Object?> get props => [patientScheduleGetItem, baseGetRequestModel];
}
