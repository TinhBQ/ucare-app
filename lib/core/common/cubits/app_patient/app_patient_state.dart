part of 'app_patient_cubit.dart';

sealed class AppPatientState extends Equatable {
  final PatientGetItem? patientGetItem;
  final BaseGetRequestModel baseGetRequestModel;
  const AppPatientState({
    this.patientGetItem,
    required this.baseGetRequestModel,
  });

  @override
  List<Object?> get props => [patientGetItem, baseGetRequestModel];
}

final class AppPatientInitial extends AppPatientState {
  const AppPatientInitial({
    required super.baseGetRequestModel,
  });

  @override
  List<Object?> get props => [baseGetRequestModel];
}

final class PatientDataLoaded extends AppPatientState {
  const PatientDataLoaded({
    super.patientGetItem,
    required super.baseGetRequestModel,
  });

  PatientDataLoaded copyWith({
    PatientGetItem? patientGetItem,
    BaseGetRequestModel? baseGetRequestModel,
  }) {
    return PatientDataLoaded(
      patientGetItem: patientGetItem ?? this.patientGetItem,
      baseGetRequestModel: baseGetRequestModel ?? this.baseGetRequestModel,
    );
  }

  @override
  List<Object?> get props => [patientGetItem, baseGetRequestModel];
}
