import '../exceptions/exceptions.dart';
import '../exceptions/http_status_code.dart';
import '../model/request_models/request_models.dart';
import '../model/response_models/response_models.dart';
import '../utils/utils.dart';
import '../values/constant.dart';

class DepartmentApi {
  static getDepartments(BaseGetRequestModel params) async {
    try {
      var response = await HttpUtil().get(
        AppConstants.SERVER_DEPARTMENT,
        queryParameters: params.toJson(),
      );

      if (response.statusCode == HttpStatusCode.OK) {
        return DepartmentGetResponseModel.fromJson(response.data);
      } else {
        throw ServerException(ServerException.GET_DEPARTMENT_FAILURE);
      }
    } catch (e) {
      throw ServerException(ServerException.GET_DEPARTMENT_FAILURE);
    }
  }
}
