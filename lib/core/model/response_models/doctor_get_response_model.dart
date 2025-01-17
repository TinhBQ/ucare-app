part of './response_models.dart';
class DoctorGetResponseModel extends BaseReponseModel<DoctorGetItem> {
  DoctorGetResponseModel({
    required super.message,
    required super.responseData,
    required super.status,
    required super.timeStamp,
    required super.violations,
  });

  @override
  factory DoctorGetResponseModel.fromJson(Map<String, dynamic> json) =>
      DoctorGetResponseModel(
        message: json["message"] ?? '',
        responseData: DoctorGetItem.fromJson(json["responseData"]),
        status: json["status"] ?? StatusResponse.fail.name,
        timeStamp: json["timeStamp"] ?? '',
        violations: json["violations"],
      );
}
