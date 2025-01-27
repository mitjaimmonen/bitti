import 'package:bitti/data/models/response/journal_models/topic_setting_value_number_model.dart';
import 'package:bitti/data/models/response/journal_models/topic_type_settings_model.dart';
import 'package:bitti/domain/entities/general/topic_entities/topic_type_number_settings_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part '.generated/topic_type_number_settings_model.g.dart';

@JsonSerializable()
class TopicTypeNumberSettingsModel
    extends TopicTypeSettingsModel<TopicTypeNumberSettingsEntity> {
  List<TopicSettingValueNumberModel> values;

  TopicTypeNumberSettingsModel({
    required this.values,
  });

  @override
  Map<String, dynamic> toJson() => _$TopicTypeNumberSettingsModelToJson(this);

  factory TopicTypeNumberSettingsModel.fromJson(Map<String, dynamic> json) =>
      _$TopicTypeNumberSettingsModelFromJson(json);
}
