class ChangePasswordRequest {
  final String oldPass;
  final String newPass;
  final String confirmPass;

  ChangePasswordRequest({
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
