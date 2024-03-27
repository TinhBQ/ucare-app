import 'package:mobile_advanced_project_fe/core/api/api.dart';
import 'package:mobile_advanced_project_fe/core/enum/status_response.dart';
import 'package:mobile_advanced_project_fe/core/exceptions/exceptions.dart';
import 'package:mobile_advanced_project_fe/core/model/request_models/request_models.dart';
import 'package:mobile_advanced_project_fe/core/model/response_models/response_models.dart';
import 'package:mobile_advanced_project_fe/core/utils/utils.dart';

abstract interface class ProfileRemoteDataSource {
  Future<String> changePassWord(ChangePasswordRequestModel body);
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
}
