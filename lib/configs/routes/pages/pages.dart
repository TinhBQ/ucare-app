import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_advanced_project_fe/features/patient/presentation/pages/patient_create_profile.dart';

import 'package:mobile_advanced_project_fe/global.dart';

import 'package:mobile_advanced_project_fe/core/items/item_dependencies.dart';
import 'package:mobile_advanced_project_fe/core/entities/entity_dependencies.dart';
import 'package:mobile_advanced_project_fe/core/utils/utils_dependencies.dart';

import 'package:mobile_advanced_project_fe/features/application/presentation/pages/application_page.dart';
import 'package:mobile_advanced_project_fe/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:mobile_advanced_project_fe/features/auth/presentation/pages/pages.dart';
import 'package:mobile_advanced_project_fe/features/book/presentation/pages/book_by_specialty_page.dart';
import 'package:mobile_advanced_project_fe/features/deparment/presentation/pages/pages.dart';
import 'package:mobile_advanced_project_fe/features/doctor/presentation/pages/pages.dart';
import 'package:mobile_advanced_project_fe/features/history_booking/presentation/pages/history_book_page.dart';
import 'package:mobile_advanced_project_fe/features/home/presentation/pages/home_page.dart';
import 'package:mobile_advanced_project_fe/features/medicine_schedule/presentation/pages/pages.dart';
import 'package:mobile_advanced_project_fe/features/profile/presentation/pages/pages.dart';
import 'package:mobile_advanced_project_fe/features/session_of_day/presentation/pages/pages.dart';
import 'package:mobile_advanced_project_fe/features/splash/presentation/splash_page.dart';
import 'package:mobile_advanced_project_fe/features/book/presentation/pages/book_payment_confirm_page.dart';
import 'package:mobile_advanced_project_fe/features/book/presentation/pages/choose_date_medical_page.dart';
import 'package:mobile_advanced_project_fe/features/book/presentation/pages/choose_exam_info_page.dart';
import 'package:mobile_advanced_project_fe/features/book/presentation/pages/vnpay_page.dart';
import 'package:mobile_advanced_project_fe/features/patient/presentation/pages/patient_choose_profile_page.dart';
import 'package:mobile_advanced_project_fe/features/schedule/presentation/pages/schedule_choose_doctor_exam_page.dart';

import '../names/names.dart';

part './app_pages.dart';
part './book_pages.dart';
