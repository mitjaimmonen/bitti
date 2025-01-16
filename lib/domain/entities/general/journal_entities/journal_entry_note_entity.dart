import 'package:bitti/domain/entities/general/journal_entities/journal_entry_entity_base.dart';

class JournalEntryNoteEntity extends JournalEntryEntityBase {
  final String title;
  final String content;

  const JournalEntryNoteEntity({
    required super.id,
    required super.date,
    required this.title,
    required this.content,
  });
}
