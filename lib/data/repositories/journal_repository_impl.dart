import 'package:bitti/data/data_sources/interfaces/journal_data_source.dart';
import 'package:bitti/data/exceptions/exceptions.dart';
import 'package:bitti/data/models/param/journal_create_param_model.dart';
import 'package:bitti/domain/entities/param/journal_create_param_entity.dart';
import 'package:bitti/domain/entities/param/journal_delete_param_entity.dart';
import 'package:bitti/domain/entities/param/journal_update_param_entity.dart';
import 'package:bitti/domain/entities/param/journals_read_param_entity.dart';
import 'package:bitti/domain/entities/response/journal_response_entity.dart';
import 'package:bitti/domain/entities/response/journals_response_entity.dart';
import 'package:bitti/domain/failures/failure.dart';
import 'package:bitti/domain/repositories/journal_repository.dart';
import 'package:either_dart/either.dart';

class JournalRepositoryImpl extends JournalRepository {
  final JournalDataSource dataSource;

  const JournalRepositoryImpl({
    required this.dataSource,
  });

  @override
  Future<Either<Failure, JournalResponseEntity>> createJournal(
      JournalCreateParamEntity params) async {
    try {
      final response =
          await dataSource.create(JournalCreateParamModel.fromEntity(params));
      return Right(response.toEntity());
    } on DataSourceException catch (e) {
      return Left(DataSourceFailure(message: e.message));
    } catch (e) {
      return Left(GeneralFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, JournalResponseEntity>> deleteJournal(
      JournalDeleteParamEntity params) {
    // TODO: implement deleteJournal
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, JournalsResponseEntity>> readJournals(
      JournalsReadParamEntity params) {
    // TODO: implement readJournals
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, JournalResponseEntity>> updateJournal(
      JournalUpdateParamEntity params) {
    // TODO: implement updateJournal
    throw UnimplementedError();
  }
}
