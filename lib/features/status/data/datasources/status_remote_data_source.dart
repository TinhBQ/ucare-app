import 'package:mobile_advanced_project_fe/core/api/api.dart';
import 'package:mobile_advanced_project_fe/core/enum/enum.dart';
import 'package:mobile_advanced_project_fe/core/exceptions/exceptions.dart';
import 'package:mobile_advanced_project_fe/core/items/items.dart';
import 'package:mobile_advanced_project_fe/core/model/request_models/base_get_request_model.dart';
import 'package:mobile_advanced_project_fe/core/model/response_models/response_models.dart';

abstract interface class StatusRemoteDataSource {
  Future<StatusGetItem?> getListStatus(BaseGetRequestModel params);
}

class StatusRemoteDataSourceImpl implements StatusRemoteDataSource {
  StatusRemoteDataSourceImpl();

  @override
  Future<StatusGetItem?> getListStatus(BaseGetRequestModel params) async {
    StatusGetResponseModel response = await StatusApi.getStatuses(params);
    return response.status == StatusResponse.success.name
        ? response.responseData
        : throw ServerException(ServerException.GET_FAIL);
  }
}
