import 'package:bitti/domain/failures/failure.dart';
import 'package:either_dart/either.dart';

abstract class UseCase<Response, Params> {
  Future<Either<Failure, Response>> call(Params params);
}
