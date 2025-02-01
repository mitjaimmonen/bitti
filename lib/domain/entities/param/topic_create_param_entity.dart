import 'package:bitti/domain/entities/entity.dart';
import 'package:bitti/domain/entities/general/topic_entities/topic_entry_entity.dart';

class TopicCreateParamEntity extends ParamEntity {
  final TopicEntryEntity topic;

  const TopicCreateParamEntity({
    required this.topic,
  });
}
