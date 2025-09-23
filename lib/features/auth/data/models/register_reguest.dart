class RegisterReguest {
  final String name;
  final String email;
  final String password;
  final String phone;
  final int avaterId;

  const RegisterReguest({
    required this.name,
    required this.email,
    required this.password,
    required this.phone,
    this.avaterId = 1,
  });

  Map<String, dynamic> toJson() => {
    "name": name,
    "email": email,
    "password": password,
    "confirmPassword": password,
    "phone": phone,
    "avaterId": avaterId,
  };
}
