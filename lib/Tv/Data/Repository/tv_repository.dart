import 'package:dartz/dartz.dart';
import '../Data_Source/remote_tv_data_source.dart';
import '../../Domain/Entities/tv.dart';
import '../../Domain/Repository/base_tv_repositroy.dart';
import '../../../core/erorr/exepections.dart';
import '../../../core/erorr/failure.dart';


class TvRepository extends BaseTvRepository {
  BaseRemoteTvDataSource baseRemoteTvDataSource;
  TvRepository(this.baseRemoteTvDataSource);

  @override
  Future<Either<Failure, List<TV>>> getTvPopular() async {
    final result = await baseRemoteTvDataSource.getTvPopular();

    try {
      return right(result);
    } on ServiceExpaetion catch (e) {
      return left(ServerFailure(e.errorMessgeModel.massege));
    }
  }

  @override
  Future<Either<Failure, List<TV>>> getTvTopRated() async {
    final result = await baseRemoteTvDataSource.getTvTopRated();
    try {
      return right(result);
    } on ServiceExpaetion catch (e) {
      return left(ServerFailure(e.errorMessgeModel.massege));
    }
  }

  @override
  Future<Either<Failure, List<TV>>> getTvOnTheAir() async {
    final result = await baseRemoteTvDataSource.getTvOnTheAir();

    try {
      return right(result);
    } on ServiceExpaetion catch (e) {
      return left(ServerFailure(e.errorMessgeModel.massege));
    }
  }
}
