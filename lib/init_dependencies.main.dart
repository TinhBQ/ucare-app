import 'package:get_it/get_it.dart';
import 'package:mobile_advanced_project_fe/core/common/cubits/app_countries/countries_cubit.dart';
import 'package:mobile_advanced_project_fe/core/common/cubits/app_patient_schedule/app_patient_schedule_cubit.dart';
import 'package:mobile_advanced_project_fe/core/common/cubits/app_user/app_user_cubit.dart';
import 'package:mobile_advanced_project_fe/core/common/cubits/medicine_sessions/medicine_sessions_cubit.dart';
import 'package:mobile_advanced_project_fe/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:mobile_advanced_project_fe/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:mobile_advanced_project_fe/features/auth/domain/repository/auth_repository.dart';
import 'package:mobile_advanced_project_fe/features/auth/domain/usecases/user_forgot_password.dart';
import 'package:mobile_advanced_project_fe/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:mobile_advanced_project_fe/features/book/data/datasources/medical_profile_remote_data_source.dart';
import 'package:mobile_advanced_project_fe/features/book/data/repositories/medical_profile_repository_impl.dart';
import 'package:mobile_advanced_project_fe/features/book/domain/repository/medical_profile_repository.dart';
import 'package:mobile_advanced_project_fe/features/book/domain/usecases/user_create_patient_profile.dart';
import 'package:mobile_advanced_project_fe/features/book/presentation/bloc/medical_profile/medical_profile_bloc.dart';
import 'package:mobile_advanced_project_fe/features/history_booking/data/datasources/patient_schedule_remote_data_source.dart';
import 'package:mobile_advanced_project_fe/features/history_booking/data/repositories/patient_schedule_repository_impl.dart';
import 'package:mobile_advanced_project_fe/features/history_booking/domain/repository/patient_schedule_repository.dart';
import 'package:mobile_advanced_project_fe/features/history_booking/domain/usecases/user_get_list_patient.dart';
import 'package:mobile_advanced_project_fe/features/history_booking/presentation/bloc/patient_schedule_bloc.dart';
import 'package:mobile_advanced_project_fe/features/medicine_schedule/domain/usecases/usecases.dart';
import 'package:mobile_advanced_project_fe/features/patient/data/datasources/patient_remote_data_source.dart';
import 'package:mobile_advanced_project_fe/features/patient/data/repositories/patient_repository_impl.dart';
import 'package:mobile_advanced_project_fe/features/patient/domain/repository/patient_repository.dart';
import 'package:mobile_advanced_project_fe/features/patient/presentation/bloc/patient_bloc.dart';

import 'package:mobile_advanced_project_fe/features/profile/domain/repository/profile_repository.dart';
import 'package:mobile_advanced_project_fe/features/profile/domain/usecases/usecases.dart';
import 'package:mobile_advanced_project_fe/features/profile/presentation/bloc/profile_bloc.dart';

import 'core/common/cubits/app_doctor/app_doctor_cubit.dart';
import 'core/common/cubits/app_medical_appointment_body/app_medical_appointment_body_cubit.dart';
import 'core/common/cubits/app_patient/app_patient_cubit.dart';
import 'features/application/presentation/bloc/application_bloc.dart';
import 'features/auth/domain/usecases/usecases.dart';
import 'features/book/data/datasources/country_remote_data_source.dart';
import 'features/book/data/repositories/country_repository_impl.dart';
import 'features/book/domain/repository/country_repository.dart';
import 'features/book/domain/usecases/user_get_list_country.dart';
import 'features/book/presentation/bloc/country/country_bloc.dart';
import 'features/deparment/data/datasources/deparment_remote_data_source.dart';
import 'features/deparment/data/repositories/department_repository_impl.dart';
import 'features/deparment/domain/repository/department_repository.dart';

import 'features/deparment/domain/usecases/usecases.dart';
import 'features/deparment/presentation/bloc/department_bloc.dart';
import 'features/doctor/data/datasources/doctor_remote_data_source.dart';
import 'features/doctor/data/repositories/doctor_repository_impl.dart';
import 'features/doctor/domain/repository/doctor_repository.dart';
import 'features/doctor/domain/usecases/user_find_exam_times.dart';
import 'features/doctor/presentation/bloc/doctor_bloc.dart';
import 'features/medicine_schedule/data/datasources/medicine_schedule_remote_data_source.dart';
import 'features/medicine_schedule/data/repositories/medicine_schedule_repository_impl.dart';
import 'features/medicine_schedule/domain/repository/medicine_schedule_repository.dart';
import 'features/medicine_schedule/presentation/bloc/medicine_schedule_bloc.dart';
import 'features/patient/domain/usecases/usecases.dart';
import 'features/profile/data/datasources/profile_remote_data_source.dart';
import 'features/profile/data/repositories/profile_repository_impl.dart';
import 'features/session_of_day/data/datasources/session_of_day_remote_data_source.dart';
import 'features/session_of_day/data/repositories/session_of_day_repository_impl.dart';
import 'features/session_of_day/domain/repository/session_of_day_repository.dart';
import 'features/session_of_day/domain/usecases/usecases.dart';
import 'features/session_of_day/presentation/bloc/session_of_day_bloc.dart';

