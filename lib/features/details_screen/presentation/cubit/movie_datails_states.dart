import 'package:movie_app/features/details_screen/data/model/movie_details_response/details_data.dart';
import 'package:movie_app/features/details_screen/data/model/movie_suggestions_response/movie.dart';

abstract class MovieDetailsState {}

class MovieDetailsInit extends MovieDetailsState {}

class MovieDetailsLoading extends MovieDetailsState {}

class MovieDetailsSuccess extends MovieDetailsState {
  final DetailsData dData;
  final List<Movie> suggestions;

  MovieDetailsSuccess({required this.dData, this.suggestions = const []});

  MovieDetailsSuccess copyWith({DetailsData? dData, List<Movie>? suggestions}) {
    return MovieDetailsSuccess(
      dData: dData ?? this.dData,
      suggestions: suggestions ?? this.suggestions,
    );
  }
}

class MovieDetailsError extends MovieDetailsState {
  final String message;

  MovieDetailsError(this.message);
}
