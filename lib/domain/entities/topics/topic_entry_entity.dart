import 'package:bitti/domain/entities/entity.dart';
import 'package:bitti/domain/entities/topics/topic_type_settings_entity.dart';
import 'package:bitti/domain/enums/topic_type.dart';
import 'package:flutter/material.dart';

class TopicEntity extends Entity {
  final int id;
  final String name;
  final String description;
  final DateTime startDate;
  final IconData icon;
  final Color color;
  final TopicType topicType;
  final TopicTypeSettingsEntity topicTypeSettings;

  TopicEntity({
    required this.id,
    required this.name,
    required this.description,
    required this.startDate,
    required this.icon,
    required this.color,
    required this.topicType,
    required this.topicTypeSettings,
  });
}
