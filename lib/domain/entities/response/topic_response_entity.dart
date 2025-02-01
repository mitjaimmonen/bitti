import 'package:bitti/domain/entities/entity.dart';
import 'package:bitti/domain/entities/general/topic_entities/topic_entry_entity.dart';

class TopicResponseEntity extends ResponseEntity {
  final TopicEntryEntity topic;

  const TopicResponseEntity({
    required this.topic,
  });
}
