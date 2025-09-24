import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:movie_app/core/constants/constant_api.dart';
import 'package:movie_app/core/errors/exceptions.dart';
import 'package:movie_app/features/tabs/home_tab/data/model/movie/movie_response/movie_response.dart';

class MovieRemoteApiDataSource {
  final Dio _dio = Dio(
    BaseOptions(baseUrl: ConstantAPI.baseUrl, receiveDataWhenStatusError: true,),
  );

  Future<MovieResponse> getMovieList() async {
    try {
      final response = await _dio.get(ConstantAPI.movieListEndPoint);

     
      final data = response.data is String ? json.decode(response.data) : response.data;



      final movieResponse = MovieResponse.fromJson(data);

      if (movieResponse.status != 'ok') {
        throw MovieListsException(movieResponse.statusMessage ?? "Failed to get movies");
      }

      return movieResponse;
    } on DioException catch (e) {
      print('DioException: ${e.response?.data}');
      throw MovieListsException(
          e.response?.data['status_message']?.toString() ?? "Failed to Get Movies");
    } catch (e) {
      print('Other exception: $e');
      throw MovieListsException("Failed to Get Movies");
    }
  }
}
