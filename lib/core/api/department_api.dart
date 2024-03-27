import '../exceptions/exceptions.dart';
import '../exceptions/http_status_code.dart';
import '../model/request_models/request_models.dart';
import '../model/response_models/response_models.dart';
import '../utils/utils.dart';
import '../values/constant.dart';

class DepartmentApi {
  static getDepartments(BaseGetRequestModel params) async {
    try {
      print('BQt');
      var response = await HttpUtil().get(
        AppConstants.SERVER_GET_DEPARTMENT,
        mydata: params.toJson(),
      );

      if (response.statusCode == HttpStatusCode.OK) {
        print('BQt 1');
        return DepartmentGetResponseModel.fromJson(response.data);
      } else {
        print('BQt 12');
        throw ServerException(ServerException.GET_DEPARTMENT_FAILURE);
      }
    } catch (e) {
      print('BQt 13');
      throw ServerException(ServerException.GET_DEPARTMENT_FAILURE);
    }
  }
}
