import 'package:bitti/domain/entities/response/journal_entities/journal_entry_entity_base.dart';

class JournalEntryToggleEntity extends JournalEntryEntityBase {
  final int toggleIndex;

  const JournalEntryToggleEntity({
    required super.id,
    required super.date,
    required this.toggleIndex,
  });
}
