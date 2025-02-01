import 'package:bitti/domain/entities/entity.dart';
import 'package:bitti/domain/entities/general/journal_entities/journal_entry_entity_base.dart';

class JournalUpdateParamEntity extends ParamEntity {
  final int topicId;
  final JournalEntryEntityBase journalEntry;

  const JournalUpdateParamEntity({
    required this.topicId,
    required this.journalEntry,
  });
}
