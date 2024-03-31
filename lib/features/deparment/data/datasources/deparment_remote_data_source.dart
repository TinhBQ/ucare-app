import 'package:mobile_advanced_project_fe/core/api/api.dart';
import 'package:mobile_advanced_project_fe/core/enum/enum.dart';
import 'package:mobile_advanced_project_fe/core/exceptions/exceptions.dart';
import 'package:mobile_advanced_project_fe/core/items/items.dart';
import 'package:mobile_advanced_project_fe/core/model/request_models/request_models.dart';
import 'package:mobile_advanced_project_fe/core/model/response_models/response_models.dart';

abstract interface class DepartmentRemoteDataSource {
  Future<DepartmentGetItem?> getDepartments(BaseGetRequestModel params);
}

class DepartmentRemoteDataSourceImpl implements DepartmentRemoteDataSource {
  DepartmentRemoteDataSourceImpl();

  @override
  Future<DepartmentGetItem?> getDepartments(BaseGetRequestModel params) async {
    DepartmentGetResponseModel response =
        await DepartmentApi.getDepartments(params);

    return response.status == StatusResponse.success.name
        ? response.responseData
        : throw ServerException(ServerException.GET_DEPARTMENT_FAILURE);
  }
}
