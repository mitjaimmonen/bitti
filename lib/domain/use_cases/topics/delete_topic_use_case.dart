import 'package:bitti/domain/entities/param/topic_delete_param_entity.dart';
import 'package:bitti/domain/entities/response/topic_response_entity.dart';
import 'package:bitti/domain/failures/failure.dart';
import 'package:bitti/domain/repositories/topic_repository.dart';
import 'package:bitti/domain/use_cases/use_case.dart';
import 'package:either_dart/either.dart';

class DeleteTopicUseCase
    extends UseCase<TopicResponseEntity, TopicDeleteParamEntity> {
  final TopicRepository repository;

  DeleteTopicUseCase({required this.repository});

  @override
  Future<Either<Failure, TopicResponseEntity>> call(
      TopicDeleteParamEntity params) async {
    return await repository.deleteTopic(params);
  }
}
