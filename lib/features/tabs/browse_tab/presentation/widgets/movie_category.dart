class MovieCategory {
  String name;
  String id;
  bool isSelected;

  MovieCategory({
    required this.name,
    required this.id,
    this.isSelected = false,
  });

  MovieCategory copyWith({String? name, String? id, bool? isSelected}) {
    return MovieCategory(
      name: name ?? this.name,
      id: id ?? this.id,
      isSelected: isSelected ?? this.isSelected,
    );
  }
}