final serviceLocator = GetIt.instance;

Future<void> initDependencies() async {
  _initAuth();

  // core
  serviceLocator.registerLazySingleton(
    () => AppUserCubit(),
  );
  serviceLocator.registerLazySingleton(
    () => AppDoctorCubit(),
  );

  serviceLocator.registerLazySingleton(
    () => AppPatientCubit(),
  );

  serviceLocator.registerLazySingleton(
    () => AppMedicalAppointmentBodyCubit(),
  );

  serviceLocator.registerLazySingleton(
    () => MedicineSessionsCubit(),
  );

  serviceLocator.registerLazySingleton(
    () => AppPatientScheduleCubit(),
  );

  serviceLocator.registerLazySingleton(
    () => ApplicationBloc(),
  );

  serviceLocator.registerLazySingleton(
    () => CountriesCubit(),
  );

  _initDepartment();
  _initProfile();
  _initSessionOfDay();
  _initDoctor();
  _initMedicineSchedule();
  _initCountry();
  _initPatient();
  _initPatientSchedule();
  _initMedicalProfile();
}

void _initAuth() {
  // Datasource
  serviceLocator
    ..registerFactory<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImpl(),
    )
    // Repository
    ..registerFactory<AuthRepository>(
      () => AuthRepositoryImpl(
        serviceLocator(),
      ),
    )
    // Usecases
    ..registerFactory(
      () => UserLogin(
        serviceLocator(),
      ),
    )
    ..registerFactory(
      () => UserSignUp(
        serviceLocator(),
      ),
    )
    ..registerFactory(
      () => UserConfirmSignUp(
        serviceLocator(),
      ),
    )
    ..registerFactory(
      () => UserCreateOTP(
        serviceLocator(),
      ),
    )
    ..registerFactory(
      () => UserForgotPassword(
        serviceLocator(),
      ),
    )
    ..registerFactory(
      () => UserLogout(
        serviceLocator(),
      ),
    )
    ..registerFactory(
      () => CurrentUser(
        serviceLocator(),
      ),
    )
    // Bloc
    ..registerLazySingleton(
      () => AuthBloc(
        userLogin: serviceLocator(),
        userSignUp: serviceLocator(),
        userConfirmSignUp: serviceLocator(),
        userCreateOTP: serviceLocator(),
        userForgotPassword: serviceLocator(),
        currentUser: serviceLocator(),
        appUserCubit: serviceLocator(),
        userLogout: serviceLocator(),
      ),
    );
}

void _initProfile() {
  // Datasource
  serviceLocator
    ..registerFactory<ProfileRemoteDataSource>(
      () => ProfileRemoteDataSourceImpl(),
    )
    // Repository
    ..registerFactory<ProfileRepository>(
      () => ProfileRepositoryImpl(
        serviceLocator(),
      ),
    )
    // Usecases
    ..registerFactory(
      () => UserChangePassword(
        serviceLocator(),
      ),
    )
    ..registerFactory(
      () => UserChangeProfile(
        serviceLocator(),
      ),
    )
    // Bloc
    ..registerLazySingleton(
      () => ProfileBloc(
        userChangePassword: serviceLocator(),
        userChangeProfile: serviceLocator(),
        appUserCubit: serviceLocator(),
      ),
    );
}

void _initDepartment() {
  serviceLocator
    ..registerFactory<DepartmentRemoteDataSource>(
      () => DepartmentRemoteDataSourceImpl(),
    )
    // Repository
    ..registerFactory<DepartmentRepository>(
      () => DepartmentRepositoryImpl(
        serviceLocator(),
      ),
    )
    // Usecases
    ..registerFactory(
      () => UserGetListDepartment(
        serviceLocator(),
      ),
    )
    // Bloc
    ..registerLazySingleton(
      () => DepartmentBloc(
        userGetListDepartment: serviceLocator(),
      ),
    );
}

void _initCountry() {
  serviceLocator
    ..registerFactory<CountryRemoteDataSource>(
      () => CountryRemoteDataSourceImpl(),
    )
    // Repository
    ..registerFactory<CountryRepository>(
      () => CountryRepositoryImpl(
        serviceLocator(),
      ),
    )
    // Usecases
    ..registerFactory(
      () => UserGetListCountry(
        serviceLocator(),
      ),
    )
    // Bloc
    ..registerLazySingleton(
      () => CountryBloc(
        userGetListCountry: serviceLocator(),
        countryCubit: serviceLocator(),
      ),
    );
}

