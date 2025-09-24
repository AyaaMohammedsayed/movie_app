

import 'package:movie_app/features/tabs/home_tab/data/model/movie/movie_response/movie_response.dart';

abstract class MovieRemoteDataSource {
  Future<MovieResponse> getMovieList();
  

}
