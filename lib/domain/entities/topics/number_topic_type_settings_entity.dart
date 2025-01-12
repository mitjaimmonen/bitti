import 'package:bitti/domain/entities/topics/number_setting_value_entity.dart';
import 'package:bitti/domain/entities/topics/topic_type_settings_entity.dart';

class NumberTopicTypeSettingsEntity extends TopicTypeSettingsEntity {
  List<NumberSettingValueEntity> values;

  NumberTopicTypeSettingsEntity({
    required this.values,
  });
}
