class IsFavRequest {

int? movieId;
	String? name;
	double? rating;
	String? imageUrl;
	String? year;

	IsFavRequest({this.movieId, this.name, this.rating, this.imageUrl, this.year});

	factory IsFavRequest.fromJson(Map<String, dynamic> json) => IsFavRequest(
				movieId: json['movieId'] as int?,
				name: json['name'] as String?,
				rating: (json['rating'] as num?)?.toDouble(),
				imageUrl: json['imageURL'] as String?,
				year: json['year'] as String?,
			);

	Map<String, dynamic> toJson() => {
				'movieId': movieId,
				'name': name,
				'rating': rating,
				'imageURL': imageUrl,
				'year': year,
			};



}