import 'package:bitti/domain/entities/entity.dart';

abstract class JournalEntryEntityBase extends Entity {
  final int id;
  final DateTime date;

  const JournalEntryEntityBase({
    required this.id,
    required this.date,
  });
}
