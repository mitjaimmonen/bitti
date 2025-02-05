import 'dart:typed_data';

import 'package:bitti/data/models/model.dart';
import 'package:bitti/domain/entities/general/icon_entry_entity.dart';

class IconEntryModel extends Model<IconEntryEntity> {
  final Uint8List icon;

  const IconEntryModel({
    required this.icon,
  });

  factory IconEntryModel.fromEntity(IconEntryEntity entity) {
    return IconEntryModel(
      icon: entity.icon,
    );
  }

  IconEntryEntity toEntity() {
    return IconEntryEntity(
      icon: icon,
    );
  }
}
