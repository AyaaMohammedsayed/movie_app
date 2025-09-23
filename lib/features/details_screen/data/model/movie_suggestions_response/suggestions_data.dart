import 'movie.dart';

class SuggestionsData {
  int? movieCount;
  List<Movie>? movies;

  SuggestionsData({this.movieCount, this.movies});

  factory SuggestionsData.fromJson(Map<String, dynamic> json) =>
      SuggestionsData(
        movieCount: json['movie_count'] as int?,
        movies:
            (json['movies'] as List<dynamic>?)
                ?.map((e) => Movie.fromJson(e as Map<String, dynamic>))
                .toList(),
      );
}
