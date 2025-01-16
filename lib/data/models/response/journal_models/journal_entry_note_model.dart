import 'package:bitti/data/models/response/journal_models/journal_entry_model.dart';
import 'package:bitti/domain/entities/general/journal_entities/journal_entry_note_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part '.generated/journal_entry_note_model.g.dart';

@JsonSerializable()
class JournalEntryNoteModel extends JournalEntryModel<JournalEntryNoteEntity> {
  final String title;
  final String content;

  JournalEntryNoteModel({
    required super.id,
    required super.date,
    required this.title,
    required this.content,
  });

  @override
  Map<String, dynamic> toJson() => _$JournalEntryNoteModelToJson(this);

  factory JournalEntryNoteModel.fromJson(Map<String, dynamic> json) =>
      _$JournalEntryNoteModelFromJson(json);
}
