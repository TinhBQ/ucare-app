part of './response_models.dart';

class MyOrderGetResponseModel extends BaseReponseModel<MyOrderGetItem> {
  MyOrderGetResponseModel({
    required super.message,
    required super.responseData,
    required super.status,
    required super.timeStamp,
    required super.violations,
  });

  @override
  factory MyOrderGetResponseModel.fromJson(Map<String, dynamic> json) =>
      MyOrderGetResponseModel(
        message: json["message"] ?? '',
        responseData: MyOrderGetItem.fromJson(json["responseData"]),
        status: json["status"] ?? StatusResponse.fail.name,
        timeStamp: json["timeStamp"] ?? '',
        violations: json["violations"],
      );
}
