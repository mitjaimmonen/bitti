import 'package:bitti/domain/entities/entity.dart';
import 'package:bitti/domain/entities/general/topic_entities/topic_entry_entity.dart';

class TopicUpdateParamEntity extends ParamEntity {
  final TopicEntryEntity topic;

  const TopicUpdateParamEntity({
    required this.topic,
  });
}
