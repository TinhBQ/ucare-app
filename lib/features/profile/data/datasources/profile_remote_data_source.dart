
import 'package:dio/dio.dart';
import 'package:mobile_advanced_project_fe/core/api/api_dependencies.dart';
import 'package:mobile_advanced_project_fe/core/enum/enum_dependencies.dart';
import 'package:mobile_advanced_project_fe/core/exceptions/exceptions.dart';
import 'package:mobile_advanced_project_fe/core/items/item_dependencies.dart';
import 'package:mobile_advanced_project_fe/core/model/request_models/request_models.dart';
import 'package:mobile_advanced_project_fe/core/model/response_models/response_models.dart';
import 'package:mobile_advanced_project_fe/core/utils/utils_dependencies.dart';

abstract interface class ProfileRemoteDataSource {
  Future<String> changePassWord(ChangePasswordRequestModel body);
  Future<UserItem?> changeProfile(UserItem body);

  Future<FileItem?> uploadAvatar(FormData formData);
}

class ProfileRemoteDataSourceImpl implements ProfileRemoteDataSource {
  ProfileRemoteDataSourceImpl();

  @override
  Future<String> changePassWord(ChangePasswordRequestModel body) async {
    BaseReponseModel response = await UserApi.changePassword(body);

    return response.status == StatusResponse.success.name
        ? InforMassage.CHANGE_PASSWORD_SUCCESS
        : throw ServerException(ServerException.CHANGE_PASSWORD_FAILURE);
  }

  @override
  Future<UserItem?> changeProfile(UserItem body) async {
    UserResponeModel response = await UserApi.changeProfile(body);

    return response.status == StatusResponse.success.name
        ? response.responseData
        : throw ServerException(ServerException.CHANGE_PROFILE_FAILURE);
  }

  @override
  Future<FileItem?> uploadAvatar(FormData formData) async {
    FileGetResponseModel response = await UserApi.uploadAvatar(formData);

    return response.status == StatusResponse.success.name
        ? response.responseData
        : throw ServerException(ServerException.GET_FAIL);
  }
}
