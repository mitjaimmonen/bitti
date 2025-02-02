import 'package:bitti/domain/entities/entity.dart';
import 'package:bitti/domain/entities/general/journal_entities/journal_entry_note_entity.dart';
import 'package:bitti/domain/entities/general/journal_entities/journal_entry_number_entity.dart';
import 'package:bitti/domain/entities/general/journal_entities/journal_entry_toggle_entity.dart';

/// In order for data models json conversion to work, each type of entry must be
/// defined explicitly.
class JournalEntryEntity extends Entity {
  final int id;
  final DateTime date;
  final JournalEntryNoteEntity? journalNote;
  final JournalEntryNumberEntity? journalNumber;
  final JournalEntryToggleEntity? journalToggle;

  const JournalEntryEntity({
    required this.id,
    required this.date,
    required this.journalNote,
    required this.journalNumber,
    required this.journalToggle,
  }) : assert(journalNote != null ||
            journalNumber != null ||
            journalToggle != null);
}
