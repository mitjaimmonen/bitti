import 'package:bitti/domain/entities/entity.dart';
import 'package:bitti/domain/entities/general/topic_entities/topic_entry_entity.dart';

class TopicListEntity extends Entity {
  final List<TopicEntryEntity> topics;

  const TopicListEntity({
    required this.topics,
  });
}
