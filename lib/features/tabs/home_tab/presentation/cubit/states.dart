import 'package:movie_app/features/auth/data/model/login_response.dart';
import 'package:movie_app/features/auth/data/model/register_response.dart';
import 'package:movie_app/features/tabs/home_tab/data/model/movie/movie_response/movie_response.dart';

abstract class MovieState {}

class MovieInit extends MovieState {}

class GetMovieLoading extends MovieState {}

class GetMovieSuccess extends MovieState {
  final MovieResponse getMovieResponse;

  GetMovieSuccess(this.getMovieResponse);
}

class  GetMovieError extends MovieState {
  final String message;

  GetMovieError(this.message);
}
