import '../../enum/status_response.dart';
import '../../items/items.dart';
import 'base_response_model.dart';

class DoctorGetResponseModel extends BaseReponseModel<DoctorGetItem> {
  DoctorGetResponseModel({
    required super.message,
    required super.responseData,
    required super.status,
    required super.timeStamp,
    required super.violations,
  });

  factory DoctorGetResponseModel.fromJson(Map<String, dynamic> json) =>
      DoctorGetResponseModel(
        message: json["message"] ?? '',
        responseData: DoctorGetItem.fromJson(json["responseData"]),
        status: json["status"] ?? StatusResponse.fail.name,
        timeStamp: json["timeStamp"] ?? '',
        violations: json["violations"],
      );
}
