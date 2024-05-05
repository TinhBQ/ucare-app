part of 'api_dependencies.dart';

class SessionOfDayApi {
  static getListSessionOfDay(BaseGetRequestModel params) async {
    try {
      var response = await HttpUtil().get(
        AppConstants.SERVER_SESSION_OF_DAY,
        queryParameters: params.toJson(),
      );

      if (response.statusCode == HttpStatusCode.OK) {
        return SessionOfDayGetResponseModel.fromJson(response.data);
      } else {
        throw ServerException(ServerException.GET_SESSION_OF_DAY_FAILURE);
      }
    } catch (e) {
      throw ServerException(ServerException.GET_SESSION_OF_DAY_FAILURE);
    }
  }
}
