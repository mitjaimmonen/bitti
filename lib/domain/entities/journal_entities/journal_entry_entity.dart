import 'package:bitti/domain/entities/entity.dart';

abstract class JournalEntryEntity extends Entity {
  final int id;
  final DateTime date;

  JournalEntryEntity({
    required this.id,
    required this.date,
  });
}
