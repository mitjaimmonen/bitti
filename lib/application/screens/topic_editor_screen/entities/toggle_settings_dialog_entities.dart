import 'package:bitti/domain/entities/general/topic_entities/topic_type_toggle_settings_entity.dart';
import 'package:flutter/material.dart';

class ToggleSettingsDialogExtraEntity {
  final TopicTypeToggleSettingsEntity? toggleSettings;
  final Color? color;

  const ToggleSettingsDialogExtraEntity({
    this.toggleSettings,
    this.color,
  });
}

class ToggleSettingsDialogReturnEntity {
  final TopicTypeToggleSettingsEntity toggleSettings;

  const ToggleSettingsDialogReturnEntity({
    required this.toggleSettings,
  });
}
