import 'package:dartz/dartz.dart';
import 'package:movie_app/core/errors/exceptions.dart';
import 'package:movie_app/core/errors/failure.dart';
import 'package:movie_app/features/tabs/search_tab/data/data_source/remote/search_tab_remote_api_data_source.dart';
import 'package:movie_app/features/tabs/search_tab/data/model/search_response.dart';

class SearchTabRepository {
  final SearchTabRemoteAPIDataSource _apiDataSource =
      SearchTabRemoteAPIDataSource();

  Future<Either<Failure, SearchResponse>> search(
    String? query,
    int? pageNum,
  ) async {
    try {
      final response = await _apiDataSource.search(query, pageNum);
      return Right(response);
    } on SearchException catch (exception) {
      return Left(Failure(exception.message));
    }
  }
}
