import 'package:bitti/domain/entities/entity.dart';
import 'package:bitti/domain/entities/general/journal_entities/journal_entry_entity_base.dart';

class JournalResponseEntity extends ResponseEntity {
  final JournalEntryEntityBase journal;

  const JournalResponseEntity({
    required this.journal,
  });
}
