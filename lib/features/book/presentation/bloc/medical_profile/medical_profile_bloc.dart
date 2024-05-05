import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_advanced_project_fe/core/model/request_models/patient_request_models/create_patient_request_model.dart';
import 'package:mobile_advanced_project_fe/features/book/domain/usecases/usecases.dart';
import 'package:mobile_advanced_project_fe/features/book/domain/usecases/user_create_patient_profile.dart';

part 'medical_profile_event.dart';
part 'medical_profile_state.dart';

enum OnMedicalProfileEvent {
  onPatientCreate,
}

class MedicalProfileBloc
    extends Bloc<MedicalProfileEvent, MedicalProfileState> {
  final UserCreatePatientProfile _userCreatePatientProfile;

  MedicalProfileBloc(
      {required UserCreatePatientProfile userCreatePatientProfile})
      : _userCreatePatientProfile = userCreatePatientProfile,
        super(MedicalProfileInitial()) {
    on<MedicalProfileEvent>((_, emit) => emit(MedicalProfileLoading()));
    on<MedicalProfileCreate>(_onMedicalProfileCreate);
  }
  void _onMedicalProfileCreate(
    MedicalProfileCreate event,
    Emitter<MedicalProfileState> emit,
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
        MedicalProfileFailure(
          failure.message.toString(),
          OnMedicalProfileEvent.onPatientCreate,
        ),
      ),
      (message) => emit(
        MedicalProfileSuccess(
          message.toString(),
          OnMedicalProfileEvent.onPatientCreate,
        ),
      ),
    );
  }
}
