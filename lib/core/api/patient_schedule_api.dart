part of 'api_dependencies.dart';

class PatientScheduleApi {
  static getListPatientSchedule(BaseGetRequestModel params) async {
    try {
      var response = await HttpUtil().get(
        AppConstants.SERVER_PATIENT_SCHEDULE,
        queryParameters: params.toJson(),
      );

      print('bQT11 ${response.data}');
      if (response.statusCode == HttpStatusCode.OK) {
        print('bQT13 ${response.data}');
        return PatientScheduleGetResponseModel.fromJson(response.data);
      } else {
        print('bQT14 ${response.data}');
        throw ServerException(ServerException.GET_FAIL);
      }
    } catch (e) {
      print('bQT ${e.toString()}');
      throw ServerException(ServerException.GET_FAIL);
    }
  }
}
