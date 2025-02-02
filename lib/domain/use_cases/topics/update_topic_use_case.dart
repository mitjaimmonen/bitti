import 'package:bitti/domain/entities/param/topic_update_param_entity.dart';
import 'package:bitti/domain/entities/response/topic_response_entity.dart';
import 'package:bitti/domain/failures/failure.dart';
import 'package:bitti/domain/repositories/topic_repository.dart';
import 'package:bitti/domain/use_cases/use_case.dart';
import 'package:either_dart/either.dart';

class UpdateTopicUseCase
    extends UseCase<TopicResponseEntity, TopicUpdateParamEntity> {
  final TopicRepository repository;

  UpdateTopicUseCase({required this.repository});

  @override
  Future<Either<Failure, TopicResponseEntity>> call(
      TopicUpdateParamEntity params) async {
    return await repository.updateTopic(params);
  }
}
