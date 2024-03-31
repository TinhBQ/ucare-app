import 'package:mobile_advanced_project_fe/core/api/api.dart';
import 'package:mobile_advanced_project_fe/core/enum/enum.dart';
import 'package:mobile_advanced_project_fe/core/exceptions/exceptions.dart';
import 'package:mobile_advanced_project_fe/core/items/items.dart';
import 'package:mobile_advanced_project_fe/core/model/request_models/request_models.dart';
import 'package:mobile_advanced_project_fe/core/model/response_models/response_models.dart';

abstract interface class SessionOfDayDataSourceRemoteDataSource {
  Future<SessionOfDayGetItem?> getListSessionOfDay(BaseGetRequestModel params);
}

class SessionOfDayRemoteDataSourceImpl
    implements SessionOfDayDataSourceRemoteDataSource {
  SessionOfDayRemoteDataSourceImpl();

  @override
  Future<SessionOfDayGetItem?> getListSessionOfDay(
      BaseGetRequestModel params) async {
    SessionOfDayGetResponseModel response =
        await SessionOfDayApi.getListSessionOfDay(params);

    return response.status == StatusResponse.success.name
        ? response.responseData
        : throw ServerException(ServerException.GET_SESSION_OF_DAY_FAILURE);
  }
}
