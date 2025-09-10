class LoginResponse {
	String? message;
	Map<String,dynamic>? data;

	LoginResponse({this.message, this.data});

	factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
				message: json['message'] as String?,
				data: json['data'] as Map<String,dynamic>?,
			);

	Map<String, dynamic> toJson() => {
				'message': message,
				'data': data,
			};
}
