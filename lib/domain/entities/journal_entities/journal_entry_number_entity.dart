import 'package:bitti/domain/entities/journal_entities/journal_entry_entity.dart';

class JournalEntryNumberEntity extends JournalEntryEntity {
  final int number;

  JournalEntryNumberEntity({
    required super.id,
    required super.date,
    required this.number,
  });
}
