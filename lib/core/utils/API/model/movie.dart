class Movie{
  String title;
  String Path;
  Movie({required this.title,required this.Path});
   factory Movie.fromJson(Map<String,dynamic> Json)
   {
     return Movie(title: Json["title"],Path: Json["poster_path"]);
   }
  
}