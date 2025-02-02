import 'package:bitti/domain/entities/entity.dart';
import 'package:flutter/material.dart';

class TopicIconDataEntity extends Entity {
  final String assetPath;
  final Color color;

  const TopicIconDataEntity({
    required this.assetPath,
    required this.color,
  });
}
