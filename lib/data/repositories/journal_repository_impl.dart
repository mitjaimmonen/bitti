import 'package:bitti/data/data_sources/interfaces/journal_data_source.dart';
import 'package:bitti/data/models/response/journal_response_model.dart';
import 'package:bitti/data/models/response/journals_response_model.dart';
import 'package:bitti/domain/entities/param/journal_create_param_entity.dart';
import 'package:bitti/domain/entities/param/journal_delete_param_entity.dart';
import 'package:bitti/domain/entities/param/journal_update_param_entity.dart';
import 'package:bitti/domain/entities/param/journals_read_param_entity.dart';
import 'package:bitti/domain/failures/failure.dart';
import 'package:bitti/domain/repositories/journal_repository.dart';
import 'package:either_dart/either.dart';

class JournalRepositoryImpl extends JournalRepository {
  final JournalDataSource journalDataSource;

  const JournalRepositoryImpl({
    required this.journalDataSource,
  });

  @override
  Future<Either<Failure, JournalResponseModel>> createJournal(
      JournalCreateParamEntity params) {
    // TODO: implement createJournal
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, JournalResponseModel>> deleteJournal(
      JournalDeleteParamEntity params) {
    // TODO: implement deleteJournal
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, JournalsResponseModel>> readJournals(
      JournalsReadParamEntity params) {
    // TODO: implement readJournals
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, JournalResponseModel>> updateJournal(
      JournalUpdateParamEntity params) {
    // TODO: implement updateJournal
    throw UnimplementedError();
  }
}
