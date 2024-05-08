part of 'init_dependencies.dart';

final serviceLocator = GetIt.instance;

Future<void> initDependencies() async {
  // Cubits
  serviceLocator.registerLazySingleton(() => AppUserCubit());
  serviceLocator.registerLazySingleton(() => AppDoctorCubit());
  serviceLocator.registerLazySingleton(() => AppChooseExamInfoCubit());
  serviceLocator.registerLazySingleton(() => AppPatientCubit());
  serviceLocator.registerLazySingleton(() => AppMedicalAppointmentBodyCubit());
  serviceLocator.registerLazySingleton(() => MedicineSessionsCubit());
  serviceLocator.registerLazySingleton(() => AppPatientScheduleCubit());
  serviceLocator.registerLazySingleton(() => AppStatusCubit());
  serviceLocator.registerLazySingleton(() => CountriesCubit());
  serviceLocator.registerLazySingleton(() => AppNewCubit());

  // Bloc
  serviceLocator.registerLazySingleton(() => ApplicationBloc());
  _initAuth();
  _initDepartment();
  _initProfile();
  _initSessionOfDay();
  _initDoctor();
  _initMedicineSchedule();
  _initPatient();
  _initPatientSchedule();
  _initSchedule();
  _initStatus();
  _initOrder();
  _initCountry();
  _initNew();
}

// Auth
void _initAuth() {
  // Datasource
  serviceLocator
    ..registerFactory<AuthRemoteDataSource>(() => AuthRemoteDataSourceImpl())
    // Repository
    ..registerFactory<AuthRepository>(
        () => AuthRepositoryImpl(serviceLocator()))
    // Usecases
    ..registerFactory(() => UserLogin(serviceLocator()))
    ..registerFactory(() => UserSignUp(serviceLocator()))
    ..registerFactory(() => UserConfirmSignUp(serviceLocator()))
    ..registerFactory(() => UserCreateOTP(serviceLocator()))
    ..registerFactory(() => UserForgotPassword(serviceLocator()))
    ..registerFactory(() => UserLogout(serviceLocator()))
    ..registerFactory(() => CurrentUser(serviceLocator()))
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

// Profile
void _initProfile() {
  // Datasource
  serviceLocator
    ..registerFactory<ProfileRemoteDataSource>(
        () => ProfileRemoteDataSourceImpl())
    // Repository
    ..registerFactory<ProfileRepository>(
      () => ProfileRepositoryImpl(serviceLocator()),
    )
    // Usecases
    ..registerFactory(
      () => UserChangePassword(serviceLocator()),
    )
    ..registerFactory(
      () => UserChangeProfile(serviceLocator()),
    )
    ..registerFactory(
      () => UserUploadFile(serviceLocator()),
    )
    // Bloc
    ..registerLazySingleton(
      () => ProfileBloc(
        userChangePassword: serviceLocator(),
        userChangeProfile: serviceLocator(),
        appUserCubit: serviceLocator(),
        userUploadFile: serviceLocator(),
      ),
    );
}

// Department
void _initDepartment() {
  serviceLocator
    ..registerFactory<DepartmentRemoteDataSource>(
        () => DepartmentRemoteDataSourceImpl())
    // Repository
    ..registerFactory<DepartmentRepository>(
        () => DepartmentRepositoryImpl(serviceLocator()))
    // Usecases
    ..registerFactory(() => UserGetListDepartment(serviceLocator()))
    // Bloc
    ..registerLazySingleton(
        () => DepartmentBloc(userGetListDepartment: serviceLocator()));
}

// SessionOfDay
void _initSessionOfDay() {
  // Datasource
  serviceLocator
    ..registerFactory<SessionOfDayDataSourceRemoteDataSource>(
        () => SessionOfDayRemoteDataSourceImpl())
    // Repository
    ..registerFactory<SessionOfDayRepository>(
        () => SessionOfDayRepositoryImpl(serviceLocator()))
    // Usecases
    ..registerFactory(() => UserGetListSessionOfDay(serviceLocator()))
    // Bloc
    ..registerLazySingleton(() => SessionOfDayBloc(
          userGetListSessionOfDay: serviceLocator(),
        ));
}

// Doctor
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

// MedicineSchedule
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

// Patient
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
    ..registerFactory(
      () => UserCreatePatientProfile(
        serviceLocator(),
      ),
    )
    ..registerFactory(
      () => UserPatientBookSchedule(
        serviceLocator(),
      ),
    )
    ..registerFactory(
      () => UserDeletePatientProfile(
        serviceLocator(),
      ),
    )
    // Bloc
    ..registerLazySingleton(
      () => PatientBloc(
        userGetListPatient: serviceLocator(),
        appPatientCubit: serviceLocator(),
        userCreatePatientProfile: serviceLocator(),
        userPatientBookSchedule: serviceLocator(),
        userDeletePatientProfile: serviceLocator(),
      ),
    );
}

// PatientSchedule *
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

// Schedule
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

// Status
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

// Order
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

// Country
void _initCountry() {
  // Datasource
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

void _initNew() {
  // Datasource
  serviceLocator
    ..registerFactory<NewRemoteDataSource>(
      () => NewRemoteDataSourceImpl(),
    )
    // Repository
    ..registerFactory<NewRepository>(
      () => NewRepositoryImpl(
        serviceLocator(),
      ),
    )
    // Usecases
    ..registerFactory(
      () => UserGetListNew(
        serviceLocator(),
      ),
    )
    // Bloc
    ..registerLazySingleton(
      () => NewsBloc(
        userGetListNew: serviceLocator(),
        appNewCubit: serviceLocator(),
      ),
    );
}
