part of './response_models.dart';

class NewGetResponseModel extends BaseReponseModel<NewGetItem> {
  NewGetResponseModel({
    required super.message,
    required super.responseData,
    required super.status,
    required super.timeStamp,
    required super.violations,
  });

  @override
  factory NewGetResponseModel.fromJson(Map<String, dynamic> json) =>
      NewGetResponseModel(
        message: json["message"] ?? '',
        responseData: NewGetItem.fromJson(json["responseData"]),
        status: json["status"] ?? StatusResponse.fail.name,
        timeStamp: json["timeStamp"] ?? '',
        violations: json["violations"],
      );
}
