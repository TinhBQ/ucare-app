part of 'app_doctor_cubit.dart';

class AppDoctorState extends Equatable {
  final DoctorGetItem? doctorGetItem;
  final DocterFilerItem docterFilerItem;
  final BaseGetRequestModel baseGetRequestModel;

  const AppDoctorState({
    this.doctorGetItem,
    required this.docterFilerItem,
    required this.baseGetRequestModel,
  });

  @override
  List<Object?> get props => [
        doctorGetItem,
        docterFilerItem,
        baseGetRequestModel,
      ];
}

final class AppDoctorInitial extends AppDoctorState {
  const AppDoctorInitial({
    required super.baseGetRequestModel,
    required super.docterFilerItem,
  });

  @override
  List<Object?> get props => [baseGetRequestModel, docterFilerItem];
}

class DoctorDataLoaded extends AppDoctorState {
  const DoctorDataLoaded({
    super.doctorGetItem,
    required super.docterFilerItem,
    required super.baseGetRequestModel,
  });

  DoctorDataLoaded copyWith({
    DoctorGetItem? doctorGetItem,
    DocterFilerItem? docterFilerItem,
    BaseGetRequestModel? baseGetRequestModel,
  }) {
    return DoctorDataLoaded(
      doctorGetItem: doctorGetItem ?? this.doctorGetItem,
      docterFilerItem: docterFilerItem ?? this.docterFilerItem,
      baseGetRequestModel: baseGetRequestModel ?? this.baseGetRequestModel,
    );
  }

  @override
  List<Object?> get props => [
        doctorGetItem,
        docterFilerItem,
        baseGetRequestModel,
      ];
}
