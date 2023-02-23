import 'package:equatable/equatable.dart';
import '../../../../core/modelErorr/enums.dart';

import '../../../Domain/Entities/movie.dart';

class MoviesState extends Equatable {
  final List<Movie> nowPlayingmovies;
  final RequestState nowPlayingState;
  final String nowPlayingmessege;
  final List<Movie> popularMovies;
  final RequestState popularState;
  final String popularMessege;
  final List<Movie> topRatedMovies;
  final RequestState topRatedState;
  final String topRatedMessege;

  const MoviesState({
    this.nowPlayingmovies = const [],
    this.nowPlayingState = RequestState.loading,
    this.nowPlayingmessege = '',
    this.popularMovies = const [],
    this.popularState = RequestState.loading,
    this.popularMessege = '',
    this.topRatedMovies = const [],
    this.topRatedState = RequestState.loading,
    this.topRatedMessege = '',
  });

  MoviesState copyWith({
    List<Movie>? nowPlayingmovies,
    RequestState? nowPlayingState,
    String? nowPlayingmessege,
    List<Movie>? popularMovies,
    RequestState? popularState,
    String? popularMessege,
    List<Movie>? topRatedMovies,
    RequestState? topRatedState,
    String? topRatedMessege,
  }) {
    return MoviesState(
      nowPlayingmovies: nowPlayingmovies ?? this.nowPlayingmovies,
      nowPlayingState: nowPlayingState ?? this.nowPlayingState,
      nowPlayingmessege: nowPlayingmessege ?? this.nowPlayingmessege,
      popularMovies: popularMovies ?? this.popularMovies,
      popularState: popularState ?? this.popularState,
      popularMessege: popularMessege ?? this.popularMessege,
      topRatedMovies: topRatedMovies ?? this.topRatedMovies,
      topRatedState: topRatedState ?? this.topRatedState,
      topRatedMessege: topRatedMessege ?? this.topRatedMessege,
    );
  }

  @override
  List<Object?> get props => [
        nowPlayingmovies,
        nowPlayingState,
        nowPlayingmessege,
        popularMovies,
        popularState,
        popularMessege,
        topRatedMovies,
        topRatedState,
        topRatedMessege
      ];
}
