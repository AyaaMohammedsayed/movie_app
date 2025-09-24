import 'package:movie_app/features/auth/data/model/user.dart';



class UpdateResponse {
	String? message;
	User? data;

	UpdateResponse({this.message, this.data});

	factory UpdateResponse.fromJson(Map<String, dynamic> json) {
		return UpdateResponse(
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
