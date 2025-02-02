import 'package:bitti/domain/entities/param/journal_create_param_entity.dart';
import 'package:bitti/domain/entities/response/journal_response_entity.dart';
import 'package:bitti/domain/failures/failure.dart';
import 'package:bitti/domain/repositories/journal_repository.dart';
import 'package:bitti/domain/use_cases/use_case.dart';
import 'package:either_dart/either.dart';

class CreateJournalUseCase
    extends UseCase<JournalResponseEntity, JournalCreateParamEntity> {
  final JournalRepository repository;

  CreateJournalUseCase({required this.repository});

  @override
  Future<Either<Failure, JournalResponseEntity>> call(
      JournalCreateParamEntity params) async {
    return await repository.createJournal(params);
  }
}
