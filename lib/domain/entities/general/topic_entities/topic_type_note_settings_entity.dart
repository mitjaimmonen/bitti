import 'package:bitti/domain/entities/entity.dart';
import 'package:bitti/domain/entities/general/topic_entities/topic_setting_value_note_entity.dart';

class TopicTypeNoteSettingsEntity extends Entity {
  final List<TopicSettingValueNoteEntity> values;

  const TopicTypeNoteSettingsEntity({
    required this.values,
  });
}
