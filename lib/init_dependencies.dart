import 'package:get_it/get_it.dart';

// Cubit
import 'package:mobile_advanced_project_fe/core/common/cubits/app_choose_exam_info/app_choose_exam_info_cubit.dart';
import 'package:mobile_advanced_project_fe/core/common/cubits/app_countries/countries_cubit.dart';
import 'package:mobile_advanced_project_fe/core/common/cubits/app_doctor/app_doctor_cubit.dart';
import 'package:mobile_advanced_project_fe/core/common/cubits/app_medical_appointment_body/app_medical_appointment_body_cubit.dart';
import 'package:mobile_advanced_project_fe/core/common/cubits/app_new/app_new_cubit.dart';
import 'package:mobile_advanced_project_fe/core/common/cubits/app_patient/app_patient_cubit.dart';
import 'package:mobile_advanced_project_fe/core/common/cubits/app_patient_schedule/app_patient_schedule_cubit.dart';
import 'package:mobile_advanced_project_fe/core/common/cubits/app_status/app_status_cubit.dart';
import 'package:mobile_advanced_project_fe/core/common/cubits/app_user/app_user_cubit.dart';
import 'package:mobile_advanced_project_fe/core/common/cubits/medicine_sessions/medicine_sessions_cubit.dart';

// Application
import 'package:mobile_advanced_project_fe/features/application/presentation/bloc/application_bloc.dart';

// Auth
import 'package:mobile_advanced_project_fe/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:mobile_advanced_project_fe/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:mobile_advanced_project_fe/features/auth/domain/repository/auth_repository.dart';
import 'package:mobile_advanced_project_fe/features/auth/domain/usecases/current_user.dart';
import 'package:mobile_advanced_project_fe/features/auth/domain/usecases/user_confirm_sign_up.dart';
import 'package:mobile_advanced_project_fe/features/auth/domain/usecases/user_create_otp.dart';
import 'package:mobile_advanced_project_fe/features/auth/domain/usecases/user_forgot_password.dart';
import 'package:mobile_advanced_project_fe/features/auth/domain/usecases/user_login.dart';
import 'package:mobile_advanced_project_fe/features/auth/domain/usecases/user_logout.dart';
import 'package:mobile_advanced_project_fe/features/auth/domain/usecases/user_sign_up.dart';
import 'package:mobile_advanced_project_fe/features/auth/presentation/bloc/auth_bloc.dart';

// Country
import 'package:mobile_advanced_project_fe/features/country/data/datasources/country_remote_data_source.dart';
import 'package:mobile_advanced_project_fe/features/country/data/repositories/country_repository_impl.dart';
import 'package:mobile_advanced_project_fe/features/country/domain/repository/country_repository.dart';
import 'package:mobile_advanced_project_fe/features/country/domain/usecases/user_get_list_country.dart';
import 'package:mobile_advanced_project_fe/features/country/presentation/bloc/country/country_bloc.dart';

// Doctor
import 'package:mobile_advanced_project_fe/features/doctor/data/datasources/doctor_remote_data_source.dart';
import 'package:mobile_advanced_project_fe/features/doctor/data/repositories/doctor_repository_impl.dart';
import 'package:mobile_advanced_project_fe/features/doctor/domain/repository/doctor_repository.dart';
import 'package:mobile_advanced_project_fe/features/doctor/domain/usecases/user_find_exam_times.dart';
import 'package:mobile_advanced_project_fe/features/doctor/presentation/bloc/doctor_bloc.dart';

import 'package:mobile_advanced_project_fe/features/history_booking/data/datasources/patient_schedule_remote_data_source.dart';
import 'package:mobile_advanced_project_fe/features/history_booking/data/repositories/patient_schedule_repository_impl.dart';
import 'package:mobile_advanced_project_fe/features/history_booking/domain/repository/patient_schedule_repository.dart';
import 'package:mobile_advanced_project_fe/features/history_booking/domain/usecases/user_get_list_patient.dart';
import 'package:mobile_advanced_project_fe/features/history_booking/presentation/bloc/patient_schedule_bloc.dart';

