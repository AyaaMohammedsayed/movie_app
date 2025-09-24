import 'package:movie_app/features/tabs/home_tab/data/model/movie/movie_response/data.dart';

class GetMovieResponse {

  	String? message;
	Data? data;

	GetMovieResponse({this.message, this.data});

	factory GetMovieResponse.fromJson(Map<String, dynamic> json) => GetMovieResponse(
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