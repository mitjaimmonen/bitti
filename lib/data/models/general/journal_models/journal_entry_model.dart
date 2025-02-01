import 'package:bitti/data/models/general/journal_models/journal_entry_note_model.dart';
import 'package:bitti/data/models/general/journal_models/journal_entry_number_model.dart';
import 'package:bitti/data/models/general/journal_models/journal_entry_toggle_model.dart';
import 'package:bitti/data/models/model.dart';
import 'package:bitti/domain/entities/general/journal_entities/journal_entry_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part '.generated/journal_entry_model.g.dart';

@JsonSerializable()
class JournalEntryModel extends Model<JournalEntryEntity> {
  final int id;
  final String date;

  final JournalEntryNoteModel? note;
  final JournalEntryNumberModel? number;
  final JournalEntryToggleModel? toggle;

  JournalEntryModel({
    required this.id,
    required this.date,
    required this.note,
    required this.number,
    required this.toggle,
  }) : assert(note != null || number != null || toggle != null);

  Map<String, dynamic> toJson() => _$JournalEntryModelToJson(this);

  factory JournalEntryModel.fromJson(Map<String, dynamic> json) =>
      _$JournalEntryModelFromJson(json);
}
