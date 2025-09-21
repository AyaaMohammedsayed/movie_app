import 'package:movie_app/core/constants/constant_api.dart';
import 'package:movie_app/core/errors/exceptions.dart';
import 'package:movie_app/features/details_screen/data/data_source/remote/movie_details_remote_data_source.dart';
import 'package:movie_app/features/details_screen/data/model/movie_details_request.dart';
import 'package:movie_app/features/details_screen/data/model/movie_details_response/movie_details_response.dart';
import 'package:movie_app/features/details_screen/data/model/movie_suggestions_response/movie_suggestions_response.dart';
import 'package:dio/dio.dart';

class MovieDetailsRemoteAPIDataSource implements MovieDetailsRemoteDataSource {
  final Dio _dio = Dio(
    BaseOptions(baseUrl: ConstantAPI.baseUrl, receiveDataWhenStatusError: true),
  );

  @override
  Future<MovieDetailsResponse> getMovieDetails(
    MovieDetailsRequest request,
  ) async {
    try {
      final response = await _dio.get(
        ConstantAPI.movieDetailsEndPoint,
        queryParameters: request.toJson(),
      );
      return MovieDetailsResponse.fromJson(response.data);
    } catch (exception) {
      String? message;
      if (exception is DioException) {
        message = exception.response?.data["status_message"];
        print(exception);
      }
      print(exception);
      throw MovieDetailsException(message ?? 'Failed to get movie details');
    }
  }

  @override
  Future<MovieSuggestionsResponse> getMovieSuggestions(String movieID) async {
    try {
      final response = await _dio.get(
        ConstantAPI.movieSuggestionsEndPoint,
        queryParameters: {"movie_id": movieID},
      );
      return MovieSuggestionsResponse.fromJson(response.data);
    } catch (exception) {
      String? message;
      if (exception is DioException) {
        message = exception.response?.data['status_message'];
      }
      print(exception);
      throw MovieSuggestionsException(
        message ?? 'Failed to get movie suggestions',
      );
    }
  }
}
