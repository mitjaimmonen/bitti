import 'package:bitti/data/models/model.dart';
import 'package:bitti/domain/entities/general/topic_entities/topic_setting_value_number_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part '.generated/topic_setting_value_number_model.g.dart';

@JsonSerializable()
class TopicSettingValueNumberModel
    extends Model<TopicSettingValueNumberEntity> {
  final int min;
  final int max;

  const TopicSettingValueNumberModel({
    required this.min,
    required this.max,
  });

  Map<String, dynamic> toJson() => _$TopicSettingValueNumberModelToJson(this);

  factory TopicSettingValueNumberModel.fromJson(Map<String, dynamic> json) =>
      _$TopicSettingValueNumberModelFromJson(json);

  TopicSettingValueNumberEntity toEntity() {
    return TopicSettingValueNumberEntity(
      min: min,
      max: max,
    );
  }

  factory TopicSettingValueNumberModel.fromEntity(
      TopicSettingValueNumberEntity entity) {
    return TopicSettingValueNumberModel(
      min: entity.min,
      max: entity.max,
    );
  }
}
