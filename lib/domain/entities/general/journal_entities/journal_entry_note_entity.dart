import 'package:bitti/domain/entities/entity.dart';

class JournalEntryNoteEntity extends Entity {
  final String title;
  final String content;

  const JournalEntryNoteEntity({
    required this.title,
    required this.content,
  });
}
