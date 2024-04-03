import 'package:fpdart/fpdart.dart';
import 'package:mobile_advanced_project_fe/core/exceptions/exceptions.dart';
import 'package:mobile_advanced_project_fe/core/exceptions/failures.dart';
import 'package:mobile_advanced_project_fe/core/items/items.dart';
import 'package:mobile_advanced_project_fe/core/model/request_models/request_models.dart';

import '../../domain/repository/patient_schedule_repository.dart';
import '../datasources/patient_schedule_remote_data_source.dart';

class PatientScheduleRepositoryImpl implements PatientScheduleRepository {
  final PatientScheduleRemoteDataSource patientScheduleRemoteDataSource;

  PatientScheduleRepositoryImpl(this.patientScheduleRemoteDataSource);

  @override
  Future<Either<Failure, PatientScheduleGetItem>> getListPatientSchedule(
      BaseGetRequestModel params) async {
    try {
      final patientScheduleGetItem =
          await patientScheduleRemoteDataSource.getListPatientSchedule(params);
      return right(patientScheduleGetItem!);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }
}
