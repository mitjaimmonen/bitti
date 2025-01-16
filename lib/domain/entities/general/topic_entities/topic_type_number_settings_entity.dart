import 'package:bitti/domain/entities/general/topic_entities/topic_setting_value_number_entity.dart';
import 'package:bitti/domain/entities/general/topic_entities/topic_type_settings_entity_base.dart';

class TopicTypeNumberSettingsEntity extends TopicTypeSettingsEntityBase {
  final List<TopicSettingValueNumberEntity> values;

  const TopicTypeNumberSettingsEntity({
    required this.values,
  });
}
