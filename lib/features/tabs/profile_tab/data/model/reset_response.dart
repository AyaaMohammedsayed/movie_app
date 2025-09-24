class ResetResponse {
	String? message;

	ResetResponse({this.message});

	factory ResetResponse.fromJson(Map<String, dynamic> json) => ResetResponse(
				message: json['message'] as String?,
			);

	Map<String, dynamic> toJson() => {
				'message': message,
			};
}
