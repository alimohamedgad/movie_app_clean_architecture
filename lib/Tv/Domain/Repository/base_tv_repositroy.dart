import 'package:dartz/dartz.dart';
import '../Entities/tv.dart';
import '../../../core/erorr/failure.dart';


abstract class BaseTvRepository {
  Future<Either<Failure, List<TV>>> getTvOnTheAir();
  Future<Either<Failure, List<TV>>> getTvPopular();
  Future<Either<Failure, List<TV>>> getTvTopRated();
}