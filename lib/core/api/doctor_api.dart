part of 'api_dependencies.dart';

class DoctorApi {
  static getListDoctor(DoctorGetRequestModel params) async {
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
