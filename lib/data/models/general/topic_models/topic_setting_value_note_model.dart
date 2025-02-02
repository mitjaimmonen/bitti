import 'package:bitti/data/models/model.dart';
import 'package:bitti/domain/entities/general/topic_entities/topic_setting_value_note_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part '.generated/topic_setting_value_note_model.g.dart';

@JsonSerializable()
class TopicSettingValueNoteModel extends Model<TopicSettingValueNoteEntity> {
  final bool displayInJournal;
  final bool displayInNotes;

  TopicSettingValueNoteModel({
    required this.displayInJournal,
    required this.displayInNotes,
  });

  Map<String, dynamic> toJson() => _$TopicSettingValueNoteModelToJson(this);

  factory TopicSettingValueNoteModel.fromJson(Map<String, dynamic> json) =>
      _$TopicSettingValueNoteModelFromJson(json);

  TopicSettingValueNoteEntity toEntity() {
    return TopicSettingValueNoteEntity(
      displayInJournal: displayInJournal,
      displayInNotes: displayInNotes,
    );
  }

  factory TopicSettingValueNoteModel.fromEntity(
      TopicSettingValueNoteEntity entity) {
    return TopicSettingValueNoteModel(
      displayInJournal: entity.displayInJournal,
      displayInNotes: entity.displayInNotes,
    );
  }
}
