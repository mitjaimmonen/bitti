import 'package:bitti/domain/entities/entity.dart';
import 'package:bitti/domain/entities/journal_entities/topic_entry_entity.dart';

class TopicListEntity extends Entity {
  List<TopicEntryEntity> topics;

  TopicListEntity({
    required this.topics,
  });
}
