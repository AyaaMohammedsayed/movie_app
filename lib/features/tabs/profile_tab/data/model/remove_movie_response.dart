class RemoveMovieResponse {
  	String? message;
	

	RemoveMovieResponse({this.message});

	factory RemoveMovieResponse.fromJson(Map<String, dynamic> json) => RemoveMovieResponse(
				message: json['message'] as String?,
		
			);

	Map<String, dynamic> toJson() => {
		
			};


}