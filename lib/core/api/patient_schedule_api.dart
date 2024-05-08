// ignore_for_file: non_constant_identifier_names

part of 'api_dependencies.dart';

class PatientScheduleApi {
  static getListPatientSchedule(BaseGetRequestModel params) async {
    try {
      var response = await HttpUtil().get(
        AppConstants.SERVER_PATIENT_SCHEDULE,
        queryParameters: params.toJson(),
      );

      if (response.statusCode == HttpStatusCode.OK) {
        return PatientScheduleGetResponseModel.fromJson(response.data);
      } else {
        throw ServerException(ServerException.GET_FAIL);
      }
    } catch (e) {
      throw ServerException(ServerException.GET_FAIL);
    }
  }

  static onCancel(ScheduleCancelRequestModel params) async {
    try {
      var response = await HttpUtil().put(
        '${AppConstants.SERVER_PATIENT_SCHEDULE}/${params.id}',
        mydata: params.toJson(),
      );

      if (response.statusCode == HttpStatusCode.OK) {
        return BaseReponseModel.fromJson(response.data);
      } else {
        throw ServerException(ServerException.GET_FAIL);
      }
    } catch (e) {
      throw ServerException(ServerException.GET_FAIL);
    }
  }
}
