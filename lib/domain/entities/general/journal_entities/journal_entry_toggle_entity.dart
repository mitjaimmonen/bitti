import 'package:bitti/domain/entities/entity.dart';

class JournalEntryToggleEntity extends Entity {
  final int toggleIndex;

  const JournalEntryToggleEntity({
    required this.toggleIndex,
  });
}
