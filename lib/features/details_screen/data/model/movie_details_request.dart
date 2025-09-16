class MovieDetailsRequest {
  final String movieId;
  final String withImages;
  final String withCast;

  MovieDetailsRequest({
    required this.movieId,
    required this.withImages,
    required this.withCast,
  });
  Map<String, dynamic> toJson() => {
    "movie_id": movieId,
    "with_images": withImages,
    "with_cast": withCast,
  };
}
