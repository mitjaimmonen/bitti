import 'package:bitti/domain/entities/general/journal_entities/journal_entry_entity_base.dart';

class JournalEntryNumberEntity extends JournalEntryEntityBase {
  final int number;

  const JournalEntryNumberEntity({
    required super.id,
    required super.date,
    required this.number,
  });
}
