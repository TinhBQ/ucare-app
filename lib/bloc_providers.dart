import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_advanced_project_fe/core/common/cubits/app_doctor/app_doctor_cubit.dart';
import 'package:mobile_advanced_project_fe/core/common/cubits/app_user/app_user_cubit.dart';
import 'package:mobile_advanced_project_fe/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:mobile_advanced_project_fe/features/deparment/presentation/bloc/department_bloc.dart';
import 'package:mobile_advanced_project_fe/features/doctor/presentation/bloc/doctor_bloc.dart';
import 'package:mobile_advanced_project_fe/features/profile/presentation/bloc/profile_bloc.dart';
import 'package:mobile_advanced_project_fe/features/session_of_day/presentation/bloc/session_of_day_bloc.dart';

import 'features/application/presentation/bloc/application_bloc.dart';
import 'init_dependencies.main.dart';

class AppBlocProviders {
  static get allBlocProviders => [
        BlocProvider(create: (_) => serviceLocator<AppUserCubit>()),
        BlocProvider(create: (_) => serviceLocator<AppDoctorCubit>()),
        BlocProvider(create: (_) => serviceLocator<AuthBloc>()),
        BlocProvider(create: (_) => serviceLocator<ApplicationBloc>()),
        BlocProvider(create: (_) => serviceLocator<ProfileBloc>()),
        BlocProvider(create: (_) => serviceLocator<DepartmentBloc>()),
        BlocProvider(create: (_) => serviceLocator<SessionOfDayBloc>()),
        BlocProvider(
            create: (_) => serviceLocator<DoctorBloc>()
              ..add(
                const DoctorFindExamTimes(),
              )),
      ];
}
