import 'package:bitti/domain/entities/general/topic_entities/topic_type_toggle_settings_entity.dart';
import 'package:flutter/material.dart';

class ToggleSettingsDialogExtraViewModel {
  final TopicTypeToggleSettingsEntity? toggleSettings;
  final Color? color;

  const ToggleSettingsDialogExtraViewModel({
    this.toggleSettings,
    this.color,
  });
}

class ToggleSettingsDialogReturnViewModel {
  final TopicTypeToggleSettingsEntity toggleSettings;

  const ToggleSettingsDialogReturnViewModel({
    required this.toggleSettings,
  });
}
