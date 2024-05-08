import 'package:mobile_advanced_project_fe/core/api/api_dependencies.dart';
import 'package:mobile_advanced_project_fe/core/enum/enum_dependencies.dart';
import 'package:mobile_advanced_project_fe/core/exceptions/exceptions.dart';
import 'package:mobile_advanced_project_fe/core/items/item_dependencies.dart';
import 'package:mobile_advanced_project_fe/core/model/request_models/request_models.dart';
import 'package:mobile_advanced_project_fe/core/model/response_models/response_models.dart';

abstract interface class PatientScheduleRemoteDataSource {
  Future<PatientScheduleGetItem?> getListPatientSchedule(
      BaseGetRequestModel params);

  Future<String> onCancel(ScheduleCancelRequestModel params);
}

class PatientScheduleRemoteDataSourceImpl
    implements PatientScheduleRemoteDataSource {
  PatientScheduleRemoteDataSourceImpl();

  @override
  Future<PatientScheduleGetItem?> getListPatientSchedule(
      BaseGetRequestModel params) async {
    PatientScheduleGetResponseModel response =
        await PatientScheduleApi.getListPatientSchedule(params);
    return response.status == StatusResponse.success.name
        ? response.responseData
        : throw ServerException(ServerException.GET_FAIL);
  }

  @override
  Future<String> onCancel(ScheduleCancelRequestModel params) async {
    BaseReponseModel response =
        await PatientScheduleApi.onCancel(params);

    return response.status == StatusResponse.success.name
        ? 'Hủy thành công!'
        : throw ServerException(ServerException.CONFIRM_SIGN_UP_FAILUARE);
  }
}
