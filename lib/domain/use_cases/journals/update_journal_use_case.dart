import 'package:bitti/domain/entities/param/journal_update_param_entity.dart';
import 'package:bitti/domain/entities/response/journal_response_entity.dart';
import 'package:bitti/domain/failures/failure.dart';
import 'package:bitti/domain/repositories/journal_repository.dart';
import 'package:bitti/domain/use_cases/use_case.dart';
import 'package:either_dart/either.dart';

class UpdateJournalUseCase
    extends UseCase<JournalResponseEntity, JournalUpdateParamEntity> {
  final JournalRepository repository;

  UpdateJournalUseCase({required this.repository});

  @override
  Future<Either<Failure, JournalResponseEntity>> call(
      JournalUpdateParamEntity params) async {
    return await repository.updateJournal(params);
  }
}
