class LoginRequeest {
  final String email;
  final String password;

  const LoginRequeest({required this.email, required this.password});

  Map<String, dynamic> toJson() => {"email": email, "password": password};
}
