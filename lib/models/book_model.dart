class BookModel {
  String title;
  String publisher;
  String overview;
  String status;
  int voteAverage;
  String posterPath; 

  BookModel({
    required this.title,
    required this.publisher,
    required this.overview,
    required this.status,
    required this.voteAverage,
    required this.posterPath,
  });
}
