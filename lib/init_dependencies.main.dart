import 'package:get_it/get_it.dart';
import 'package:mobile_advanced_project_fe/core/common/cubits/app_user/app_user_cubit.dart';
import 'package:mobile_advanced_project_fe/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:mobile_advanced_project_fe/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:mobile_advanced_project_fe/features/auth/domain/repository/auth_repository.dart';
import 'package:mobile_advanced_project_fe/features/auth/domain/usecases/user_forgot_password.dart';
import 'package:mobile_advanced_project_fe/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:mobile_advanced_project_fe/features/find_exam_times/data/datasources/find_exam_times_remote_data_source.dart';
import 'package:mobile_advanced_project_fe/features/find_exam_times/data/repositories/find_exam_times_repository_impl.dart';
import 'package:mobile_advanced_project_fe/features/find_exam_times/domain/repository/find_exam_times_repository.dart';
import 'package:mobile_advanced_project_fe/features/profile/data/datasources/profile_remote_data_source.dart';
import 'package:mobile_advanced_project_fe/features/profile/domain/repository/profile_repository.dart';
import 'package:mobile_advanced_project_fe/features/profile/domain/usecases/user_change_password.dart';
import 'package:mobile_advanced_project_fe/features/profile/presentation/bloc/profile_bloc.dart';

import 'features/application/presentation/bloc/application_bloc.dart';
import 'features/auth/domain/usecases/usecases.dart';
import 'features/find_exam_times/domain/usecases/usecases.dart';
import 'features/find_exam_times/presentation/bloc/find_exam_times_bloc.dart';
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
    () => ApplicationBloc(),
  );

  _initProfile();
  _initFindExamTimes();
  _initSessionOfDay();
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

void _initFindExamTimes() {
  // Datasource
  serviceLocator
    ..registerFactory<FindExamTimesRemoteDataSource>(
      () => FindExamTimesRemoteDataSourceImpl(),
    )
    // Repository
    ..registerFactory<FindExamTimesRepository>(
      () => FindExamTimesRepositoryImpl(
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
      () => FindExamTimesBloc(
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
