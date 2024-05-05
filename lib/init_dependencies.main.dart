import 'package:get_it/get_it.dart';
import 'package:mobile_advanced_project_fe/core/common/cubits/app_choose_exam_info/app_choose_exam_info_cubit.dart';
import 'package:mobile_advanced_project_fe/core/common/cubits/app_patient_schedule/app_patient_schedule_cubit.dart';
import 'package:mobile_advanced_project_fe/core/common/cubits/app_status/app_status_cubit.dart';
import 'package:mobile_advanced_project_fe/core/common/cubits/app_user/app_user_cubit.dart';
import 'package:mobile_advanced_project_fe/core/common/cubits/medicine_sessions/medicine_sessions_cubit.dart';
import 'package:mobile_advanced_project_fe/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:mobile_advanced_project_fe/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:mobile_advanced_project_fe/features/auth/domain/repository/auth_repository.dart';
import 'package:mobile_advanced_project_fe/features/auth/domain/usecases/user_forgot_password.dart';
import 'package:mobile_advanced_project_fe/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:mobile_advanced_project_fe/features/history_booking/data/datasources/patient_schedule_remote_data_source.dart';
import 'package:mobile_advanced_project_fe/features/history_booking/data/repositories/patient_schedule_repository_impl.dart';
import 'package:mobile_advanced_project_fe/features/history_booking/domain/repository/patient_schedule_repository.dart';
import 'package:mobile_advanced_project_fe/features/history_booking/domain/usecases/user_get_list_patient.dart';
import 'package:mobile_advanced_project_fe/features/history_booking/presentation/bloc/patient_schedule_bloc.dart';
import 'package:mobile_advanced_project_fe/features/medicine_schedule/domain/usecases/usecases.dart';
import 'package:mobile_advanced_project_fe/features/order/data/datasources/order_remote_data_source.dart';
import 'package:mobile_advanced_project_fe/features/order/data/repositories/order_repository_impl.dart';
import 'package:mobile_advanced_project_fe/features/order/domain/repository/order_repository.dart';
import 'package:mobile_advanced_project_fe/features/order/presentation/bloc/order_bloc.dart';
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
import 'features/book/data/datasources/book_remote_data_source.dart';
import 'features/book/data/repositories/book_repository_impl.dart';
import 'features/book/domain/repository/book_repository.dart';
import 'features/book/presentation/bloc/book_bloc.dart';
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
import 'features/order/domain/usecases/usecases.dart';
import 'features/patient/domain/usecases/usecases.dart';
import 'features/profile/data/datasources/profile_remote_data_source.dart';
import 'features/profile/data/repositories/profile_repository_impl.dart';
import 'features/schedule/data/datasources/schedule_remote_data_source.dart';
import 'features/schedule/data/repositories/schedule_repository_impl.dart';
import 'features/schedule/domain/repository/schedule_repository.dart';
import 'features/schedule/domain/usecases/usecases.dart';
import 'features/schedule/presentation/bloc/schedule_bloc.dart';
import 'features/session_of_day/data/datasources/session_of_day_remote_data_source.dart';
import 'features/session_of_day/data/repositories/session_of_day_repository_impl.dart';
import 'features/session_of_day/domain/repository/session_of_day_repository.dart';
import 'features/session_of_day/domain/usecases/usecases.dart';
import 'features/session_of_day/presentation/bloc/session_of_day_bloc.dart';
import 'features/status/data/datasources/status_remote_data_source.dart';
import 'features/status/data/repositories/status_repository_impl.dart';
import 'features/status/domain/repository/status_repository.dart';
import 'features/status/domain/usecases/user_get_statuses.dart';
import 'features/status/presentation/bloc/status_bloc.dart';

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
    () => AppChooseExamInfoCubit(),
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
    () => AppStatusCubit(),
  );

  _initDepartment();
  _initProfile();
  _initSessionOfDay();
  _initDoctor();
  _initMedicineSchedule();
  // _initCountry();
  _initPatient();
  _initPatientSchedule();
  _initSchedule();
  _initBook();
  _initStatus();
  _initOrder();
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

// void _initCountry() {
//   serviceLocator
//     ..registerFactory<BookRemoteDataSource>(
//       () => CountryRemoteDataSourceImpl(),
//     )
//     // Repository
//     ..registerFactory<CountryRepository>(
//       () => CountryRepositoryImpl(
//         serviceLocator(),
//       ),
//     )
//     // Usecases
//     ..registerFactory(
//       () => UserGetListCountry(
//         serviceLocator(),
//       ),
//     )
//     // Bloc
//     ..registerLazySingleton(
//       () => CountryBloc(
//         userGetListCountry: serviceLocator(),
//       ),
//     );
// }

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

void _initSchedule() {
  // Datasource
  serviceLocator
    ..registerFactory<ScheduleRemoteDataSource>(
      () => ScheduleRemoteDataSourceImpl(),
    )
    // Repository
    ..registerFactory<ScheduleRepository>(
      () => ScheduleRepositoryImpl(
        serviceLocator(),
      ),
    )
    // Usecases
    ..registerFactory(
      () => UserGetSchedule(
        serviceLocator(),
      ),
    )
    // Bloc
    ..registerLazySingleton(
      () => ScheduleBloc(
        userGetSchedule: serviceLocator(),
      ),
    );
}

void _initBook() {
  // Datasource
  serviceLocator
    ..registerFactory<BookRemoteDataSource>(
      () => BookRemoteDataSourceImpl(),
    )
    // Repository
    ..registerFactory<BookRepository>(
      () => BookRepositoryImpl(
        serviceLocator(),
      ),
    )

    // Bloc
    ..registerLazySingleton(
      () => BookBloc(),
    );
}

void _initStatus() {
  // Datasource
  serviceLocator
    ..registerFactory<StatusRemoteDataSource>(
      () => StatusRemoteDataSourceImpl(),
    )
    // Repository
    ..registerFactory<StatusRepository>(
      () => StatusRepositoryImpl(
        serviceLocator(),
      ),
    )
    // Usecases
    ..registerFactory(
      () => UserGetListStatus(
        serviceLocator(),
      ),
    )
    // Bloc
    ..registerLazySingleton(
      () => StatusBloc(
        appStatusCubit: serviceLocator(),
        userGetListStatus: serviceLocator(),
      ),
    );
}

void _initOrder() {
  // Datasource
  serviceLocator
    ..registerFactory<OrderRemoteDataSource>(
      () => OrderRemoteDataSourceImpl(),
    )
    // Repository
    ..registerFactory<OrderRepository>(
      () => OrderRepositoryImpl(
        serviceLocator(),
      ),
    )
    // Usecases
    ..registerFactory(
      () => UserOrderPayment(
        serviceLocator(),
      ),
    )
    ..registerFactory(
      () => UserOrder(
        serviceLocator(),
      ),
    )
    ..registerFactory(
      () => UserOrderPaymentReturnURL(
        serviceLocator(),
      ),
    )
    // Bloc
    ..registerLazySingleton(
      () => OrderBloc(
        userOrderPayment: serviceLocator(),
        userOrder: serviceLocator(),
        userOrderReturnURL: serviceLocator(),
      ),
    );
}
