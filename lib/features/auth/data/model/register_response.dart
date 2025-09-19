import 'user.dart';

class RegisterResponse {
  String message;
  User data;

  RegisterResponse({required this.message, required this.data});

  factory RegisterResponse.fromJson(Map<String, dynamic> json) {
    return RegisterResponse(
      message: json['message'],
      data: User.fromJson(json['data'] as Map<String, dynamic>),
    );
  }
}
