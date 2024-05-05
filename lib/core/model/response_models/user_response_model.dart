part of 'response_models.dart';

class UserResponeModel extends BaseReponseModel<UserItem> {
  UserResponeModel({
    required super.message,
    required super.responseData,
    required super.status,
    required super.timeStamp,
    required super.violations,
  });

  @override
  factory UserResponeModel.fromJson(Map<String, dynamic> json) =>
      UserResponeModel(
        message: json["message"] ?? '',
        responseData: UserItem.fromJson(json["responseData"]),
        status: json["status"] ?? StatusResponse.fail.name,
        timeStamp: json["timeStamp"] ?? '',
        violations: json["violations"],
      );
}
