import 'package:bitti/data/data_sources/interfaces/topic_data_source.dart';
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
      TopicCreateParamEntity params) {
    // TODO: implement createTopic
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, TopicResponseEntity>> deleteTopic(
      TopicDeleteParamEntity params) {
    // TODO: implement deleteTopic
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, TopicsResponseEntity>> readTopics(
      TopicsReadParamEntity params) {
    // TODO: implement readTopics
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, TopicResponseEntity>> updateTopic(
      TopicUpdateParamEntity params) {
    // TODO: implement updateTopic
    throw UnimplementedError();
  }
}
