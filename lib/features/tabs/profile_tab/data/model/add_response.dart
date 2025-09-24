import 'data.dart';

class AddResponse {
	String? message;
	Data? data;

	AddResponse({this.message, this.data});

	factory AddResponse.fromJson(Map<String, dynamic> json) => AddResponse(
				message: json['message'] as String?,
				data: json['data'] == null
						? null
						: Data.fromJson(json['data'] as Map<String, dynamic>),
			);

	Map<String, dynamic> toJson() => {
				'message': message,
				'data': data?.toJson(),
			};
}
