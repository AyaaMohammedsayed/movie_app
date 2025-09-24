import 'package:dartz/dartz.dart';
import 'package:movie_app/core/errors/exceptions.dart';
import 'package:movie_app/core/errors/failure.dart';
import 'package:movie_app/features/tabs/home_tab/data/data_source/remote/movie_remote_api_data_source.dart';
import 'package:movie_app/features/tabs/home_tab/data/model/movie/movie_response/movie_response.dart';


class MovieRepository {
  final MovieRemoteApiDataSource remoteDataSource = MovieRemoteApiDataSource();

  Future<Either<Failure, MovieResponse>> getMovieList() async {
    try {
      final response = await remoteDataSource.getMovieList();
      return Right(response);
    } on MovieListsException catch (e) {
      return Left(Failure(e.message));
    } catch (e) {
      return Left(Failure("Unknown error"));
    }
  }
}
