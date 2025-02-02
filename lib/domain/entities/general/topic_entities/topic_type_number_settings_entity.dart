import 'package:bitti/domain/entities/entity.dart';
import 'package:bitti/domain/entities/general/topic_entities/topic_setting_value_number_entity.dart';

class TopicTypeNumberSettingsEntity extends Entity {
  final List<TopicSettingValueNumberEntity> values;

  const TopicTypeNumberSettingsEntity({
    required this.values,
  });
}
