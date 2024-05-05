import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_advanced_project_fe/core/common/cubits/app_countries/countries_cubit.dart';
import 'package:mobile_advanced_project_fe/core/common/cubits/app_doctor/app_doctor_cubit.dart';
import 'package:mobile_advanced_project_fe/core/common/cubits/app_patient_schedule/app_patient_schedule_cubit.dart';
import 'package:mobile_advanced_project_fe/core/common/cubits/app_user/app_user_cubit.dart';
import 'package:mobile_advanced_project_fe/core/common/cubits/medicine_sessions/medicine_sessions_cubit.dart';
import 'package:mobile_advanced_project_fe/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:mobile_advanced_project_fe/features/book/presentation/bloc/country/country_bloc.dart';
import 'package:mobile_advanced_project_fe/features/book/presentation/bloc/medical_profile/medical_profile_bloc.dart';
import 'package:mobile_advanced_project_fe/features/deparment/presentation/bloc/department_bloc.dart';
import 'package:mobile_advanced_project_fe/features/doctor/presentation/bloc/doctor_bloc.dart';
import 'package:mobile_advanced_project_fe/features/history_booking/presentation/bloc/patient_schedule_bloc.dart';
import 'package:mobile_advanced_project_fe/features/medicine_schedule/presentation/bloc/medicine_schedule_bloc.dart';
import 'package:mobile_advanced_project_fe/features/profile/presentation/bloc/profile_bloc.dart';
import 'package:mobile_advanced_project_fe/features/session_of_day/presentation/bloc/session_of_day_bloc.dart';

import 'core/common/cubits/app_medical_appointment_body/app_medical_appointment_body_cubit.dart';
import 'core/common/cubits/app_patient/app_patient_cubit.dart';
import 'features/application/presentation/bloc/application_bloc.dart';
import 'features/patient/presentation/bloc/patient_bloc.dart';
import 'init_dependencies.main.dart';

class AppBlocProviders {
  static get allBlocProviders => [
        BlocProvider(create: (_) => serviceLocator<AppUserCubit>()),
        BlocProvider(create: (_) => serviceLocator<AppDoctorCubit>()),
        BlocProvider(create: (_) => serviceLocator<AppPatientCubit>()),
        BlocProvider(
            create: (_) => serviceLocator<AppMedicalAppointmentBodyCubit>()),
        BlocProvider(create: (_) => serviceLocator<MedicineSessionsCubit>()),
        BlocProvider(create: (_) => serviceLocator<AppPatientScheduleCubit>()),
                BlocProvider(create: (_) => serviceLocator<CountriesCubit>()),
        BlocProvider(create: (_) => serviceLocator<AuthBloc>()),
        BlocProvider(create: (_) => serviceLocator<ApplicationBloc>()),
        BlocProvider(create: (_) => serviceLocator<ProfileBloc>()),
        BlocProvider(create: (_) => serviceLocator<DepartmentBloc>()),
        BlocProvider(create: (_) => serviceLocator<SessionOfDayBloc>()),
        BlocProvider(
          create: (_) => serviceLocator<CountryBloc>()
            ..add(
              const CountryGetList(),
            ),
        ),
        BlocProvider(create: (_) => serviceLocator<PatientScheduleBloc>()),
        BlocProvider(
          create: (_) => serviceLocator<DoctorBloc>()
            ..add(
              const DoctorFindExamTimes(),
            ),
        ),
        BlocProvider(
          create: (_) => serviceLocator<MedicineScheduleBloc>()
            ..add(
              MedicineScheduleGetList(),
            ),
        ),
        BlocProvider(create: (_) => serviceLocator<PatientBloc>()),
        BlocProvider(create: (_) => serviceLocator<MedicalProfileBloc>()),
      ];
}
