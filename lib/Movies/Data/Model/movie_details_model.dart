import 'geners_model.dart';
import '../../Domain/Entities/movie_details.dart';

class MovieDetailsModel extends MovieDetails {
  const MovieDetailsModel({
    required super.backdropPath,
    required super.title,
    required super.voteAverage,
    required super.id,
    required super.releaseDate,
    required super.overView,
    required super.runTime,
    required super.generes,
  });

  factory MovieDetailsModel.fromJson(Map<String, dynamic> json) =>
      MovieDetailsModel(
        backdropPath: json['backdrop_path'],
        title: json['title'],
        voteAverage: json['vote_average'],
        id: json['id'],
        releaseDate: json['release_date'],
        overView: json['overview'],
        runTime: json['runtime'],
        generes: List<GenresModel>.from(json['genres'].map((e)=> GenresModel.fromJson(e))) ,
      );
}
