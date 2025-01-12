import 'package:bitti/domain/entities/topics/toggle_setting_value_entity.dart';
import 'package:bitti/domain/entities/topics/topic_type_settings_entity.dart';

class ToggleTopicTypeSettingsEntity extends TopicTypeSettingsEntity {
  List<ToggleSettingValueEntity> values;

  ToggleTopicTypeSettingsEntity({
    required this.values,
  });
}
