part of 'api_dependencies.dart';

class NewApi {
  static getListNew(BaseGetRequestModel params) async {
    try {
      var response = await HttpUtil().get(
        AppConstants.SERVER_NEW,
        queryParameters: params.toJson(),
      );
      if (response.statusCode == HttpStatusCode.OK) {
        print(1);
        return NewGetResponseModel.fromJson(response.data);
      } else {
        print(2);
        throw ServerException(ServerException.GET_FAIL);
      }
    } catch (e) {
      print(3);
      throw ServerException(ServerException.GET_FAIL);
    }
  }
}
