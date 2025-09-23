import 'package:dartz/dartz.dart';
import 'package:movie_app/core/errors/exceptions.dart';
import 'package:movie_app/core/errors/failure.dart';
import 'package:movie_app/features/tabs/browse_tab/data/data_sourse/remote/browse_tab_remote_api_data_sourse.dart';
import 'package:movie_app/features/tabs/browse_tab/data/model/browse_response.dart';
import 'package:movie_app/features/tabs/browse_tab/data/model/genres_response.dart';

class BrowseTabRepository {
  final BrowesTabRemoteApiDataSourse _apiDataSource =
      BrowesTabRemoteApiDataSourse();

  Future<Either<Failure, BrowseResponse>> getMovies(
    String categoryId,
    int pageNum,
  ) async {
    try {
      final response = await _apiDataSource.getMoviesByCategory(
        categoryId,
        pageNum,
      );
      return Right(response);
    } on BrowseException catch (exception) {
      return Left(Failure(exception.message));
    }
  }

  Future<Either<Failure, GenresResponse>> getGenres() async {
    try {
      final moviesResponse = await _apiDataSource.getMoviesByCategory(null, 1);
      final _genres = <String>{};
      for (var movie in moviesResponse.data?.movies??[]) {
        _genres.addAll(movie.genres ?? []);
      }
      final genresData = GenresData(
        genres: _genres.map((name) => Genre(name: name)).toList(),
      );
      return Right(
        GenresResponse(data: genresData, status: 'ok', statusMessage: 'OK'),
      );
    } on BrowseException catch (exception) {
      return Left(Failure(exception.message));
    }
  }
}

