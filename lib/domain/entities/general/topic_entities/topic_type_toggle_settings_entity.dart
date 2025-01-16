import 'package:bitti/domain/entities/general/topic_entities/topic_setting_value_toggle_entity.dart';
import 'package:bitti/domain/entities/general/topic_entities/topic_type_settings_entity_base.dart';

class TopicTypeToggleSettingsEntity extends TopicTypeSettingsEntityBase {
  final List<TopicSettingValueToggleEntity> values;

  const TopicTypeToggleSettingsEntity({
    required this.values,
  });
}
