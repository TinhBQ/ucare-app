import 'package:fpdart/fpdart.dart';
import 'package:mobile_advanced_project_fe/core/exceptions/exceptions.dart';
import 'package:mobile_advanced_project_fe/core/exceptions/failures.dart';
import 'package:mobile_advanced_project_fe/core/model/request_models/patient_request_models/patient_request_model_dependencies.dart';
import 'package:mobile_advanced_project_fe/features/book/data/datasources/medical_profile_remote_data_source.dart';
import 'package:mobile_advanced_project_fe/features/book/domain/repository/medical_profile_repository.dart';

class MedicalProfileRepositoryImpl implements MedicalProfileRepository {
  final MedicalProfileRemoteDataSource medicalProfileRemoteDataSource;
  MedicalProfileRepositoryImpl(this.medicalProfileRemoteDataSource);

  @override
  Future<Either<Failure, String>> createPatient(
      CreatePatientRequestModel body) async {
    try {
      final message = await medicalProfileRemoteDataSource.createPatient(body);
      return right(message);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }
}
