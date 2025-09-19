import 'package:movie_app/features/details_screen/data/model/movie_details_response/details_data.dart';
import 'package:movie_app/features/details_screen/data/model/movie_suggestions_response/suggestions_data.dart';

abstract class MovieDetailsState {}

class MovieDetailsInit extends MovieDetailsState {}

class MovieDetailsLoading extends MovieDetailsState {}

class MovieDetailsSuccess extends MovieDetailsState {
  final DetailsData dData;

  MovieDetailsSuccess(this.dData);
}

class MovieDetailsError extends MovieDetailsState {
  final String message;

  MovieDetailsError(this.message);
}

class MovieSuggestionsLoading extends MovieDetailsState {}

class MovieSuggestionsSuccess extends MovieDetailsState {
  final SuggestionsData sData;

  MovieSuggestionsSuccess(this.sData);
}

class MovieSuggestionsError extends MovieDetailsState {
  final String message;

  MovieSuggestionsError(this.message);
}
