import 'package:bitti/domain/entities/journal_entities/topic_setting_value_toggle_entity.dart';
import 'package:bitti/domain/entities/journal_entities/topic_type_settings_entity.dart';

class TopicTypeToggleSettingsEntity extends TopicTypeSettingsEntity {
  List<TopicSettingValueToggleEntity> values;

  TopicTypeToggleSettingsEntity({
    required this.values,
  });
}
