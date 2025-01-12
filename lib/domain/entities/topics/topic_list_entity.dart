import 'package:bitti/domain/entities/entity.dart';
import 'package:bitti/domain/entities/topics/topic_entry_entity.dart';

class TopicListEntity extends Entity {
  List<TopicEntity> topics;

  TopicListEntity({
    required this.topics,
  });
}
