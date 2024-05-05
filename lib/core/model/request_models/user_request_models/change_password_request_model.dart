part of 'user_request_model_dependencies.dart';

class ChangePasswordRequestModel {
  final String oldPass;
  final String newPass;
  final String confirmPass;

  ChangePasswordRequestModel({
    required this.oldPass,
    required this.newPass,
    required this.confirmPass,
  });

  Map<String, dynamic> toJson() => {
        "oldPass": oldPass,
        "newPass": newPass,
        "confirmPass": confirmPass,
      };
}
