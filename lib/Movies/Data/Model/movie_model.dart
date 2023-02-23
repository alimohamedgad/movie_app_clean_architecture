import '../../Domain/Entities/movie.dart';

class MovieModel extends Movie {
  const MovieModel({
    required super.id,
    required super.backdropPath,
    required super.title,
    required super.voteAverage,
    required super.overview,
    required super.genreIDs,
    required super.date,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) => MovieModel(
        id: json['id'],
        backdropPath: json['backdrop_path'],
        title: json['title'],
        voteAverage: json['vote_average'],
        overview: json['overview'],
        genreIDs: List<int>.from(json['genre_ids']),
        date: json['release_date'],
      );
}
