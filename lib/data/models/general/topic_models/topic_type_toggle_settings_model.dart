import 'package:bitti/data/models/general/topic_models/topic_setting_value_toggle_model.dart';
import 'package:bitti/data/models/model.dart';
import 'package:bitti/domain/entities/general/topic_entities/topic_type_toggle_settings_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part '.generated/topic_type_toggle_settings_model.g.dart';

@JsonSerializable()
class TopicTypeToggleSettingsModel
    extends Model<TopicTypeToggleSettingsEntity> {
  final List<TopicSettingValueToggleModel> values;

  const TopicTypeToggleSettingsModel({
    required this.values,
  });

  Map<String, dynamic> toJson() => _$TopicTypeToggleSettingsModelToJson(this);

  factory TopicTypeToggleSettingsModel.fromJson(Map<String, dynamic> json) =>
      _$TopicTypeToggleSettingsModelFromJson(json);

  TopicTypeToggleSettingsEntity toEntity() {
    return TopicTypeToggleSettingsEntity(
      values: values.map((e) => e.toEntity()).toList(),
    );
  }

  factory TopicTypeToggleSettingsModel.fromEntity(
      TopicTypeToggleSettingsEntity entity) {
    return TopicTypeToggleSettingsModel(
      values: entity.values
          .map((e) => TopicSettingValueToggleModel.fromEntity(e))
          .toList(),
    );
  }
}
