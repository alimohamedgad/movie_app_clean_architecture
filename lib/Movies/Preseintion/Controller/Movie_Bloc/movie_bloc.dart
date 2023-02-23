// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movice_app_clean_architecture/Movies/Domain/UseCase/get_now_playing_movies.dart';
import 'package:movice_app_clean_architecture/Movies/Domain/UseCase/get_popular_movies.dart';
import 'package:movice_app_clean_architecture/Movies/Domain/UseCase/get_top_rated_movies.dart';
import 'package:movice_app_clean_architecture/Movies/Preseintion/Controller/Movie_Bloc/movie_event.dart';
import 'package:movice_app_clean_architecture/Movies/Preseintion/Controller/Movie_Bloc/movie_state.dart';
import 'package:movice_app_clean_architecture/core/base_user_case/base_use_case.dart';
import 'package:movice_app_clean_architecture/core/modelErorr/enums.dart';

class MovieBloc extends Bloc<MoviesEvent, MoviesState> {
  final GetNowPlayingMoviesUseCase getNowPlayingMoviesUseCase;
  final GetPopularUseCase getPopularUseCase;
  final GetTopRatedUseCase topRatedUseCase;
  MovieBloc(
    this.getNowPlayingMoviesUseCase,
    this.getPopularUseCase,
    this.topRatedUseCase,
  ) : super(const MoviesState()) {
    on<GetNowPlayingMoviesEvent>(_getNowPlayingMovies);
    on<GetPopularMoviesEvent>(_getPopularMovies);
    on<GetTopRatedMoviesEvent>(_topRatedMovies);
  }

  FutureOr<void> _topRatedMovies(event, emit) async {
    final result = await topRatedUseCase(const NoParameters());
    result.fold(
      (l) => emit(
        state.copyWith(
          topRatedState: RequestState.loading,
          topRatedMessege: l.messege,
        ),
      ),
      (r) => emit(
        state.copyWith(
          topRatedMovies: r,
          topRatedState: RequestState.loaded,
        ),
      ),
    );
  }

  FutureOr<void> _getPopularMovies(event, emit) async {
    final result = await getPopularUseCase(const NoParameters());
    result.fold(
      (l) => emit(
        state.copyWith(
          popularMessege: l.messege,
          popularState: RequestState.loading,
        ),
      ),
      (r) => emit(
        state.copyWith(
          popularMovies: r,
          popularState: RequestState.loaded,
        ),
      ),
    );
  }

  FutureOr<void> _getNowPlayingMovies(event, emit) async {
    final result = await getNowPlayingMoviesUseCase(const NoParameters());
    result.fold(
        (l) => emit(
              state.copyWith(
                nowPlayingState: RequestState.erorr,
                nowPlayingmessege: l.messege,
              ),
            ),
        (r) => emit(state.copyWith(
              nowPlayingState: RequestState.loaded,
              nowPlayingmovies: r,
            )));
  }
}
