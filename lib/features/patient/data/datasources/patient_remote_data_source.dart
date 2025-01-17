import 'package:mobile_advanced_project_fe/core/api/api_dependencies.dart';
import 'package:mobile_advanced_project_fe/core/enum/enum_dependencies.dart';
import 'package:mobile_advanced_project_fe/core/exceptions/exceptions.dart';
import 'package:mobile_advanced_project_fe/core/items/item_dependencies.dart';
import 'package:mobile_advanced_project_fe/core/model/request_models/request_models.dart';
import 'package:mobile_advanced_project_fe/core/model/response_models/response_models.dart';
import 'package:mobile_advanced_project_fe/core/utils/utils_dependencies.dart';

abstract interface class PatientRemoteDataSource {
  Future<PatientGetItem?> getListPatient(BaseGetRequestModel params);
  Future<String> createPatient(CreatePatientRequestModel body);

  Future<String> patientBookSchedule(PatientBookScheduleRequestModel body);
  Future<String> deletePatient(DeletePatientProfileRequestModel params);
}

class PatientRemoteDataSourceImpl implements PatientRemoteDataSource {
  PatientRemoteDataSourceImpl();

  @override
  Future<PatientGetItem?> getListPatient(BaseGetRequestModel params) async {
    PatientGetResponseModel response = await PatientApi.getListPatient(params);
    return response.status == StatusResponse.success.name
        ? response.responseData
        : throw ServerException(ServerException.GET_PATIENT_FAILURE);
  }

  @override
  Future<String> createPatient(CreatePatientRequestModel body) async {
    BaseReponseModel response = await PatientApi.createPatient(body);
    return response.status == StatusResponse.success.name
        ? InforMassage.CREATE_PATIENT_SUCCESS
        : throw ServerException(ServerException.CREATE_PATIENT_FAILURE);
  }

  @override
  Future<String> patientBookSchedule(
      PatientBookScheduleRequestModel body) async {
    BaseReponseModel response = await PatientApi.patientBookSchedule(body);
    return response.status == StatusResponse.success.name
        ? InforMassage.CREATE_PATIENT_SUCCESS
        : throw ServerException(ServerException.CREATE_PATIENT_FAILURE);
  }

  @override
  Future<String> deletePatient(DeletePatientProfileRequestModel params) async {
    BaseReponseModel response = await PatientApi.deletePatient(params);
    return response.status == StatusResponse.success.name
        ? InforMassage.DELETE_PATIENT_SUCCESS
        : throw ServerException(ServerException.DELETE_PATIENT_FAILURE);
  }
}
