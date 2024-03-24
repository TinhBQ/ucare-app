class ConfirmRegisterRequest {
  final String token;

  ConfirmRegisterRequest({required this.token});

  Map<String, dynamic> toJson() => {
        "token": token,
      };
}
