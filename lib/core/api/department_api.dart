part of 'api_dependencies.dart';

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
