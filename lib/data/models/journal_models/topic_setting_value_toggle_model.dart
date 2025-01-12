import 'package:bitti/data/models/model.dart';
import 'package:bitti/domain/entities/journal_entities/topic_setting_value_toggle_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part '.generated/topic_setting_value_toggle_model.g.dart';

@JsonSerializable()
class TopicSettingValueToggleModel
    extends Model<TopicSettingValueToggleEntity> {
  final String? icon;
  final String? label;
  final int color;

  TopicSettingValueToggleModel({
    required this.icon,
    required this.label,
    required this.color,
  });

  @override
  Map<String, dynamic> toJson() => _$TopicSettingValueToggleModelToJson(this);

  factory TopicSettingValueToggleModel.fromJson(Map<String, dynamic> json) =>
      _$TopicSettingValueToggleModelFromJson(json);
}
