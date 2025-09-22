import 'package:equatable/equatable.dart';
import 'package:movie_app/features/tabs/search_tab/data/model/movie.dart';

abstract class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object?> get props => [];
}

class SearchInit extends SearchState {}

class SearchLoading extends SearchState {}

class SearchError extends SearchState {
  final String message;
  const SearchError(this.message);

  @override
  List<Object?> get props => [message];
}

class SearchSuccess extends SearchState {
  final List<Movie> moviesList;
  final bool isPaginating;
  const SearchSuccess({required this.moviesList, required this.isPaginating});

  @override
  List<Object?> get props => [moviesList, isPaginating];
}
