import 'package:dartz/dartz.dart';
import '../erorr/failure.dart';

abstract class TvBaseUseCase<T> {
  Future<Either<Failure, T>> call();
}
