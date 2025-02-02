import 'package:bitti/domain/entities/param/journal_create_param_entity.dart';
import 'package:bitti/domain/entities/param/journal_delete_param_entity.dart';
import 'package:bitti/domain/entities/param/journal_update_param_entity.dart';
import 'package:bitti/domain/entities/param/journals_read_param_entity.dart';
import 'package:bitti/domain/entities/response/journal_response_entity.dart';
import 'package:bitti/domain/entities/response/journals_response_entity.dart';
import 'package:bitti/domain/failures/failure.dart';
import 'package:bitti/domain/repositories/repository.dart';
import 'package:either_dart/either.dart';

abstract class JournalRepository extends Repository {
  const JournalRepository();

  Future<Either<Failure, JournalsResponseEntity>> readJournals(
      JournalsReadParamEntity params);
  Future<Either<Failure, JournalResponseEntity>> createJournal(
      JournalCreateParamEntity params);
  Future<Either<Failure, JournalResponseEntity>> updateJournal(
      JournalUpdateParamEntity params);
  Future<Either<Failure, JournalResponseEntity>> deleteJournal(
      JournalDeleteParamEntity params);
}
