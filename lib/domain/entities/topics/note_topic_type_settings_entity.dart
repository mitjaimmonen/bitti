import 'package:bitti/domain/entities/topics/note_setting_value_entity.dart';
import 'package:bitti/domain/entities/topics/topic_type_settings_entity.dart';

class NoteTopicTypeSettingsEntity extends TopicTypeSettingsEntity {
  List<NoteSettingValueEntity> values;

  NoteTopicTypeSettingsEntity({
    required this.values,
  });
}
