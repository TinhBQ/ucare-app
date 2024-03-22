class CreateOTPRequest {
  final String email;

  CreateOTPRequest({required this.email});

  Map<String, dynamic> toJson() => {
        "email": email,
      };
}
