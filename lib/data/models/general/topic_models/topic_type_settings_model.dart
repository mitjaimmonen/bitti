import 'package:bitti/data/models/general/topic_models/topic_type_note_settings_model.dart';
import 'package:bitti/data/models/general/topic_models/topic_type_number_settings_model.dart';
import 'package:bitti/data/models/general/topic_models/topic_type_toggle_settings_model.dart';
import 'package:bitti/data/models/model.dart';
import 'package:bitti/domain/entities/general/topic_entities/topic_type_settings_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part '.generated/topic_type_settings_model.g.dart';

@JsonSerializable()
class TopicTypeSettingsModel extends Model<TopicTypeSettingsEntity> {
  final TopicTypeNoteSettingsModel? noteSettings;
  final TopicTypeNumberSettingsModel? numberSettings;
  final TopicTypeToggleSettingsModel? toggleSettings;

  const TopicTypeSettingsModel({
    required this.noteSettings,
    required this.numberSettings,
    required this.toggleSettings,
  }) : assert(noteSettings != null ||
            numberSettings != null ||
            toggleSettings != null);

  Map<String, dynamic> toJson() => _$TopicTypeSettingsModelToJson(this);

  factory TopicTypeSettingsModel.fromJson(Map<String, dynamic> json) =>
      _$TopicTypeSettingsModelFromJson(json);

  TopicTypeSettingsEntity toEntity() {
    return TopicTypeSettingsEntity(
      noteSettings: noteSettings?.toEntity(),
      numberSettings: numberSettings?.toEntity(),
      toggleSettings: toggleSettings?.toEntity(),
    );
  }

  factory TopicTypeSettingsModel.fromEntity(TopicTypeSettingsEntity entity) {
    return TopicTypeSettingsModel(
      noteSettings: entity.noteSettings != null
          ? TopicTypeNoteSettingsModel.fromEntity(entity.noteSettings!)
          : null,
      numberSettings: entity.numberSettings != null
          ? TopicTypeNumberSettingsModel.fromEntity(entity.numberSettings!)
          : null,
      toggleSettings: entity.toggleSettings != null
          ? TopicTypeToggleSettingsModel.fromEntity(entity.toggleSettings!)
          : null,
    );
  }
}
