class MovieCategory {
  String name;
  String id;

  MovieCategory({
    required this.name,
    required this.id,
  });

  MovieCategory copyWith({String? name, String? id, bool? isSelected}) {
    return MovieCategory(
      name: name ?? this.name,
      id: name ?? this.name,
    );
  }
}
