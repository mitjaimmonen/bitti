import 'package:bitti/domain/entities/entity.dart';
import 'package:bitti/domain/entities/general/icon_entry_entity.dart';

class IconResponseEntity extends ResponseEntity {
  final IconEntryEntity entry;

  const IconResponseEntity({
    required this.entry,
  });
}
