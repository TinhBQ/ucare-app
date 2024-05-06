import 'package:fpdart/fpdart.dart';
import 'package:mobile_advanced_project_fe/core/exceptions/exceptions.dart';
import 'package:mobile_advanced_project_fe/core/exceptions/failures.dart';
import 'package:mobile_advanced_project_fe/core/items/item_dependencies.dart';
import 'package:mobile_advanced_project_fe/core/model/request_models/request_models.dart';

import '../../domain/repository/patient_repository.dart';
import '../datasources/patient_remote_data_source.dart';

class PatientRepositoryImpl implements PatientRepository {
  final PatientRemoteDataSource patientRemoteDataSource;

  PatientRepositoryImpl(this.patientRemoteDataSource);

  @override
  Future<Either<Failure, PatientGetItem>> getListPatient(
      BaseGetRequestModel params) async {
    try {
      final patientGetItem =
          await patientRemoteDataSource.getListPatient(params);
      return right(patientGetItem!);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, String>> createPatient(
      CreatePatientRequestModel body) async {
    try {
      final message = await patientRemoteDataSource.createPatient(body);
      return right(message);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }
}
