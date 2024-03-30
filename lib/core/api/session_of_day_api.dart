import '../exceptions/exceptions.dart';
import '../exceptions/http_status_code.dart';
import '../model/request_models/request_models.dart';
import '../model/response_models/response_models.dart';
import '../utils/utils.dart';
import '../values/constant.dart';

class SessionOfDayApi {
  static getListSessionOfDay(BaseGetRequestModel params) async {
    try {
      var response = await HttpUtil().get(
        AppConstants.SERVER_GET_SESSION_OF_DAY,
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
