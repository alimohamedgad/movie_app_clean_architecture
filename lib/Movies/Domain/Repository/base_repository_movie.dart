import 'package:dartz/dartz.dart';

import '../../../core/erorr/failure.dart';
import '../Entities/movie.dart';
import '../Entities/movie_details.dart';
import '../Entities/recomndtion.dart';
import '../UseCase/get_recomindation_usecase.dart';
import '../UseCase/movie_details_usecase.dart';

abstract class BaseRepositoryMovies {
  Future<Either<Failure, List<Movie>>> getNowPlaying();
  Future<Either<Failure, List<Movie>>> getPopularMovies();
  Future<Either<Failure, List<Movie>>> getTopRatedMovies();
  
  Future<Either<Failure, MovieDetails>> getMovieDetails(MovieDetailsParameters parameters);

  Future<Either<Failure, List<Recommendation>>> getMovieRecomendtion(RecomindtionParameter parameters);


}
