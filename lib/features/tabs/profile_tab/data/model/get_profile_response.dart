import 'package:movie_app/features/auth/data/model/user.dart';

class GetProfileResponse {





	String? message;
	User? data;

	GetProfileResponse({this.message, this.data});

	factory GetProfileResponse.fromJson(Map<String, dynamic> json) {
		return GetProfileResponse(
			message: json['message'] as String?,
			data: json['data'] == null
						? null
						: User.fromJson(json['data'] as Map<String, dynamic>),
		);
	}



	Map<String, dynamic> toJson() => {
				'message': message,
				'data': data?.toJson(),
			};
}

