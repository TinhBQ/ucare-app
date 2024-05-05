part of 'api_dependencies.dart';

class CountryApi {
  static getCountries() async {
    try {
      var response = await HttpUtil().get(
        AppConstants.SERVER_ALL_COUNTRY,
      );

      if (response.statusCode == HttpStatusCode.OK) {
        return CountryGetResponseModel.fromJson(response.data);
      } else {
        throw ServerException(ServerException.GET_FAIL);
      }
    } catch (e) {
      throw ServerException(ServerException.GET_FAIL);
    }
  }
}
