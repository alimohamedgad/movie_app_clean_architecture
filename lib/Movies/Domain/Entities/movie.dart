// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class Movie extends Equatable {
  final int id;
  final String backdropPath;
  final String title;
  final dynamic voteAverage;
  final String overview;
  final List<int> genreIDs;
  final String date;

  const Movie({
    required this.id,
    required this.backdropPath,
    required this.title,
    required this.voteAverage,
    required this.overview,
    required this.genreIDs,
    required this.date,
  });

  @override
  List<Object?> get props => [
        id,
        backdropPath,
        title,
        voteAverage,
        overview,
        genreIDs,
        date,
      ];
}
