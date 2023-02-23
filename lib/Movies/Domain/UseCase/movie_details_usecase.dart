import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../Entities/movie_details.dart';
import '../Repository/base_repository_movie.dart';
import '../../../core/base_user_case/base_use_case.dart';
import '../../../core/erorr/failure.dart';

class GetMovieDetailsUseCase
    extends BaseUserCase<MovieDetails , MovieDetailsParameters> {
  final BaseRepositoryMovies baseRepositoryMovies;

  GetMovieDetailsUseCase(this.baseRepositoryMovies);

  @override
  Future<Either<Failure, MovieDetails>> call(
      MovieDetailsParameters parameters) async {
    return await baseRepositoryMovies.getMovieDetails(parameters);
  }
}



class MovieDetailsParameters extends Equatable {
  final int movieID;

  const MovieDetailsParameters({required this.movieID});

  @override
  List<Object> get props => [movieID];
}
