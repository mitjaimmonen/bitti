import 'package:bitti/domain/entities/entity.dart';
import 'package:bitti/domain/entities/general/topic_entities/topic_setting_value_toggle_entity.dart';

class TopicTypeToggleSettingsEntity extends Entity {
  final List<TopicSettingValueToggleEntity> values;

  const TopicTypeToggleSettingsEntity({
    required this.values,
  });

  TopicTypeToggleSettingsEntity copyWith({
    List<TopicSettingValueToggleEntity>? values,
  }) {
    return TopicTypeToggleSettingsEntity(
      values: values ?? this.values.map((e) => e.copyWith()).toList(),
    );
  }
}
