part of 'auth_request_model_dependencies.dart';

class ConfirmRegisterRequestModel {
  final String token;

  ConfirmRegisterRequestModel({required this.token});

  Map<String, dynamic> toJson() => {
        "token": token,
      };
}
