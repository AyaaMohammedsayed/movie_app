import 'suggestions_data.dart';
import 'meta.dart';

class MovieSuggestionsResponse {
  String? status;
  String? statusMessage;
  SuggestionsData? data;
  Meta? meta;

  MovieSuggestionsResponse({
    this.status,
    this.statusMessage,
    this.data,
    this.meta,
  });

  factory MovieSuggestionsResponse.fromJson(Map<String, dynamic> json) {
    return MovieSuggestionsResponse(
      status: json['status'] as String?,
      statusMessage: json['status_message'] as String?,
      data:
          json['data'] == null
              ? null
              : SuggestionsData.fromJson(json['data'] as Map<String, dynamic>),
      meta:
          json['@meta'] == null
              ? null
              : Meta.fromJson(json['@meta'] as Map<String, dynamic>),
    );
  }
}
