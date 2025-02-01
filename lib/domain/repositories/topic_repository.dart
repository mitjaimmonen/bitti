import 'package:bitti/domain/entities/param/topic_create_param_entity.dart';
import 'package:bitti/domain/entities/param/topic_delete_param_entity.dart';
import 'package:bitti/domain/entities/param/topic_update_param_entity.dart';
import 'package:bitti/domain/entities/param/topics_read_param_entity.dart';
import 'package:bitti/domain/entities/response/topic_response_entity.dart';
import 'package:bitti/domain/entities/response/topics_response_entity.dart';
import 'package:bitti/domain/failures/failure.dart';
import 'package:bitti/domain/repositories/repository.dart';
import 'package:either_dart/either.dart';

abstract class TopicRepository extends Repository {
  const TopicRepository();

  Future<Either<Failure, TopicsResponseEntity>> readTopics(
      TopicsReadParamEntity params);
  Future<Either<Failure, TopicResponseEntity>> createTopic(
      TopicCreateParamEntity params);
  Future<Either<Failure, TopicResponseEntity>> updateTopic(
      TopicUpdateParamEntity params);
  Future<Either<Failure, TopicResponseEntity>> deleteTopic(
      TopicDeleteParamEntity params);
}
