part of 'app_doctor_cubit.dart';

class AppDoctorState extends Equatable {
  final DoctorGetItem? doctorGetItem;
  final DocterFilerItem docterFilerItem;
  final DoctorGetRequestModel doctorGetRequestModel;

  const AppDoctorState({
    this.doctorGetItem,
    required this.docterFilerItem,
    required this.doctorGetRequestModel,
  });

  @override
  List<Object?> get props => [
        doctorGetItem,
        docterFilerItem,
        doctorGetRequestModel,
      ];
}

final class AppDoctorInitial extends AppDoctorState {
  const AppDoctorInitial({
    required super.doctorGetRequestModel,
    required super.docterFilerItem,
  });

  @override
  List<Object?> get props => [doctorGetRequestModel, docterFilerItem];
}

class DoctorDataLoaded extends AppDoctorState {
  const DoctorDataLoaded({
    super.doctorGetItem,
    required super.docterFilerItem,
    required super.doctorGetRequestModel,
  });

  DoctorDataLoaded copyWith({
    DoctorGetItem? doctorGetItem,
    DocterFilerItem? docterFilerItem,
    DoctorGetRequestModel? doctorGetRequestModel,
  }) {
    return DoctorDataLoaded(
      doctorGetItem: doctorGetItem ?? this.doctorGetItem,
      docterFilerItem: docterFilerItem ?? this.docterFilerItem,
      doctorGetRequestModel:
          doctorGetRequestModel ?? this.doctorGetRequestModel,
    );
  }

  @override
  List<Object?> get props => [
        doctorGetItem,
        docterFilerItem,
        doctorGetRequestModel,
      ];
}
