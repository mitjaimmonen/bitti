import 'package:bitti/domain/entities/param/journals_read_param_entity.dart';
import 'package:bitti/domain/entities/response/journals_response_entity.dart';
import 'package:bitti/domain/failures/failure.dart';
import 'package:bitti/domain/repositories/journal_repository.dart';
import 'package:bitti/domain/use_cases/use_case.dart';
import 'package:either_dart/either.dart';

class ReadJournalsUseCase
    extends UseCase<JournalsResponseEntity, JournalsReadParamEntity> {
  final JournalRepository repository;

  ReadJournalsUseCase({required this.repository});

  @override
  Future<Either<Failure, JournalsResponseEntity>> call(
      JournalsReadParamEntity params) async {
    return await repository.readJournals(params);
  }
}
