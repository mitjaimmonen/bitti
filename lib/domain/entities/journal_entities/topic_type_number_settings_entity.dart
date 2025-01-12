import 'package:bitti/domain/entities/journal_entities/topic_setting_value_number_entity.dart';
import 'package:bitti/domain/entities/journal_entities/topic_type_settings_entity.dart';

class TopicTypeNumberSettingsEntity extends TopicTypeSettingsEntity {
  List<TopicSettingValueNumberEntity> values;

  TopicTypeNumberSettingsEntity({
    required this.values,
  });
}
