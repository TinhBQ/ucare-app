part of 'api_dependencies.dart';

class NewApi {
  static getListNew(BaseGetRequestModel params) async {
    try {
      var response = await HttpUtil().get(
        AppConstants.SERVER_NEW,
        queryParameters: params.toJson(),
      );
      if (response.statusCode == HttpStatusCode.OK) {
        return NewGetResponseModel.fromJson(response.data);
      } else {
        throw ServerException(ServerException.GET_FAIL);
      }
    } catch (e) {
      throw ServerException(ServerException.GET_FAIL);
    }
  }
}
