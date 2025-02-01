import 'package:bitti/domain/entities/entity.dart';
import 'package:bitti/domain/entities/general/topic_entities/topic_entry_entity.dart';

class TopicsResponseEntity extends ResponseEntity {
  final List<TopicEntryEntity> topics;

  const TopicsResponseEntity({
    required this.topics,
  });
}
