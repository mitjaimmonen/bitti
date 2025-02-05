import 'package:bitti/domain/entities/entity.dart';
import 'package:flutter/material.dart';

class TopicSettingValueToggleEntity extends Entity {
  final String? iconName;
  final String? label;
  final Color color;

  const TopicSettingValueToggleEntity({
    required this.iconName,
    required this.label,
    required this.color,
  });
}
