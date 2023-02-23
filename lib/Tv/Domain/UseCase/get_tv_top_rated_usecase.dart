import 'package:dartz/dartz.dart';
import '../Entities/tv.dart';
import '../Repository/base_tv_repositroy.dart';
import '../../../core/base_user_case/tv_base_user_case.dart';
import '../../../core/erorr/failure.dart';

class GetTvTopRatedUseCase extends TvBaseUseCase<List<TV>> {
  final BaseTvRepository baseTvRepository;

  GetTvTopRatedUseCase(this.baseTvRepository);
  @override
  Future<Either<Failure, List<TV>>> call() async {
    return await baseTvRepository.getTvTopRated();

  }
}
