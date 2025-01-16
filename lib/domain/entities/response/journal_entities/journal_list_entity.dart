import 'package:bitti/domain/entities/entity.dart';
import 'package:bitti/domain/entities/response/journal_entities/journal_entry_entity_base.dart';

class JournalListEntity extends Entity {
  final List<JournalEntryEntityBase> journals;

  const JournalListEntity({
    required this.journals,
  });
}
