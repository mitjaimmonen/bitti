import 'package:bitti/domain/entities/entity.dart';
import 'package:flutter/material.dart';

class ToggleSettingValueEntity extends Entity {
  final IconData? icon;
  final String? label;
  final Color color;

  ToggleSettingValueEntity({
    required this.icon,
    required this.label,
    required this.color,
  });
}
