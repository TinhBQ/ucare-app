class ConfirmRegisterRequestModel {
  final String token;

  ConfirmRegisterRequestModel({required this.token});

  Map<String, dynamic> toJson() => {
        "token": token,
      };
}
