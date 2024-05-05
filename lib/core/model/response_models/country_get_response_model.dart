part of './response_models.dart';

class CountryGetResponseModel extends BaseReponseModel<CountryGetItem> {
  CountryGetResponseModel({
    required super.message,
    required super.responseData,
    required super.status,
    required super.timeStamp,
    required super.violations,
  });

  @override
  factory CountryGetResponseModel.fromJson(Map<String, dynamic> json) =>
      CountryGetResponseModel(
        message: json["message"] ?? '',
        responseData: CountryGetItem.fromJson(json["responseData"]),
        status: json["status"] ?? StatusResponse.fail.name,
        timeStamp: json["timeStamp"] ?? '',
        violations: json["violations"],
      );
}
