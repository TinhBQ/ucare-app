import '../exceptions/exceptions.dart';
import '../exceptions/http_status_code.dart';
import '../model/response_models/response_models.dart';
import '../utils/utils.dart';
import '../values/constant.dart';

class CountryApi {
  static getCountries() async {
    try {
      var response = await HttpUtil().get(
        AppConstants.SERVER_ALL_COUNTRY,
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
