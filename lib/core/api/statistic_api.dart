part of 'api_dependencies.dart';

class StatisticApi {
  static getDepartmegetUserMonthToMonthnts(
      StatisticMonthToMonthRequestModel params) async {
    try {
      var response = await HttpUtil().get(
        AppConstants.SERVER_STATISTIC_MONTH_TO_MONTH,
        queryParameters: params.toJson(),
      );

      if (response.statusCode == HttpStatusCode.OK) {
        return StatisticMonthToMonthResponseModel.fromJson(response.data);
      } else {
        throw ServerException(ServerException.GET_FAIL);
      }
    } catch (e) {
      throw ServerException(ServerException.GET_FAIL);
    }
  }
}
