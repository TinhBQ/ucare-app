import '../../enum/status_response.dart';
import '../../items/items.dart';
import 'base_response_model.dart';

class StatusGetResponseModel extends BaseReponseModel<StatusGetItem> {
  StatusGetResponseModel({
    required super.message,
    required super.responseData,
    required super.status,
    required super.timeStamp,
    required super.violations,
  });

  @override
  factory StatusGetResponseModel.fromJson(Map<String, dynamic> json) =>
      StatusGetResponseModel(
        message: json["message"] ?? '',
        responseData: StatusGetItem.fromJson(json["responseData"]),
        status: json["status"] ?? StatusResponse.fail.name,
        timeStamp: json["timeStamp"] ?? '',
        violations: json["violations"],
      );
}
