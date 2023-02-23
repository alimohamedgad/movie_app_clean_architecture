// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:movice_app_clean_architecture/Movies/Domain/UseCase/get_recomindation_usecase.dart';
import 'package:movice_app_clean_architecture/Movies/Domain/UseCase/movie_details_usecase.dart';
import 'package:movice_app_clean_architecture/core/modelErorr/enums.dart';

import 'movie_details_state.dart';

part 'movie_details_event.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  MovieDetailsBloc(
    this.getMovieDetailsUseCase,
    this.getMovieRecomendtionUseCase,
  ) : super(const MovieDetailsState()) {
    on<GetMovieDetailsEvent>(_getMovieDetailsEvent);
    on<GetMovieRecomendtion>(_getMovieRecomindtion);
  }
  final GetMovieDetailsUseCase getMovieDetailsUseCase;
  final GetMovieRecomendtionUseCase getMovieRecomendtionUseCase;

  FutureOr<void> _getMovieDetailsEvent(GetMovieDetailsEvent event, emit) async {
    final result =
        await getMovieDetailsUseCase(MovieDetailsParameters(movieID: event.id));
    result.fold(
        (l) => emit(
              state.copyWith(
                requestState: RequestState.erorr,
                movieDetailsMessege: state.movieDetailsMessege,
              ),
            ),
        (r) => emit(
              state.copyWith(
                movieDetails: r,
                requestState: RequestState.loaded,
              ),
            ));
  }

  FutureOr<void> _getMovieRecomindtion(
      GetMovieRecomendtion event, Emitter<MovieDetailsState> emit) async {
    final result = await getMovieRecomendtionUseCase(
        RecomindtionParameter(movieId: event.id));

    result.fold(
        (l) => emit(state.copyWith(
            recomindtionMessege: l.messege, requestState: RequestState.loaded)),
        (r) => emit(state.copyWith(
              recomindtion: r,
              requestState: RequestState.loaded,
            )));
  }
}
