import 'package:bitti/domain/entities/entity.dart';
import 'package:bitti/domain/entities/general/topic_entities/topic_type_settings_entity_base.dart';
import 'package:bitti/domain/enums/topic_type.dart';
import 'package:flutter/material.dart';

class TopicEntryEntity extends Entity {
  final int id;
  final String name;
  final String description;
  final DateTime startDate;
  final IconData icon;
  final Color color;
  final TopicType topicType;
  final TopicTypeSettingsEntityBase topicTypeSettings;

  const TopicEntryEntity({
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
