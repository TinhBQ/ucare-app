import '../../enum/status_response.dart';
import '../../items/items.dart';
import 'base_response_model.dart';

class DepartmentGetResponseModel extends BaseReponseModel<DepartmentGetItem> {
  DepartmentGetResponseModel({
    required super.message,
    required super.responseData,
    required super.status,
    required super.timeStamp,
    required super.violations,
  });

  factory DepartmentGetResponseModel.fromJson(Map<String, dynamic> json) =>
      DepartmentGetResponseModel(
        message: json["message"] ?? '',
        responseData: DepartmentGetItem.fromJson(json["responseData"]),
        status: json["status"] ?? StatusResponse.fail.name,
        timeStamp: json["timeStamp"] ?? '',
        violations: json["violations"],
      );
}
