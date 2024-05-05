part of 'response_models.dart';

class ScheduleGetResponseModel extends BaseReponseModel<ScheduleGetItem> {
  ScheduleGetResponseModel({
    required super.message,
    required super.responseData,
    required super.status,
    required super.timeStamp,
    required super.violations,
  });

  @override
  factory ScheduleGetResponseModel.fromJson(Map<String, dynamic> json) =>
      ScheduleGetResponseModel(
        message: json["message"] ?? '',
        responseData: ScheduleGetItem.fromJson(json["responseData"]),
        status: json["status"] ?? StatusResponse.fail.name,
        timeStamp: json["timeStamp"] ?? '',
        violations: json["violations"],
      );
}
