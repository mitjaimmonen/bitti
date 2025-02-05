import 'dart:typed_data';

import 'package:bitti/domain/entities/entity.dart';

class IconEntryEntity extends Entity {
  final Uint8List icon;

  const IconEntryEntity({
    required this.icon,
  });
}
