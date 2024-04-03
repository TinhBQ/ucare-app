import '../../enum/status_response.dart';
import '../../items/items.dart';
import 'base_response_model.dart';

class PatientGetResponseModel extends BaseReponseModel<PatientGetItem> {
  PatientGetResponseModel({
    required super.message,
    required super.responseData,
    required super.status,
    required super.timeStamp,
    required super.violations,
  });

  @override
  factory PatientGetResponseModel.fromJson(Map<String, dynamic> json) =>
      PatientGetResponseModel(
        message: json["message"] ?? '',
        responseData: PatientGetItem.fromJson(json["responseData"]),
        status: json["status"] ?? StatusResponse.fail.name,
        timeStamp: json["timeStamp"] ?? '',
        violations: json["violations"],
      );
}
