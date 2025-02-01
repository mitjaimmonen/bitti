import 'package:bitti/domain/entities/entity.dart';
import 'package:bitti/domain/entities/general/journal_entities/journal_entry_entity_base.dart';

class JournalsResponseEntity extends ResponseEntity {
  final List<JournalEntryEntityBase> journals;

  const JournalsResponseEntity({
    required this.journals,
  });
}
