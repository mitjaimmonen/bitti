import 'package:bitti/data/models/response/journal_models/topic_setting_value_toggle_model.dart';
import 'package:bitti/domain/entities/general/topic_entities/topic_type_settings_entity_base.dart';
import 'package:json_annotation/json_annotation.dart';

part '.generated/topic_type_toggle_settings_model.g.dart';

@JsonSerializable()
class TopicTypeToggleSettingsModel extends TopicTypeSettingsEntityBase {
  final List<TopicSettingValueToggleModel> values;

  const TopicTypeToggleSettingsModel({
    required this.values,
  });

  Map<String, dynamic> toJson() => _$TopicTypeToggleSettingsEntityToJson(this);

  factory TopicTypeToggleSettingsModel.fromJson(Map<String, dynamic> json) =>
      _$TopicTypeToggleSettingsEntityFromJson(json);
}
