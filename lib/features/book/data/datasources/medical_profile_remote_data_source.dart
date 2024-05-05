import 'package:mobile_advanced_project_fe/core/api/api.dart';
import 'package:mobile_advanced_project_fe/core/enum/status_response.dart';
import 'package:mobile_advanced_project_fe/core/exceptions/exceptions.dart';
import 'package:mobile_advanced_project_fe/core/model/request_models/request_models.dart';
import 'package:mobile_advanced_project_fe/core/model/response_models/base_response_model.dart';
import 'package:mobile_advanced_project_fe/core/utils/infor_massage.dart';

abstract interface class MedicalProfileRemoteDataSource {
  Future<String> createPatient(CreatePatientRequestModel body); 
}

class MedicalProfileRemoteDataSourceImpl implements MedicalProfileRemoteDataSource{
  MedicalProfileRemoteDataSourceImpl();
  
  @override
  Future<String> createPatient(CreatePatientRequestModel params) async{
    BaseReponseModel response = await PatientApi.createPatient(params);
    return response.status == StatusResponse.success.name
        ? InforMassage.CREATE_PATIENT_SUCCESS
        : throw ServerException(ServerException.CREATE_PATIENT_FAILURE);
  }
}