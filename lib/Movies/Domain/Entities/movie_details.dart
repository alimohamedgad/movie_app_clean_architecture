// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import 'package:movice_app_clean_architecture/Movies/Domain/Entities/generes.dart';

class MovieDetails extends Equatable {
  final String backdropPath;
  final String title;
  final double voteAverage;
  final int id;
  final String releaseDate;
  final String overView;
  final int runTime;
  final List<Geners> generes;

  const MovieDetails({
    required this.backdropPath,
    required this.title,
    required this.voteAverage,
    required this.id,
    required this.releaseDate,
    required this.overView,
    required this.runTime,
    required this.generes,
  });
 
  @override
  List<Object> get props {
    return [
      backdropPath,
      title,
      voteAverage,
      id,
      releaseDate,
      overView,
      runTime,
      generes,
    ];
  }
}

