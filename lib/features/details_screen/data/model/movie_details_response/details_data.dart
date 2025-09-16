import 'movie.dart';

class DetailsData {
  Movie? movie;

  DetailsData({this.movie});

  factory DetailsData.fromJson(Map<String, dynamic> json) => DetailsData(
    movie:
        json['movie'] == null
            ? null
            : Movie.fromJson(json['movie'] as Map<String, dynamic>),
  );
}
