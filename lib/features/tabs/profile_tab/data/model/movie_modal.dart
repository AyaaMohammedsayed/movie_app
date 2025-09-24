class MovieModel {
  final int movieId;
  final String imgName;
  final String? movieName;
  final double rating;
  final double width;
  final double height;
  final String year;
  final int likes;
  final int comments;

  MovieModel({
    required this.movieId,
    required this.imgName,
    this.movieName,
    required this.rating,
    required this.width,
    required this.height,
    this.year = '',
    this.likes = 0,
    this.comments = 0,
  });
}
