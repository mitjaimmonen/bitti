import 'package:bitti/domain/entities/journal_entities/journal_entry_entity.dart';

class JournalEntryNoteEntity extends JournalEntryEntity {
  final String title;
  final String content;

  JournalEntryNoteEntity({
    required super.id,
    required super.date,
    required this.title,
    required this.content,
  });
}
