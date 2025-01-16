import 'package:bitti/data/models/response/journal_models/topic_setting_value_note_model.dart';
import 'package:bitti/data/models/response/journal_models/topic_type_settings_model.dart';
import 'package:bitti/domain/entities/general/topic_entities/topic_type_note_settings_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part '.generated/topic_type_note_settings_model.g.dart';

@JsonSerializable()
class TopicTypeNoteSettingsModel
    extends TopicTypeSettingsModel<TopicTypeNoteSettingsEntity> {
  List<TopicSettingValueNoteModel> values;

  TopicTypeNoteSettingsModel({
    required this.values,
  });

  @override
  Map<String, dynamic> toJson() => _$TopicTypeNoteSettingsModelToJson(this);

  factory TopicTypeNoteSettingsModel.fromJson(Map<String, dynamic> json) =>
      _$TopicTypeNoteSettingsModelFromJson(json);
}
