import 'package:bitti/data/models/response/journal_models/topic_setting_value_toggle_model.dart';
import 'package:bitti/domain/entities/response/topic_entities/topic_type_settings_entity_base.dart';
import 'package:json_annotation/json_annotation.dart';

part '.generated/topic_type_toggle_settings_model.g.dart';

@JsonSerializable()
class TopicTypeToggleSettingsEntity extends TopicTypeSettingsEntityBase {
  List<TopicSettingValueToggleModel> values;

  TopicTypeToggleSettingsEntity({
    required this.values,
  });

  @override
  Map<String, dynamic> toJson() => _$TopicTypeToggleSettingsEntityToJson(this);

  factory TopicTypeToggleSettingsEntity.fromJson(Map<String, dynamic> json) =>
      _$TopicTypeToggleSettingsEntityFromJson(json);
}
