import 'package:bitti/domain/entities/param/icon_read_param_entity.dart';
import 'package:bitti/domain/entities/response/icon_response_entity.dart';
import 'package:bitti/domain/failures/failure.dart';
import 'package:bitti/domain/repositories/icon_repository.dart';
import 'package:bitti/domain/use_cases/use_case.dart';
import 'package:either_dart/either.dart';

class ReadIconUseCase extends UseCase<IconResponseEntity, IconReadParamEntity> {
  final IconRepository repository;

  ReadIconUseCase({required this.repository});

  @override
  Future<Either<Failure, IconResponseEntity>> call(
      IconReadParamEntity params) async {
    return await repository.readIcon(params);
  }
}
