import 'package:movie_app/features/auth/data/model/user.dart';

class LoginResponse {
	String? message;
	User? data;

	LoginResponse({this.message, this.data});

	factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
				message: json['message'] as String?,
				 data: User.fromJson(json['data'] as Map<String, dynamic>),
			);

	Map<String, dynamic> toJson() => {
				'message': message,
				'data': data,
			};
}
