import 'package:dartz/dartz.dart';
import '../../Domain/UseCase/get_recomindation_usecase.dart';
import '../../Domain/Entities/recomndtion.dart';
import '../../Domain/Entities/movie_details.dart';
import '../../Domain/UseCase/movie_details_usecase.dart';
import '../Data_Source/movie_remote_data_source.dart';
import '../../Domain/Entities/movie.dart';
import '../../Domain/Repository/base_repository_movie.dart';
import '../../../core/erorr/exepections.dart';

import '../../../core/erorr/failure.dart';

class MoviceRepository extends BaseRepositoryMovies {
  final BaseRemoteMovieDataSourse baseMovieRemoteDataSourse;

  MoviceRepository(this.baseMovieRemoteDataSourse);
  @override
  Future<Either<Failure, List<Movie>>> getNowPlaying() async {
    final reslut = await baseMovieRemoteDataSourse.getNowPlayingMovies();
    try {
      return right(reslut);
    } on ServiceExpaetion catch (faliure) {
      return left(ServerFailure(faliure.errorMessgeModel.massege));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getPopularMovies() async {
    final result = await baseMovieRemoteDataSourse.getPopularMovies();
    try {
      return right(result);
    } on ServiceExpaetion catch (faliure) {
      return left(ServerFailure(faliure.errorMessgeModel.massege));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getTopRatedMovies() async {
    final result = await baseMovieRemoteDataSourse.getTopRatedMovies();
    try {
      return Right(result);
    } on ServiceExpaetion catch (e) {
      return left(ServerFailure(e.errorMessgeModel.massege));
    }
  }

  @override
  Future<Either<Failure, MovieDetails>> getMovieDetails(
      MovieDetailsParameters parameters) async {
    final result = await baseMovieRemoteDataSourse.getMovieDetails(parameters);
    try {
      return Right(result);
    } on ServiceExpaetion catch (e) {
      return left(ServerFailure(e.errorMessgeModel.massege));
    }
  }

  @override
  Future<Either<Failure, List<Recommendation>>> getMovieRecomendtion(RecomindtionParameter parameters) async{
   final result = await baseMovieRemoteDataSourse.getRecomindtionMovie(parameters);
   try {
      return Right(result);
    } on ServiceExpaetion catch (e) {
      return left(ServerFailure(e.errorMessgeModel.massege));
    }
  }
}
