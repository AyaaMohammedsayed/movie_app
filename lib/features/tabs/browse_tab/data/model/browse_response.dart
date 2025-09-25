import 'package:movie_app/features/tabs/browse_tab/data/model/data.dart';

class BrowseResponse {
  String? status;
  String? statusMessage;
  Data? data;

  BrowseResponse({this.status, this.statusMessage, this.data});

  factory BrowseResponse.fromJson(Map<String, dynamic> json) {
    return BrowseResponse(
      status: json['status'] as String?,
      statusMessage: json['status_message'] as String?,
      data: json['data'] == null ? null : Data.fromJson(json['data']),
    );
  }
}

