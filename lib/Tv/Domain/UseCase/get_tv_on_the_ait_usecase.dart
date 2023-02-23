import 'package:dartz/dartz.dart';
import '../../Data/Repository/tv_repository.dart';
import '../Entities/tv.dart';
import '../Repository/base_tv_repositroy.dart';
import '../../../core/base_user_case/tv_base_user_case.dart';
import '../../../core/erorr/failure.dart';

class GetTvOnTheAirUseCase extends TvBaseUseCase<List<TV>> {
  final BaseTvRepository baseTvRepository;

  GetTvOnTheAirUseCase(this.baseTvRepository);

  @override
  Future<Either<Failure, List<TV>>> call() async {
    return await baseTvRepository.getTvOnTheAir();
  }
}
