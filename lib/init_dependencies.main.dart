import 'package:get_it/get_it.dart';
import 'package:mobile_advanced_project_fe/core/common/cubits/cubit/app_user_cubit.dart';
import 'package:mobile_advanced_project_fe/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:mobile_advanced_project_fe/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:mobile_advanced_project_fe/features/auth/domain/repository/auth_repository.dart';
import 'package:mobile_advanced_project_fe/features/auth/domain/usecases/user_forgot_password.dart';
import 'package:mobile_advanced_project_fe/features/auth/presentation/bloc/auth_bloc.dart';

import 'features/application/presentation/bloc/application_bloc.dart';
import 'features/auth/domain/usecases/usecases.dart';

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
