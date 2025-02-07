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

  TopicSettingValueToggleEntity copyWith({
    String? iconName,
    String? label,
    Color? color,
  }) {
    return TopicSettingValueToggleEntity(
      iconName: iconName ?? this.iconName,
      label: label ?? this.label,
      color: color ?? this.color,
    );
  }
}
