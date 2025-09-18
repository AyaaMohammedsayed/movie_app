import 'package:dio/dio.dart';
import 'package:movie_app/core/constants/constant_api.dart';
import 'package:movie_app/core/errors/exceptions.dart';
import 'package:movie_app/features/tabs/search_tab/data/data_source/remote/search_tab_remote_data_source.dart';
import 'package:movie_app/features/tabs/search_tab/data/model/search_response.dart';

class SearchTabRemoteAPIDataSource implements SearchTabRemoteDataSource {
  final Dio _dio = Dio(
    BaseOptions(baseUrl: ConstantAPI.baseUrl, receiveDataWhenStatusError: true),
  );

  @override
  Future<SearchResponse> search(String? query, int? pageNumber) async {
    try {
      final response = await _dio.get(
        ConstantAPI.movieListEndPoint,
        queryParameters:
            query == null
                ? null
                : {"query_term": query, "page": pageNumber ?? 1},
      );
      return SearchResponse.fromJson(response.data);
    } catch (exception) {
      String? message;
      if (exception is DioException) {
        message = exception.response?.data["status_message"];
      }
      throw SearchException(message ?? "Failed to search");
    }
  }
}
