part of 'response_models.dart';

class SessionOfDayGetResponseModel
    extends BaseReponseModel<SessionOfDayGetItem> {
  SessionOfDayGetResponseModel({
    required super.message,
    required super.responseData,
    required super.status,
    required super.timeStamp,
    required super.violations,
  });

  @override
  factory SessionOfDayGetResponseModel.fromJson(Map<String, dynamic> json) =>
      SessionOfDayGetResponseModel(
        message: json["message"] ?? '',
        responseData: SessionOfDayGetItem.fromJson(json["responseData"]),
        status: json["status"] ?? StatusResponse.fail.name,
        timeStamp: json["timeStamp"] ?? '',
        violations: json["violations"],
      );
}
