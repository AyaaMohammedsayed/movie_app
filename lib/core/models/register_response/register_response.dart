import 'data.dart';

class RegisterResponse {
  String? message;
  Data? data;

  RegisterResponse({this.message, this.data});

  factory RegisterResponse.fromJson(Map<String, dynamic> json) {
    String? parseMessage(dynamic value) {
      if (value is List) return value.join(', '); 
      return value as String?;
    }

    return RegisterResponse(
      message: parseMessage(json['message']),
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
        'message': message,
        'data': data?.toJson(),
      };
}