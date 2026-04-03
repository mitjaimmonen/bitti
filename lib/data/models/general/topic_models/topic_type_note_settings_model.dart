import 'package:bitti/data/models/model.dart';
import 'package:bitti/domain/entities/general/topic_entities/topic_type_note_settings_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part '.generated/topic_type_note_settings_model.g.dart';

@JsonSerializable()
class TopicTypeNoteSettingsModel extends Model<TopicTypeNoteSettingsEntity> {
  final bool displayInJournal;
  final bool displayInNotes;

  const TopicTypeNoteSettingsModel({
    required this.displayInJournal,
    required this.displayInNotes,
  });

  Map<String, dynamic> toJson() => _$TopicTypeNoteSettingsModelToJson(this);

  factory TopicTypeNoteSettingsModel.fromJson(Map<String, dynamic> json) =>
      _$TopicTypeNoteSettingsModelFromJson(json);

  TopicTypeNoteSettingsEntity toEntity() {
    return TopicTypeNoteSettingsEntity(
      displayInJournal: displayInJournal,
      displayInNotes: displayInNotes,
    );
  }

  factory TopicTypeNoteSettingsModel.fromEntity(
    TopicTypeNoteSettingsEntity entity,
  ) {
    return TopicTypeNoteSettingsModel(
      displayInJournal: entity.displayInJournal,
      displayInNotes: entity.displayInNotes,
    );
  }
}
