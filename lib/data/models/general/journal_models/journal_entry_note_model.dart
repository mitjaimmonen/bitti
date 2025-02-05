import 'package:bitti/data/models/model.dart';
import 'package:bitti/domain/entities/general/journal_entities/journal_entry_note_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part '.generated/journal_entry_note_model.g.dart';

@JsonSerializable()
class JournalEntryNoteModel extends Model<JournalEntryNoteEntity> {
  final String title;
  final String content;

  const JournalEntryNoteModel({
    required this.title,
    required this.content,
  });

  Map<String, dynamic> toJson() => _$JournalEntryNoteModelToJson(this);

  factory JournalEntryNoteModel.fromJson(Map<String, dynamic> json) =>
      _$JournalEntryNoteModelFromJson(json);

  JournalEntryNoteEntity toEntity() {
    return JournalEntryNoteEntity(
      title: title,
      content: content,
    );
  }

  factory JournalEntryNoteModel.fromEntity(JournalEntryNoteEntity entity) {
    return JournalEntryNoteModel(
      title: entity.title,
      content: entity.content,
    );
  }
}
