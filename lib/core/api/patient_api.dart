part of 'api_dependencies.dart';

class PatientApi {
  static getListPatient(BaseGetRequestModel params) async {
    try {
      var response = await HttpUtil().get(
        AppConstants.SERVER_PATIENT,
        queryParameters: params.toJson(),
      );
      if (response.statusCode == HttpStatusCode.OK) {
        return PatientGetResponseModel.fromJson(response.data);
      } else {
        throw ServerException(ServerException.GET_PATIENT_FAILURE);
      }
    } catch (e) {
      throw ServerException(ServerException.GET_PATIENT_FAILURE);
    }
  }

  //create patient
  static createPatient(CreatePatientRequestModel params) async {
    try {
      var response = await HttpUtil().post(
        AppConstants.SERVER_PATIENT,
        mydata: params.toJson(),
      );
      if (response.statusCode == HttpStatusCode.OK) {
        return BaseReponseModel.fromJson(response.data);
      } else {
        throw ServerException(ServerException.CREATE_PATIENT_FAILURE);
      }
    } catch (e) {
      throw ServerException(ServerException.CREATE_PATIENT_FAILURE);
    }
  }

  //create patient
  static patientBookSchedule(PatientBookScheduleRequestModel body) async {
    try {
      var response = await HttpUtil().post(
        AppConstants.SERVER_PATIENT_BOOK_SCHEDULE,
        mydata: body.toJson(),
      );
      if (response.statusCode == HttpStatusCode.OK) {
        return BaseReponseModel.fromJson(response.data);
      } else {
        throw ServerException(ServerException.CREATE_PATIENT_FAILURE);
      }
    } catch (e) {
      throw ServerException(ServerException.CREATE_PATIENT_FAILURE);
    }
  }
}
