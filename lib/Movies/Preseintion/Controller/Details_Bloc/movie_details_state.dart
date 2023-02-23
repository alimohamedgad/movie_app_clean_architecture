// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:equatable/equatable.dart';

import 'package:movice_app_clean_architecture/Movies/Domain/Entities/movie_details.dart';
import 'package:movice_app_clean_architecture/Movies/Domain/Entities/recomndtion.dart';
import 'package:movice_app_clean_architecture/core/modelErorr/enums.dart';

class MovieDetailsState extends Equatable {
  const MovieDetailsState({
    this.movieDetails,
    this.requestState = RequestState.loading,
    this.movieDetailsMessege = '',
    this.recomindtion = const [],                               
    this.recomindtionMessege = '',
    this.requestStateRecomindtion = RequestState.loading,
  });

  final MovieDetails? movieDetails;
  final RequestState requestState;
  final String movieDetailsMessege;
  final List<Recommendation> recomindtion;
  final RequestState requestStateRecomindtion;
  final String recomindtionMessege;

  MovieDetailsState copyWith({
    MovieDetails? movieDetails,
    RequestState? requestState,
    String? movieDetailsMessege,
    List<Recommendation>? recomindtion,
    RequestState? requestStateRecomindtion,
    String? recomindtionMessege,
  }) {
    return MovieDetailsState(
      movieDetails: movieDetails ?? this.movieDetails,
      requestState: requestState ?? this.requestState,
      movieDetailsMessege: movieDetailsMessege ?? this.movieDetailsMessege,
      recomindtion: recomindtion ?? this.recomindtion,
      recomindtionMessege: recomindtionMessege ?? this.recomindtionMessege,
      requestStateRecomindtion:
          requestStateRecomindtion ?? this.requestStateRecomindtion,
    );
  }

  @override
  List<Object?> get props => [
        movieDetails,
        requestState,
        movieDetailsMessege,
        recomindtion,
        recomindtionMessege,
        requestStateRecomindtion
      ];
}
