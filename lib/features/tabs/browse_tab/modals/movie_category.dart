class MovieCategory {
  String name;
  String id;
  MovieCategory({required this.name, required this.id});
 static List<MovieCategory> movies = [
    MovieCategory(name:'Action' , id: '0'),
    MovieCategory(name:'Adventure' , id: '1'),
    MovieCategory(name:'Drama' , id: '2'),
    MovieCategory(name:'Romantic' , id: '3'),
    MovieCategory(name:'War' , id: '4'),
    MovieCategory(name:'Horror' , id: '5'),
    MovieCategory(name:'Comedy' , id: '6'),
    MovieCategory(name:'Family' , id: '7'),
    MovieCategory(name:'Sport' , id: '8'),
    MovieCategory(name:'Thriller' , id: '9'),
    MovieCategory(name:'Crime' , id: '10'),
    MovieCategory(name:'Mystery' , id: '11'),
   
  
  ];
}
