import 'package:movie_app/features/tabs/browse_tab/data/model/movie_b.dart';

class Data {
  int? movieCount;
  int? limit;
  int? pageNumber;
  List<MovieB>? movies;

  Data({this.movieCount, this.limit, this.pageNumber, this.movies});

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    movieCount: json['movie_count'] as int?,
    limit: json['limit'] as int?,
    pageNumber: json['page_number'] as int?,
    movies:
        (json['movies'] as List<dynamic>?)
            ?.map((e) => MovieB.fromJson(e as Map<String, dynamic>))
            .toList(),
  );
}

