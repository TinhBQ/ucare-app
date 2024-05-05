part of './response_models.dart';

class BaseReponseModel<Item> {
  final String message;
  final Item? responseData;
  final String status;
  final String timeStamp;
  final dynamic violations;

  BaseReponseModel({
    required this.message,
    required this.responseData,
    required this.status,
    required this.timeStamp,
    required this.violations,
  });

  factory BaseReponseModel.fromJson(Map<String, dynamic> json) =>
      BaseReponseModel(
        message: json["message"] ?? '',
        responseData: json["responseData"],
        status: json["status"] ?? StatusResponse.fail.name,
        timeStamp: json["timeStamp"] ?? '',
        violations: json["violations"],
      );
}
