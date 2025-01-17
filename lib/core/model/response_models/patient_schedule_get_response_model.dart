part of 'response_models.dart';

class PatientScheduleGetResponseModel
    extends BaseReponseModel<PatientScheduleGetItem> {
  PatientScheduleGetResponseModel({
    required super.message,
    required super.responseData,
    required super.status,
    required super.timeStamp,
    required super.violations,
  });

  @override
  factory PatientScheduleGetResponseModel.fromJson(Map<String, dynamic> json) {
    return PatientScheduleGetResponseModel(
      message: json["message"] ?? '',
      responseData: PatientScheduleGetItem.fromJson(json["responseData"]),
      status: json["status"] ?? StatusResponse.fail.name,
      timeStamp: json["timeStamp"] ?? '',
      violations: json["violations"],
    );
  }
}
