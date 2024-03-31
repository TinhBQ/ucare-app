import 'package:get_it/get_it.dart';
import 'package:mobile_advanced_project_fe/core/common/cubits/app_user/app_user_cubit.dart';
import 'package:mobile_advanced_project_fe/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:mobile_advanced_project_fe/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:mobile_advanced_project_fe/features/auth/domain/repository/auth_repository.dart';
import 'package:mobile_advanced_project_fe/features/auth/domain/usecases/user_forgot_password.dart';
import 'package:mobile_advanced_project_fe/features/auth/presentation/bloc/auth_bloc.dart';

import 'package:mobile_advanced_project_fe/features/profile/domain/repository/profile_repository.dart';
import 'package:mobile_advanced_project_fe/features/profile/domain/usecases/user_change_password.dart';
import 'package:mobile_advanced_project_fe/features/profile/presentation/bloc/profile_bloc.dart';

import 'core/common/cubits/app_doctor/app_doctor_cubit.dart';
import 'features/application/presentation/bloc/application_bloc.dart';
import 'features/auth/domain/usecases/usecases.dart';
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
    () => ApplicationBloc(),
  );

  _initDepartment();
  _initProfile();
  _initSessionOfDay();
  _initDoctor();
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
    // Bloc
    ..registerLazySingleton(
      () => ProfileBloc(
        userChangePassword: serviceLocator(),
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
