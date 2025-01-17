// ignore_for_file: non_constant_identifier_names
part of 'auth_request_model_dependencies.dart';

class ForgotPasswordRequestModel {
  final String code;
  final String new_pass;
  final String confirm_pass;

  ForgotPasswordRequestModel({
    required this.code,
    required this.new_pass,
    required this.confirm_pass,
  });

  Map<String, dynamic> toJson() => {
        "code": code,
        "new_pass": new_pass,
        "confirm_pass": confirm_pass,
      };
}
