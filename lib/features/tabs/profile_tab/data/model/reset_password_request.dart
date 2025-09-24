class ResetPasswordRequest {
  String oldPassword;
  String newPassword;
  ResetPasswordRequest({required this.newPassword, required this.oldPassword});

  Map<String, dynamic> toJson() => {
    "oldPassword": oldPassword,
    "newPassword": newPassword,
  };
}
