import 'package:bitti/domain/entities/journal_entities/journal_entry_entity.dart';

class JournalEntryToggleEntity extends JournalEntryEntity {
  final int toggleIndex;

  JournalEntryToggleEntity({
    required super.id,
    required super.date,
    required this.toggleIndex,
  });
}
