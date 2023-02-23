import '../Entities/movie.dart';
import '../Repository/base_repository_movie.dart';
import 'package:dartz/dartz.dart';
import '../../../core/base_user_case/base_use_case.dart';

import '../../../core/erorr/failure.dart';

class GetTopRatedUseCase extends BaseUserCase<List<Movie> , NoParameters> {
  final BaseRepositoryMovies baseRepositoryMovies;

  GetTopRatedUseCase(this.baseRepositoryMovies);

  @override
  Future<Either<Failure, List<Movie>>> call(NoParameters parameters) async {
    return await baseRepositoryMovies.getTopRatedMovies();
  }
}
