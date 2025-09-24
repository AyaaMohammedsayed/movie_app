class IsFavResponse {
  	String? message;
	bool? data;

	IsFavResponse({this.message, this.data});

	factory IsFavResponse.fromJson(Map<String, dynamic> json) => IsFavResponse(
				message: json['message'] as String?,
				data: json['data'] as bool?
			);

	Map<String, dynamic> toJson() => {
				'message': message,
				'data': data,
			};
}