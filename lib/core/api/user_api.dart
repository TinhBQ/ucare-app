part of 'api_dependencies.dart';

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

  static changePassword(ChangePasswordRequestModel body) async {
    try {
      var response = await HttpUtil().patch(
        AppConstants.SERVER_CHANGE_PASSWORD,
        mydata: body.toJson(),
      );

      if (response.statusCode == HttpStatusCode.OK) {
        return BaseReponseModel.fromJson(response.data);
      } else {
        throw ServerException(ServerException.CHANGE_PASSWORD_FAILURE);
      }
    } catch (e) {
      throw ServerException(ServerException.GET_INFO_FAILUARE);
    }
  }

  static changeProfile(UserItem body) async {
    try {
      var response = await HttpUtil().patch(
        AppConstants.SERVER_CHANGE_INFO,
        mydata: body.updateFofileToJson(),
      );

      if (response.statusCode == HttpStatusCode.OK) {
        return UserResponeModel.fromJson(response.data);
      } else {
        throw ServerException(ServerException.CHANGE_PROFILE_FAILURE);
      }
    } catch (e) {
      throw ServerException(ServerException.CHANGE_PROFILE_FAILURE);
    }
  }
}
