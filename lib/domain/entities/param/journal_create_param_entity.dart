import 'package:bitti/domain/entities/entity.dart';
import 'package:bitti/domain/entities/general/journal_entities/journal_entry_entity.dart';

class JournalCreateParamEntity extends ParamEntity {
  final int topicId;
  final JournalEntryEntity journal;

  const JournalCreateParamEntity({
    required this.topicId,
    required this.journal,
  });
}
