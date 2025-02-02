import 'package:bitti/data/models/general/topic_models/topic_setting_value_number_model.dart';
import 'package:bitti/data/models/model.dart';
import 'package:bitti/domain/entities/general/topic_entities/topic_type_number_settings_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part '.generated/topic_type_number_settings_model.g.dart';

@JsonSerializable()
class TopicTypeNumberSettingsModel
    extends Model<TopicTypeNumberSettingsEntity> {
  List<TopicSettingValueNumberModel> values;

  TopicTypeNumberSettingsModel({
    required this.values,
  });

  Map<String, dynamic> toJson() => _$TopicTypeNumberSettingsModelToJson(this);

  factory TopicTypeNumberSettingsModel.fromJson(Map<String, dynamic> json) =>
      _$TopicTypeNumberSettingsModelFromJson(json);

  TopicTypeNumberSettingsEntity toEntity() {
    return TopicTypeNumberSettingsEntity(
      values: values.map((e) => e.toEntity()).toList(),
    );
  }

  factory TopicTypeNumberSettingsModel.fromEntity(
      TopicTypeNumberSettingsEntity entity) {
    return TopicTypeNumberSettingsModel(
      values: entity.values
          .map((e) => TopicSettingValueNumberModel.fromEntity(e))
          .toList(),
    );
  }
}
