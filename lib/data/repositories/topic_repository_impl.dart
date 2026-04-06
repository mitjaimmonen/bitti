import 'package:bitti/data/data_sources/interfaces/topic_data_source.dart';
import 'package:bitti/data/exceptions/exceptions.dart';
import 'package:bitti/data/models/param/topic_create_param_model.dart';
import 'package:bitti/data/models/param/topic_delete_param_model.dart';
import 'package:bitti/data/models/param/topic_update_param_model.dart';
import 'package:bitti/data/models/param/topics_read_param_model.dart';
import 'package:bitti/domain/entities/param/topic_create_param_entity.dart';
import 'package:bitti/domain/entities/param/topic_delete_param_entity.dart';
import 'package:bitti/domain/entities/param/topic_update_param_entity.dart';
import 'package:bitti/domain/entities/param/topics_read_param_entity.dart';
import 'package:bitti/domain/entities/response/topic_response_entity.dart';
import 'package:bitti/domain/entities/response/topics_response_entity.dart';
import 'package:bitti/domain/failures/failure.dart';
import 'package:bitti/domain/repositories/topic_repository.dart';
import 'package:either_dart/either.dart';

class TopicRepositoryImpl implements TopicRepository {
  final TopicDataSource dataSource;

  TopicRepositoryImpl({
    required this.dataSource,
  });

  @override
  Future<Either<Failure, TopicResponseEntity>> createTopic(
    TopicCreateParamEntity params,
  ) async {
    try {
      final response = await dataSource.create(
        TopicCreateParamModel.fromEntity(params),
      );
      return Right(response.toEntity());
    } on DataSourceException catch (e) {
      return Left(DataSourceFailure(message: e.message));
    } catch (e) {
      return Left(GeneralFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, TopicResponseEntity>> deleteTopic(
    TopicDeleteParamEntity params,
  ) async {
    try {
      final response = await dataSource.delete(
        TopicDeleteParamModel.fromEntity(params),
      );
      return Right(response.toEntity());
    } on DataSourceException catch (e) {
      return Left(DataSourceFailure(message: e.message));
    } catch (e) {
      return Left(GeneralFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, TopicsResponseEntity>> readTopics(
    TopicsReadParamEntity params,
  ) async {
    try {
      final response = await dataSource.readAll(TopicsReadParamModel());
      return Right(response.toEntity());
    } on DataSourceException catch (e) {
      return Left(DataSourceFailure(message: e.message));
    } catch (e) {
      return Left(GeneralFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, TopicResponseEntity>> updateTopic(
    TopicUpdateParamEntity params,
  ) async {
    try {
      final response = await dataSource.update(
        TopicUpdateParamModel.fromEntity(params),
      );
      return Right(response.toEntity());
    } on DataSourceException catch (e) {
      return Left(DataSourceFailure(message: e.message));
    } catch (e) {
      return Left(GeneralFailure(message: e.toString()));
    }
  }
}
