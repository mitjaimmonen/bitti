import 'package:bitti/data/models/model.dart';
import 'package:bitti/domain/entities/journal_entities/topic_setting_value_number_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part '.generated/topic_setting_value_number_model.g.dart';

@JsonSerializable()
class TopicSettingValueNumberModel
    extends Model<TopicSettingValueNumberEntity> {
  final int min;
  final int max;

  TopicSettingValueNumberModel({
    required this.min,
    required this.max,
  });

  @override
  Map<String, dynamic> toJson() => _$TopicSettingValueNumberModelToJson(this);

  factory TopicSettingValueNumberModel.fromJson(Map<String, dynamic> json) =>
      _$TopicSettingValueNumberModelFromJson(json);
}
