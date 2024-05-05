part of 'auth_request_model_dependencies.dart';

class CreateOTPRequestModel {
  final String email;

  CreateOTPRequestModel({required this.email});

  Map<String, dynamic> toJson() => {
        "email": email,
      };
}
