part of 'api_dependencies.dart';

class ScheduleApi {
  static getSchedule(ScheduleGetRequestModel params) async {
    try {
      var response = await HttpUtil().get(
        AppConstants.SERVER_SCHEDULE,
        queryParameters: params.toJson(),
      );

      if (response.statusCode == HttpStatusCode.OK) {
        return ScheduleGetResponseModel.fromJson(response.data);
      } else {
        throw ServerException(ServerException.GET_FAIL);
      }
    } catch (e) {
      throw ServerException(ServerException.GET_FAIL);
    }
  }
}
