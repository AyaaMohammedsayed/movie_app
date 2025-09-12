import 'package:movie_app/features/details_screen/data/model/movie_details_request.dart';
import 'package:movie_app/features/details_screen/data/model/movie_details_response/movie_details_response.dart';
import 'package:movie_app/features/details_screen/data/model/movie_suggestions_response/movie_suggestions_response.dart';

abstract class MovieDetailsRemoteDataSource {
  Future<MovieDetailsResponse> getMovieDetails(MovieDetailsRequest request);
  Future<MovieSuggestionsResponse> getMovieSuggestions(String movieID);
}
