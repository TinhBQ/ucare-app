import 'package:mobile_advanced_project_fe/core/api/api.dart';
import 'package:mobile_advanced_project_fe/core/enum/enum.dart';
import 'package:mobile_advanced_project_fe/core/exceptions/exceptions.dart';
import 'package:mobile_advanced_project_fe/core/items/items.dart';
import 'package:mobile_advanced_project_fe/core/model/request_models/request_models.dart';
import 'package:mobile_advanced_project_fe/core/model/response_models/response_models.dart';

abstract interface class PatientRemoteDataSource {
  Future<PatientGetItem?> getListPatient(BaseGetRequestModel params);
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
}
