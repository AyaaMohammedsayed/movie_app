import 'package:dio/dio.dart';
import 'package:movie_app/core/constants/constant_api.dart';
import 'package:movie_app/core/errors/exceptions.dart';
import 'package:movie_app/features/tabs/browse_tab/data/data_sourse/remote/browse_tab_remote_data_sourse.dart';
import 'package:movie_app/features/tabs/browse_tab/data/model/browse_response.dart';

class BrowesTabRemoteApiDataSourse implements BrowseTabRemoteDataSourse {
  final Dio _dio = Dio(
    BaseOptions(baseUrl: ConstantAPI.baseUrl, receiveDataWhenStatusError: true),
  );

  @override
  Future<BrowseResponse> getMoviesByCategory(
    String? categoryId,
    int pageNumber,
  ) async {
    try {
      final response = await _dio.get(
        ConstantAPI.movieListEndPoint,
        queryParameters: {"genre": categoryId, "page": pageNumber},
      );
      return BrowseResponse.fromJson(response.data);
    } catch (exception) {
      String? message;
      if (exception is DioException) {
        message = exception.response?.data['status_message'];
      }
      throw BrowseException(message ?? "Failed to load movies");
    }
  }
}
