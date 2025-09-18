import 'user.dart';

class LoginResponse {
  String message;
  User data;

  LoginResponse({required this.message, required this.data});

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      message: json['message'],
      data: User.fromJson(json['data'] as Map<String, dynamic>),
    );
  }
}
