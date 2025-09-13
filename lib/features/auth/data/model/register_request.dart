class RegisterRequest {
  final String name;
  final String email;
  final String password;
  final String confirmPass;
  final String phone;
  final int avatarId;

  RegisterRequest({
    required this.name,
    required this.email,
    required this.password,
    required this.confirmPass,
    required this.phone,
    required this.avatarId,
  });

  Map<String, dynamic> toJson() => {
    "name": name,
    "email": email,
    "password": password,
    "confirmPassword": confirmPass,
    "phone": phone,
    "avaterId": avatarId,
  };
}