// MedicineSchedule
import 'package:mobile_advanced_project_fe/features/medicine_schedule/data/datasources/medicine_schedule_remote_data_source.dart';
import 'package:mobile_advanced_project_fe/features/medicine_schedule/data/repositories/medicine_schedule_repository_impl.dart';
import 'package:mobile_advanced_project_fe/features/medicine_schedule/domain/repository/medicine_schedule_repository.dart';
import 'package:mobile_advanced_project_fe/features/medicine_schedule/domain/usecases/user_get_medicine_session_items.dart';
import 'package:mobile_advanced_project_fe/features/medicine_schedule/domain/usecases/user_turn_on_of_time_of_medicine_session.dart';
import 'package:mobile_advanced_project_fe/features/medicine_schedule/domain/usecases/user_update_time_of_medicine_session.dart';
import 'package:mobile_advanced_project_fe/features/medicine_schedule/presentation/bloc/medicine_schedule_bloc.dart';
import 'package:mobile_advanced_project_fe/features/new/data/datasources/new_remote_data_source.dart';
import 'package:mobile_advanced_project_fe/features/new/data/repositories/new_repository_impl.dart';
import 'package:mobile_advanced_project_fe/features/new/domain/repository/new_repository.dart';
import 'package:mobile_advanced_project_fe/features/new/domain/usecases/user_get_list_new.dart';
import 'package:mobile_advanced_project_fe/features/new/presentation/bloc/news_bloc.dart';

// order
import 'package:mobile_advanced_project_fe/features/order/data/datasources/order_remote_data_source.dart';
import 'package:mobile_advanced_project_fe/features/order/data/repositories/order_repository_impl.dart';
import 'package:mobile_advanced_project_fe/features/order/domain/repository/order_repository.dart';
import 'package:mobile_advanced_project_fe/features/order/domain/usecases/user_order.dart';
import 'package:mobile_advanced_project_fe/features/order/domain/usecases/user_order_payment.dart';
import 'package:mobile_advanced_project_fe/features/order/domain/usecases/user_order_payment_return_url.dart';
import 'package:mobile_advanced_project_fe/features/order/presentation/bloc/order_bloc.dart';

// Patient
import 'package:mobile_advanced_project_fe/features/patient/data/datasources/patient_remote_data_source.dart';
import 'package:mobile_advanced_project_fe/features/patient/data/repositories/patient_repository_impl.dart';
import 'package:mobile_advanced_project_fe/features/patient/domain/repository/patient_repository.dart';
import 'package:mobile_advanced_project_fe/features/patient/domain/usecases/usecases.dart';
import 'package:mobile_advanced_project_fe/features/patient/presentation/bloc/patient_bloc.dart';

// Profile
import 'package:mobile_advanced_project_fe/features/profile/data/datasources/profile_remote_data_source.dart';
import 'package:mobile_advanced_project_fe/features/profile/data/repositories/profile_repository_impl.dart';
import 'package:mobile_advanced_project_fe/features/profile/domain/repository/profile_repository.dart';
import 'package:mobile_advanced_project_fe/features/profile/domain/usecases/usecases.dart';
import 'package:mobile_advanced_project_fe/features/profile/presentation/bloc/profile_bloc.dart';

// Department
import 'package:mobile_advanced_project_fe/features/deparment/data/datasources/deparment_remote_data_source.dart';
import 'package:mobile_advanced_project_fe/features/deparment/data/repositories/department_repository_impl.dart';
import 'package:mobile_advanced_project_fe/features/deparment/domain/repository/department_repository.dart';
import 'package:mobile_advanced_project_fe/features/deparment/domain/usecases/user_get_list_departmet.dart';
import 'package:mobile_advanced_project_fe/features/deparment/presentation/bloc/department_bloc.dart';

// Schedule
import 'package:mobile_advanced_project_fe/features/schedule/data/datasources/schedule_remote_data_source.dart';
import 'package:mobile_advanced_project_fe/features/schedule/data/repositories/schedule_repository_impl.dart';
import 'package:mobile_advanced_project_fe/features/schedule/domain/repository/schedule_repository.dart';
import 'package:mobile_advanced_project_fe/features/schedule/domain/usecases/user_get_schedule.dart';
import 'package:mobile_advanced_project_fe/features/schedule/presentation/bloc/schedule_bloc.dart';

// SessionOfDay
import 'package:mobile_advanced_project_fe/features/session_of_day/data/datasources/session_of_day_remote_data_source.dart';
import 'package:mobile_advanced_project_fe/features/session_of_day/data/repositories/session_of_day_repository_impl.dart';
import 'package:mobile_advanced_project_fe/features/session_of_day/domain/repository/session_of_day_repository.dart';
import 'package:mobile_advanced_project_fe/features/session_of_day/domain/usecases/user_get_list_session_of_day.dart';
import 'package:mobile_advanced_project_fe/features/session_of_day/presentation/bloc/session_of_day_bloc.dart';

// Status
import 'package:mobile_advanced_project_fe/features/status/data/datasources/status_remote_data_source.dart';
import 'package:mobile_advanced_project_fe/features/status/data/repositories/status_repository_impl.dart';
import 'package:mobile_advanced_project_fe/features/status/domain/repository/status_repository.dart';
import 'package:mobile_advanced_project_fe/features/status/domain/usecases/user_get_statuses.dart';
import 'package:mobile_advanced_project_fe/features/status/presentation/bloc/status_bloc.dart';

part 'init_dependencies.main.dart';
