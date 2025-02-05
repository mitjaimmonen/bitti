import 'dart:ui';

import 'package:bitti/data/models/model.dart';
import 'package:bitti/domain/entities/general/topic_entities/topic_setting_value_toggle_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part '.generated/topic_setting_value_toggle_model.g.dart';

@JsonSerializable()
class TopicSettingValueToggleModel
    extends Model<TopicSettingValueToggleEntity> {
  final String? iconName;
  final String? label;
  final int color;

  const TopicSettingValueToggleModel({
    required this.iconName,
    required this.label,
    required this.color,
  });

  Map<String, dynamic> toJson() => _$TopicSettingValueToggleModelToJson(this);

  factory TopicSettingValueToggleModel.fromJson(Map<String, dynamic> json) =>
      _$TopicSettingValueToggleModelFromJson(json);

  TopicSettingValueToggleEntity toEntity() {
    return TopicSettingValueToggleEntity(
      iconName: iconName,
      label: label,
      color: Color(color),
    );
  }

  factory TopicSettingValueToggleModel.fromEntity(
      TopicSettingValueToggleEntity entity) {
    return TopicSettingValueToggleModel(
      iconName: entity.iconName,
      label: entity.label,
      color: entity.color.toARGB32(),
    );
  }
}
