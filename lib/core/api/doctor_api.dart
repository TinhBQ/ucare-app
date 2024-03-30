import '../exceptions/exceptions.dart';
import '../exceptions/http_status_code.dart';
import '../model/request_models/request_models.dart';
import '../model/response_models/doctor_get_response_model.dart';
import '../utils/http_util.dart';
import '../values/constant.dart';

class DoctorApi {
  static getListDoctor(BaseGetRequestModel params) async {
    try {
      var response = await HttpUtil().get(
        AppConstants.SERVER_DOCTOR,
        queryParameters: params.toJson(),
      );

      if (response.statusCode == HttpStatusCode.OK) {
        return DoctorGetResponseModel.fromJson(response.data);
      } else {
        throw ServerException(ServerException.GET_DOCTOR_FAILURE);
      }
    } catch (e) {
      throw ServerException(ServerException.GET_DOCTOR_FAILURE);
    }
  }
}