void _initSessionOfDay() {
  // Datasource
  serviceLocator
    ..registerFactory<SessionOfDayDataSourceRemoteDataSource>(
      () => SessionOfDayRemoteDataSourceImpl(),
    )
    // Repository
    ..registerFactory<SessionOfDayRepository>(
      () => SessionOfDayRepositoryImpl(
        serviceLocator(),
      ),
    )
    // Usecases
    ..registerFactory(
      () => UserGetListSessionOfDay(
        serviceLocator(),
      ),
    )
    // Bloc
    ..registerLazySingleton(
      () => SessionOfDayBloc(
        userGetListSessionOfDay: serviceLocator(),
      ),
    );
}

void _initDoctor() {
  // Datasource
  serviceLocator
    ..registerFactory<DoctorRemoteDataSource>(
      () => DoctorRemoteDataSourceImpl(),
    )
    // Repository
    ..registerFactory<DoctorRepository>(
      () => DoctorRepositoryImpl(
        serviceLocator(),
      ),
    )
    // Usecases
    ..registerFactory(
      () => UserFindExamTimes(
        serviceLocator(),
      ),
    )
    // Bloc
    ..registerLazySingleton(
      () => DoctorBloc(
        userFindExamTimes: serviceLocator(),
        appDoctorCubit: serviceLocator(),
      ),
    );
}

void _initMedicineSchedule() {
  // Datasource
  serviceLocator
    ..registerFactory<MedicineScheduleRemoteDataSource>(
      () => MedicineScheduleRemoteDataSourceImpl(),
    )
    // Repository
    ..registerFactory<MedicineScheduleRepository>(
      () => MedicineScheduleRepositoryImpl(
        serviceLocator(),
      ),
    )
    // Usecases
    ..registerFactory(
      () => UserGetMedicineSessionItems(
        serviceLocator(),
      ),
    )
    ..registerFactory(
      () => UserUpdateTimeOfMedicineSession(
        serviceLocator(),
      ),
    )
    ..registerFactory(
      () => UserTurnOnOfTimeOfMedicineSession(
        serviceLocator(),
      ),
    )
    // Bloc
    ..registerLazySingleton(
      () => MedicineScheduleBloc(
        userGetMedicineSessionItems: serviceLocator(),
        userUpdateTimeOfMedicineSession: serviceLocator(),
        medicineSessionsCubit: serviceLocator(),
        userTurnOnOfTimeOfMedicineSession: serviceLocator(),
      ),
    );
}

void _initPatient() {
  // Datasource
  serviceLocator
    ..registerFactory<PatientRemoteDataSource>(
      () => PatientRemoteDataSourceImpl(),
    )
    // Repository
    ..registerFactory<PatientRepository>(
      () => PatientRepositoryImpl(
        serviceLocator(),
      ),
    )
    // Usecases
    ..registerFactory(
      () => UserGetListPatient(
        serviceLocator(),
      ),
    )
    // Bloc
    ..registerLazySingleton(
      () => PatientBloc(
        userGetListPatient: serviceLocator(),
        appPatientCubit: serviceLocator(),
      ),
    );
}

void _initPatientSchedule() {
  // Datasource
  serviceLocator
    ..registerFactory<PatientScheduleRemoteDataSource>(
      () => PatientScheduleRemoteDataSourceImpl(),
    )
    // Repository
    ..registerFactory<PatientScheduleRepository>(
      () => PatientScheduleRepositoryImpl(
        serviceLocator(),
      ),
    )
    // Usecases
    ..registerFactory(
      () => UserGetListPatientSchedule(
        serviceLocator(),
      ),
    )
    // Bloc
    ..registerLazySingleton(
      () => PatientScheduleBloc(
        appPatientScheduleCubit: serviceLocator(),
        userGetListPatientSchedule: serviceLocator(),
      ),
    );
}

void _initMedicalProfile() {
  // Datasource
  serviceLocator
    ..registerFactory<MedicalProfileRemoteDataSource>(
      () => MedicalProfileRemoteDataSourceImpl(),
    )
    // Repository
    ..registerFactory<MedicalProfileRepository>(
      () => MedicalProfileRepositoryImpl(
        serviceLocator(),
      ),
    )
    // Usecases
    ..registerFactory(
      () => UserCreatePatientProfile(
        serviceLocator(),
      ),
    )
    // Bloc
    ..registerLazySingleton(
      () => MedicalProfileBloc(
        userCreatePatientProfile: serviceLocator(),
      ),
    );
}
