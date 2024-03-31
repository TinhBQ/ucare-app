import 'package:mobile_advanced_project_fe/core/items/auth_item.dart';

import '../../enum/status_response.dart';
import 'base_response_model.dart';

class LoginResponeModel extends BaseReponseModel<AuthItem> {
  LoginResponeModel({
    required super.message,
    required super.responseData,
    required super.status,
    required super.timeStamp,
    required super.violations,
  });

  @override
  factory LoginResponeModel.fromJson(Map<String, dynamic> json) =>
      LoginResponeModel(
        message: json["message"] ?? '',
        responseData: AuthItem.fromJson(json["responseData"]),
        status: json["status"] ?? StatusResponse.fail.name,
        timeStamp: json["timeStamp"] ?? '',
        violations: json["violations"],
      );
}
