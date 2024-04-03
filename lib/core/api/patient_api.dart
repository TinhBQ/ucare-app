import 'package:mobile_advanced_project_fe/core/model/response_models/response_models.dart';
import 'package:mobile_advanced_project_fe/core/utils/http_util.dart';
import 'package:mobile_advanced_project_fe/core/values/constant.dart';

import '../exceptions/exceptions.dart';
import '../exceptions/http_status_code.dart';
import '../model/request_models/request_models.dart';

class PatientApi {
  static getListPatient(BaseGetRequestModel params) async {
    try {
      var response = await HttpUtil().get(
        AppConstants.SERVER_PATIENT,
        queryParameters: params.toJson(),
      );
      if (response.statusCode == HttpStatusCode.OK) {
        return PatientGetResponseModel.fromJson(response.data);
      } else {
        throw ServerException(ServerException.GET_PATIENT_FAILURE);
      }
    } catch (e) {
      throw ServerException(ServerException.GET_PATIENT_FAILURE);
    }
  }
}
