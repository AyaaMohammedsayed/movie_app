class GenresResponse {
  GenresData? data;
  String? status;
  String? statusMessage;

  GenresResponse({this.data, this.status, this.statusMessage});

  factory GenresResponse.fromJson(Map<String, dynamic> json) => GenresResponse(
        data: json['data'] == null
            ? null
            : GenresData.fromJson(json['data'] as Map<String, dynamic>),
        status: json['status'] as String?,
        statusMessage: json['status_message'] as String?,
      );
}

class GenresData {
  List<Genre>? genres;

  GenresData({this.genres});

  factory GenresData.fromJson(Map<String, dynamic> json) => GenresData(
        genres: (json['genres'] as List<dynamic>?)
            ?.map((e) => Genre.fromJson(e as Map<String, dynamic>))
            .toList(),
      );
}

class Genre {
  int? id;
  String? name;

  Genre({this.id, this.name});

  factory Genre.fromJson(Map<String, dynamic> json) => Genre(
        id: json['id'] as int?,
        name: json['name'] as String?,
      );
}
