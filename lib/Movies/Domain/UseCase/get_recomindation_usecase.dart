// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import 'package:movice_app_clean_architecture/Movies/Domain/Entities/recomndtion.dart';
import 'package:movice_app_clean_architecture/Movies/Domain/Repository/base_repository_movie.dart';
import 'package:movice_app_clean_architecture/core/base_user_case/base_use_case.dart';
import 'package:movice_app_clean_architecture/core/erorr/failure.dart';

class GetMovieRecomendtionUseCase
    extends BaseUserCase<List<Recommendation>, RecomindtionParameter> {
  BaseRepositoryMovies baseRepositoryMovies;
  GetMovieRecomendtionUseCase(
    this.baseRepositoryMovies,
  );
  @override
  Future<Either<Failure, List<Recommendation>>> call(parameters) async {
    return await baseRepositoryMovies.getMovieRecomendtion(parameters);
  }
}

class RecomindtionParameter extends Equatable {
  final int movieId;

  const RecomindtionParameter({required this.movieId});

  @override
  List<Object?> get props => [
        movieId,
      ];
}
