import 'package:fpdart/fpdart.dart';
import 'package:mobile_advanced_project_fe/core/exceptions/failures.dart';
import 'package:mobile_advanced_project_fe/core/model/request_models/request_models.dart';
import 'package:mobile_advanced_project_fe/core/usecase/usecase.dart';
import 'package:mobile_advanced_project_fe/features/book/domain/repository/medical_profile_repository.dart';

class UserCreatePatientProfile implements UseCase<String, CreatePatientRequestModel> {
  final MedicalProfileRepository medicalProfileRepository;
  UserCreatePatientProfile(this.medicalProfileRepository);

  @override
  Future<Either<Failure, String>> call(CreatePatientRequestModel body) async{
    return await medicalProfileRepository.createPatient(body);
  }
  
} 