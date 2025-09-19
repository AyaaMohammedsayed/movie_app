import 'package:dartz/dartz.dart';
import 'package:movie_app/core/errors/exceptions.dart';
import 'package:movie_app/core/errors/failure.dart';
import 'package:movie_app/features/details_screen/data/data_source/remote/movie_details_remote_api_data_source.dart';
import 'package:movie_app/features/details_screen/data/data_source/remote/movie_details_remote_data_source.dart';
import 'package:movie_app/features/details_screen/data/model/movie_details_request.dart';
import 'package:movie_app/features/details_screen/data/model/movie_details_response/details_data.dart';
import 'package:movie_app/features/details_screen/data/model/movie_suggestions_response/suggestions_data.dart';

class MovieDetailsRepository {
  final MovieDetailsRemoteDataSource _movieDetailsRemoteDataSource =
      MovieDetailsRemoteAPIDataSource();

  Future<Either<Failure, DetailsData>> getMovieDetails(
    MovieDetailsRequest request,
  ) async {
    try {
      final response = await _movieDetailsRemoteDataSource.getMovieDetails(
        request,
      );
      return Right(response.data!);
    } on AppException catch (exception) {
      return Left(Failure(exception.message));
    }
  }

  Future<Either<Failure, SuggestionsData>> getSuggestion(String movieID) async {
    try {
      final response = await _movieDetailsRemoteDataSource.getMovieSuggestions(
        movieID,
      );
      return Right(response.data!);
    } on AppException catch (exception) {
      return Left(Failure(exception.message));
    }
  }
}
