import 'package:bitti/domain/entities/response/topic_entities/topic_setting_value_note_entity.dart';
import 'package:bitti/domain/entities/response/topic_entities/topic_type_settings_entity_base.dart';

class TopicTypeNoteSettingsEntity extends TopicTypeSettingsEntityBase {
  final List<TopicSettingValueNoteEntity> values;

  const TopicTypeNoteSettingsEntity({
    required this.values,
  });
}
