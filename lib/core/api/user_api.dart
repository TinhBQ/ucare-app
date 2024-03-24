import '../exceptions/exceptions.dart';
import '../exceptions/http_status_code.dart';
import '../model/response_models/response_models.dart';
import '../utils/http_util.dart';
import '../values/constant.dart';

class UserApi {
  static getInfo() async {
    try {
      var response = await HttpUtil().get(
        AppConstants.SERVER_GET_INFO,
      );

      if (response.statusCode == HttpStatusCode.OK) {
        return UserResponeModel.fromJson(response.data);
      } else {
        throw ServerException(ServerException.GET_INFO_FAILUARE);
      }
    } catch (e) {
      throw ServerException(ServerException.GET_INFO_FAILUARE);
    }
  }
}
