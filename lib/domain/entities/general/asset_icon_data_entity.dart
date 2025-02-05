import 'package:bitti/domain/entities/entity.dart';
import 'package:flutter/material.dart';

class AssetIconDataEntity extends Entity {
  final String assetPath;
  final Color color;

  const AssetIconDataEntity({
    required this.assetPath,
    required this.color,
  });
}
