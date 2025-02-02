import 'package:bitti/domain/entities/entity.dart';
import 'package:bitti/domain/entities/general/journal_entities/journal_entry_entity.dart';

class JournalResponseEntity extends ResponseEntity {
  final JournalEntryEntity journal;

  const JournalResponseEntity({
    required this.journal,
  });
}
