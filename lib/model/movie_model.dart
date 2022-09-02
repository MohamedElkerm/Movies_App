class MovieModel {
  String? Title;
  String? Poster;
  String? Released;

  MovieModel.fromJson(json){
    Title = json['Title'];
    Poster = json['Poster'];
    Released = json['Released'];
  }
}
