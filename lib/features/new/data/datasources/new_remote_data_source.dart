import 'package:mobile_advanced_project_fe/core/api/api_dependencies.dart';
import 'package:mobile_advanced_project_fe/core/enum/enum_dependencies.dart';
import 'package:mobile_advanced_project_fe/core/exceptions/exceptions.dart';
import 'package:mobile_advanced_project_fe/core/items/item_dependencies.dart';
import 'package:mobile_advanced_project_fe/core/model/request_models/request_models.dart';
import 'package:mobile_advanced_project_fe/core/model/response_models/response_models.dart';

abstract interface class NewRemoteDataSource {
  Future<NewGetItem?> getListNew(BaseGetRequestModel params);
}

class NewRemoteDataSourceImpl implements NewRemoteDataSource {
  NewRemoteDataSourceImpl();

  @override
  Future<NewGetItem?> getListNew(BaseGetRequestModel params) async {
    NewGetResponseModel response = await NewApi.getListNew(params);
    return response.status == StatusResponse.success.name
        ? response.responseData
        : throw ServerException(ServerException.GET_FAIL);
  }
}
