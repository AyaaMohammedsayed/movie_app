import 'data.dart';


class MovieResponse {
	String? status;
	String? statusMessage;
	Data? data;


	MovieResponse({this.status, this.statusMessage, this.data});

	factory MovieResponse.fromJson(Map<String, dynamic> json) => MovieResponse(
				status: json['status'] as String?,
				statusMessage: json['status_message'] as String?,
				data: json['data'] == null
						? null
						: Data.fromJson(json['data'] as Map<String, dynamic>),

			);

	Map<String, dynamic> toJson() => {
				'status': status,
				'status_message': statusMessage,
				'data': data?.toJson(),
		
			};
}
