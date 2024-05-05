import 'package:mobile_advanced_project_fe/core/model/request_models/base_get_request_model.dart';

import '../exceptions/exceptions.dart';
import '../exceptions/http_status_code.dart';
import '../model/response_models/response_models.dart';
import '../utils/utils.dart';
import '../values/constant.dart';

class StatusApi {
  static getStatuses(BaseGetRequestModel params) async {
    try {
      var response = await HttpUtil().get(
        AppConstants.SERVER_STATUS,
        queryParameters: params.toJson(),
      );

      if (response.statusCode == HttpStatusCode.OK) {
        return StatusGetResponseModel.fromJson(response.data);
      } else {
        throw ServerException(ServerException.GET_FAIL);
      }
    } catch (e) {
      throw ServerException(ServerException.GET_FAIL);
    }
  }
}
