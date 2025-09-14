import 'package:movie_app/features/tabs/search_tab/data/model/movie.dart';

abstract class SearchState {}

class SearchInit extends SearchState {}

class SearchLoading extends SearchState {}

class SearchSuccess extends SearchState {
  final List<Movie>? movies;
  SearchSuccess(this.movies);
  @override
  List<Object?> get props => [movies];
}

class SearchError extends SearchState {
  final String message;

  SearchError(this.message);
}
