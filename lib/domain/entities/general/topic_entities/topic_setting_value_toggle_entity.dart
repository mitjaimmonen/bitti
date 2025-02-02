import 'package:bitti/domain/entities/entity.dart';
import 'package:bitti/domain/entities/general/topic_entities/topic_icon_data_entity.dart';
import 'package:flutter/material.dart';

class TopicSettingValueToggleEntity extends Entity {
  final TopicIconDataEntity? icon;
  final String? label;
  final Color color;

  const TopicSettingValueToggleEntity({
    required this.icon,
    required this.label,
    required this.color,
  });
}
