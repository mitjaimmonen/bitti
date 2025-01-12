import 'package:bitti/domain/entities/journal_entities/topic_setting_value_note_entity.dart';
import 'package:bitti/domain/entities/journal_entities/topic_type_settings_entity.dart';

class TopicTypeNoteSettingsEntity extends TopicTypeSettingsEntity {
  List<TopicSettingValueNoteEntity> values;

  TopicTypeNoteSettingsEntity({
    required this.values,
  });
}
