import 'movie_details.dart';

class DetailsData {
  MovieDetailsList? movie;

  DetailsData({this.movie});

  factory DetailsData.fromJson(Map<String, dynamic> json) => DetailsData(
    movie:
        json['movie'] == null
            ? null
            : MovieDetailsList.fromJson(json['movie'] as Map<String, dynamic>),
  );
}
