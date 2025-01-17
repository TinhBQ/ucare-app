import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_advanced_project_fe/core/common/cubits/app_choose_exam_info/app_choose_exam_info_cubit.dart';
import 'package:mobile_advanced_project_fe/core/common/cubits/app_countries/countries_cubit.dart';
import 'package:mobile_advanced_project_fe/core/common/cubits/app_doctor/app_doctor_cubit.dart';
import 'package:mobile_advanced_project_fe/core/common/cubits/app_medical_appointment_body/app_medical_appointment_body_cubit.dart';
import 'package:mobile_advanced_project_fe/core/common/cubits/app_my_order/app_my_order_cubit.dart';
import 'package:mobile_advanced_project_fe/core/common/cubits/app_new/app_new_cubit.dart';
import 'package:mobile_advanced_project_fe/core/common/cubits/app_patient/app_patient_cubit.dart';
import 'package:mobile_advanced_project_fe/core/common/cubits/app_patient_schedule/app_patient_schedule_cubit.dart';
import 'package:mobile_advanced_project_fe/core/common/cubits/app_status/app_status_cubit.dart';
import 'package:mobile_advanced_project_fe/core/common/cubits/app_user/app_user_cubit.dart';
import 'package:mobile_advanced_project_fe/core/common/cubits/medicine_sessions/medicine_sessions_cubit.dart';
import 'package:mobile_advanced_project_fe/features/application/presentation/bloc/application_bloc.dart';

import 'package:mobile_advanced_project_fe/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:mobile_advanced_project_fe/features/country/presentation/bloc/country/country_bloc.dart';
import 'package:mobile_advanced_project_fe/features/deparment/presentation/bloc/department_bloc.dart';
import 'package:mobile_advanced_project_fe/features/doctor/presentation/bloc/doctor_bloc.dart';
import 'package:mobile_advanced_project_fe/features/history/presentation/bloc/patient_schedule_bloc.dart';
import 'package:mobile_advanced_project_fe/features/medicine_schedule/presentation/bloc/medicine_schedule_bloc.dart';
import 'package:mobile_advanced_project_fe/features/new/presentation/bloc/news_bloc.dart';
import 'package:mobile_advanced_project_fe/features/order/presentation/bloc/order_bloc.dart';
import 'package:mobile_advanced_project_fe/features/patient/presentation/bloc/patient_bloc.dart';
import 'package:mobile_advanced_project_fe/features/profile/presentation/bloc/profile_bloc.dart';
import 'package:mobile_advanced_project_fe/features/schedule/presentation/bloc/schedule_bloc.dart';
import 'package:mobile_advanced_project_fe/features/session_of_day/presentation/bloc/session_of_day_bloc.dart';
import 'package:mobile_advanced_project_fe/features/statistic/presentation/bloc/statistic_bloc.dart';
import 'package:mobile_advanced_project_fe/features/status/presentation/bloc/status_bloc.dart';

import 'package:mobile_advanced_project_fe/init_dependencies.dart';

class AppBlocProviders {
  static get allBlocProviders => [
        // Cubit
        BlocProvider(create: (_) => serviceLocator<ApplicationBloc>()),
        BlocProvider(create: (_) => serviceLocator<AppNewCubit>()),
        BlocProvider(create: (_) => serviceLocator<AppUserCubit>()),
        BlocProvider(create: (_) => serviceLocator<AppDoctorCubit>()),
        BlocProvider(create: (_) => serviceLocator<AppPatientCubit>()),
        BlocProvider(create: (_) => serviceLocator<AppChooseExamInfoCubit>()),
        BlocProvider(
            create: (_) => serviceLocator<AppMedicalAppointmentBodyCubit>()),
        BlocProvider(create: (_) => serviceLocator<MedicineSessionsCubit>()),
        BlocProvider(create: (_) => serviceLocator<AppPatientScheduleCubit>()),
        BlocProvider(create: (_) => serviceLocator<AppStatusCubit>()),
        BlocProvider(create: (_) => serviceLocator<CountriesCubit>()),
        BlocProvider(create: (_) => serviceLocator<AppMyOrderCubit>()),
        // Bloc
        BlocProvider(create: (_) => serviceLocator<AuthBloc>()),
        BlocProvider(create: (_) => serviceLocator<ProfileBloc>()),
        BlocProvider(create: (_) => serviceLocator<DepartmentBloc>()),
        BlocProvider(create: (_) => serviceLocator<SessionOfDayBloc>()),
        BlocProvider(
            create: (_) =>
                serviceLocator<CountryBloc>()..add(const CountryGetList())),
        BlocProvider(create: (_) => serviceLocator<PatientScheduleBloc>()),
        BlocProvider(
            create: (_) =>
                serviceLocator<DoctorBloc>()..add(const DoctorFindExamTimes())),
        BlocProvider(
            create: (_) => serviceLocator<MedicineScheduleBloc>()
              ..add(MedicineScheduleGetList())),
        BlocProvider(
            create: (_) =>
                serviceLocator<PatientBloc>()..add(const PatientGetList())),
        BlocProvider(create: (_) => serviceLocator<ScheduleBloc>()),
        BlocProvider(
            create: (_) =>
                serviceLocator<StatusBloc>()..add(const StatusGetList())),
        BlocProvider(create: (_) => serviceLocator<OrderBloc>()),
        BlocProvider(
            create: (_) => serviceLocator<NewsBloc>()..add(const NewGetList())),
        BlocProvider(create: (_) => serviceLocator<StatisticBloc>()),
      ];
}
