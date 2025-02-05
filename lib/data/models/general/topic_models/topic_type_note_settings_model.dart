import 'package:bitti/data/models/general/topic_models/topic_setting_value_note_model.dart';
import 'package:bitti/data/models/model.dart';
import 'package:bitti/domain/entities/general/topic_entities/topic_type_note_settings_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part '.generated/topic_type_note_settings_model.g.dart';

@JsonSerializable()
class TopicTypeNoteSettingsModel extends Model<TopicTypeNoteSettingsEntity> {
  final List<TopicSettingValueNoteModel> values;

  const TopicTypeNoteSettingsModel({
    required this.values,
  });

  Map<String, dynamic> toJson() => _$TopicTypeNoteSettingsModelToJson(this);

  factory TopicTypeNoteSettingsModel.fromJson(Map<String, dynamic> json) =>
      _$TopicTypeNoteSettingsModelFromJson(json);

  TopicTypeNoteSettingsEntity toEntity() {
    return TopicTypeNoteSettingsEntity(
      values: values.map((e) => e.toEntity()).toList(),
    );
  }

  factory TopicTypeNoteSettingsModel.fromEntity(
      TopicTypeNoteSettingsEntity entity) {
    return TopicTypeNoteSettingsModel(
      values: entity.values
          .map((e) => TopicSettingValueNoteModel.fromEntity(e))
          .toList(),
    );
  }
}
