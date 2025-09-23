class DeleteResponse {


	String? message;

	DeleteResponse({this.message});

	factory DeleteResponse.fromJson(Map<String, dynamic> json) => DeleteResponse(
				message: json['message'] as String?,
			);

	Map<String, dynamic> toJson() => {
				'message': message,
			};


}