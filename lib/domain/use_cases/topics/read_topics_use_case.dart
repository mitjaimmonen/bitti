import 'package:bitti/domain/entities/param/topics_read_param_entity.dart';
import 'package:bitti/domain/entities/response/topics_response_entity.dart';
import 'package:bitti/domain/failures/failure.dart';
import 'package:bitti/domain/repositories/topic_repository.dart';
import 'package:bitti/domain/use_cases/use_case.dart';
import 'package:either_dart/either.dart';

class ReadTopicsUseCase
    extends UseCase<TopicsResponseEntity, TopicsReadParamEntity> {
  final TopicRepository repository;

  ReadTopicsUseCase({required this.repository});

  @override
  Future<Either<Failure, TopicsResponseEntity>> call(
      TopicsReadParamEntity params) async {
    return await repository.readTopics(params);
  }
}
