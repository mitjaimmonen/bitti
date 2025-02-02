import 'package:bitti/domain/entities/entity.dart';
import 'package:bitti/domain/entities/general/journal_entities/journal_entry_entity.dart';

class JournalUpdateParamEntity extends ParamEntity {
  final int topicId;
  final JournalEntryEntity journal;

  const JournalUpdateParamEntity({
    required this.topicId,
    required this.journal,
  });
}
